//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <platform_device_id_windows/platform_device_id_windows_plugin.h>
#include <sentry_flutter/sentry_flutter_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  PlatformDeviceIdWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PlatformDeviceIdWindowsPlugin"));
  SentryFlutterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SentryFlutterPlugin"));
}
