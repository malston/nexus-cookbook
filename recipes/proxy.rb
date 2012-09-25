#
# Cookbook Name:: nexus
# Recipe:: proxy
#
# Copyright 2012, Riot Games
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
node[:nexus][:repository][:proxy].each do |repository|
  
  nexus_repository repository[:name] do
    action   :create
    type     "proxy"
    url      repository[:url]
  end

  nexus_repository repository[:name] do
    action      :update
    subscriber  repository[:subscriber]
  end

  nexus_repository repository[:name] do
    action      :update
    publisher  repository[:publisher]
  end
end