/*
 * Copyright (C) 2018 Pixel Experience
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.systemui.custom;

import android.content.om.IOverlayManager;
import android.os.RemoteException;
import android.util.Log;
import java.util.Arrays;
import java.util.List;

public class Themes {

    private static final String TAG = "Themes";

    private static final List<String> darkOverlays = Arrays.asList("com.android.system.theme.dark", 
                                                                   "com.android.settings.theme.dark", 
                                                                   "com.android.dui.theme.dark", 
                                                                   "com.android.gboard.theme.dark");

    private static final List<String> blackOverlays = Arrays.asList("com.android.system.theme.black", 
                                                                    "com.android.settings.theme.black", 
                                                                    "com.android.dui.theme.black", 
                                                                    "com.android.gboard.theme.black");

    public static void updateDarkOverlays(IOverlayManager mOverlayManager, Boolean enabled, int mCurrentUserId){
        for (String overlay : darkOverlays) {
            try {
                mOverlayManager.setEnabled(overlay, enabled, mCurrentUserId);
            } catch (RemoteException e) {
                Log.w(TAG, "Can't change theme", e);
            }
        }
    }

    public static void updateBlackOverlays(IOverlayManager mOverlayManager, Boolean enabled, int mCurrentUserId){
        for (String overlay : blackOverlays) {
            try {
                mOverlayManager.setEnabled(overlay, enabled, mCurrentUserId);
            } catch (RemoteException e) {
                Log.w(TAG, "Can't change theme", e);
            }
        }
    }
}
