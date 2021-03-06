# Copyright (C) 2018 The LiteOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------

# Add colors
ifneq ($(BUILD_WITH_COLORS),0)
  CL_RST="\033[0m"
  CL_YLW="\033[33m"
  CL_BLU="\033[34m"
  CL_CYN="\033[36m"
endif

# LiteOS test package
LITE_PAC_VERSION := $(LITE_BUILD_TYPE)-$(LITE_BUILD)-$(shell date +"%d%m%H%M")
LITE_OTA_PACKAGE := $(PRODUCT_OUT)/$(LITE_PAC_VERSION).zip

.PHONY: tpac
tpac: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(LITE_OTA_PACKAGE)
	@echo "Building: test package"
	@echo -e ${CL_BLU}${CL_CYN}"===============================-Package complete-==============================="${CL_RST}
	@echo -e ${CL_BLU}${CL_YLW}"Zip: "${CL_YLW} $(LITE_OTA_PACKAGE)${CL_RST}
	@echo -e ${CL_BLU}${CL_YLW}"Size:"${CL_YLW}" `du -sh $(LITE_OTA_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLU}${CL_CYN}"================================================================================"${CL_RST}
