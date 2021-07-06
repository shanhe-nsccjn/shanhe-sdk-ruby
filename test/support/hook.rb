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

Before do 
  load_test_config
  load_config
  init_shanhe_service
end

Before("@instance") do
  @instance_service = @shanhe_service.instance @test_config[:zone]
  @job_service = @shanhe_service.job @test_config[:zone]
end

Before("@image") do  
  @image_service = @shanhe_service.image @test_config[:zone]
  @job_service = @shanhe_service.job @test_config[:zone]
  @instance_service = @shanhe_service.instance @test_config[:zone]
end

Before("@vxnet") do  
  @vxnet_service = @shanhe_service.vxnet @test_config[:zone]
  @job_service = @shanhe_service.job @test_config[:zone]
  @instance_service = @shanhe_service.instance @test_config[:zone]
  @router_service = @shanhe_service.router @test_config[:zone]
end

Before("@eip") do
  @job_service = @shanhe_service.job @test_config[:zone]
  @instance_service = @shanhe_service.instance @test_config[:zone]
  @eip_service = @shanhe_service.eip @test_config[:zone]
  @vxnet_service = @shanhe_service.vxnet @test_config[:zone]
  @router_service = @shanhe_service.router @test_config[:zone]
end

Before("@key_pair") do
  @job_service = @shanhe_service.job @test_config[:zone]
  @instance_service = @shanhe_service.instance @test_config[:zone]
  @key_pair_service = @shanhe_service.key_pair @test_config[:zone]
end

Before("@tag") do
  @job_service = @shanhe_service.job @test_config[:zone]
  @instance_service = @shanhe_service.instance @test_config[:zone]
  @tag_service = @shanhe_service.tag @test_config[:zone]
end