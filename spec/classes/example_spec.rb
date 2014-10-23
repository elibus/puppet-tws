require 'spec_helper'

describe 'tws' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "tws class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('tws::params') }
        it { should contain_class('tws::install').that_comes_before('tws::config') }
        it { should contain_class('tws::config') }
        it { should contain_class('tws::service').that_subscribes_to('tws::config') }

        it { should contain_service('tws') }
        it { should contain_package('tws').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tws class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('tws') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
