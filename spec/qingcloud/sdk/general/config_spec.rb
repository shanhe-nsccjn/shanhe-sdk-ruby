#  +-------------------------------------------------------------------------
#  | Copyright (C) 2016 Yunify, Inc.
#  +-------------------------------------------------------------------------
#  | Licensed under the Apache License, Version 2.0 (the "License");
#  | you may not use this work except in compliance with the License.
#  | You may obtain a copy of the License in the LICENSE file, or at:
#  |
#  | http://www.apache.org/licenses/LICENSE-2.0
#  |
#  | Unless required by applicable law or agreed to in writing, software
#  | distributed under the License is distributed on an "AS IS" BASIS,
#  | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  | See the License for the specific language governing permissions and
#  | limitations under the License.
#  +-------------------------------------------------------------------------

require 'spec_helper'

module ShanHe
  module SDK
    RSpec.describe Config do
      it 'has a convenient initializer' do
        config = Config.init 'ACCESS_KEY_ID', 'SECRET_ACCESS_KEY'

        expect(config[:qy_access_key_id]).to eq 'ACCESS_KEY_ID'
        expect(config[:host]).to eq 'api.shanhe.com'
      end

      it 'can init with a specified config' do
        config = Config.new(qy_access_key_id:     'ACCESS_KEY_ID',
                            qy_secret_access_key: 'SECRET_ACCESS_KEY',
                            host:                 'api.shanhe.dev')
        expect(config[:qy_access_key_id]).to eq 'ACCESS_KEY_ID'
        expect(config[:host]).to eq 'api.shanhe.dev'
      end

      it 'can be updated' do
        config = Config.new.load_default_config
        config.update(log_level: 'debug')
        expect(config[:log_level]).to eq 'debug'
      end

      it 'can load default config file' do
        config = Config.new.load_default_config
        expect(config[:qy_access_key_id]).to be nil
        expect(config[:host]).to eq 'api.shanhe.com'
        expect(config[:log_level]).to eq 'warn'
      end

      it 'can load user config file' do
        config = Config.new.load_user_config
        expect(config[:host]).to_not be nil
        expect(config[:log_level]).to_not be nil
      end

      it 'can load config from file' do
        config = Config.new.load_config_from_file Contract::DEFAULT_CONFIG_FILEPATH
        expect(config[:qy_access_key_id]).to be nil
        expect(config[:host]).to eq 'api.shanhe.com'
        expect(config[:log_level]).to eq 'warn'
      end

      it 'has a connection in config' do
        config = Config.new.load_default_config
        expect(config.connection).to_not be nil
      end
    end
  end
end
