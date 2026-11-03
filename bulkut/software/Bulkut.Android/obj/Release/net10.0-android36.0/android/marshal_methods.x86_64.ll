; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [79 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [237 x i64] [
	i64 u0x02abedc11addc1ed, ; 0: lib_Mono.Android.Runtime.dll.so => 77
	i64 u0x032267b2a94db371, ; 1: lib_Xamarin.AndroidX.AppCompat.dll.so => 21
	i64 u0x0517ef04e06e9f76, ; 2: System.Net.Primitives => 59
	i64 u0x0581db89237110e9, ; 3: lib_System.Collections.dll.so => 42
	i64 u0x0600544dd3961080, ; 4: HarfBuzzSharp => 18
	i64 u0x07dcdc7460a0c5e4, ; 5: System.Collections.NonGeneric => 40
	i64 u0x08f3c9788ee2153c, ; 6: Xamarin.AndroidX.DrawerLayout => 24
	i64 u0x092266563089ae3e, ; 7: lib_System.Collections.NonGeneric.dll.so => 40
	i64 u0x09d144a7e214d457, ; 8: System.Security.Cryptography => 68
	i64 u0x0a78a8431e4734f8, ; 9: lib_Avalonia.Fonts.Inter.dll.so => 12
	i64 u0x0c59ad9fbbd43abe, ; 10: Mono.Android => 78
	i64 u0x0e14e73a54dda68e, ; 11: lib_System.Net.NameResolution.dll.so => 58
	i64 u0x102a31b45304b1da, ; 12: Xamarin.AndroidX.CustomView => 23
	i64 u0x10f6cfcbcf801616, ; 13: System.IO.Compression.Brotli => 50
	i64 u0x13f1e5e209e91af4, ; 14: lib_Java.Interop.dll.so => 76
	i64 u0x152a448bd1e745a7, ; 15: Microsoft.Win32.Primitives => 38
	i64 u0x16bf2a22df043a09, ; 16: System.IO.Pipes.dll => 53
	i64 u0x17f10bff77f05b2e, ; 17: Avalonia.Remote.Protocol => 14
	i64 u0x17f9358913beb16a, ; 18: System.Text.Encodings.Web => 70
	i64 u0x1a86fbe2485a9f00, ; 19: Avalonia.DesignerSupport.dll => 3
	i64 u0x1a91866a319e9259, ; 20: lib_System.Collections.Concurrent.dll.so => 39
	i64 u0x1aac34d1917ba5d3, ; 21: lib_System.dll.so => 74
	i64 u0x1c753b5ff15bce1b, ; 22: Mono.Android.Runtime.dll => 77
	i64 u0x1d3dd0218cdc9fa5, ; 23: Avalonia.Markup.Xaml => 5
	i64 u0x1da87c3fe68efc1d, ; 24: Avalonia.Vulkan.dll => 9
	i64 u0x1e1a605292ce6795, ; 25: Avalonia.Themes.Fluent => 16
	i64 u0x209375905fcc1bad, ; 26: lib_System.IO.Compression.Brotli.dll.so => 50
	i64 u0x20fab3cf2dfbc8df, ; 27: lib_System.Diagnostics.Process.dll.so => 48
	i64 u0x2174319c0d835bc9, ; 28: System.Runtime => 67
	i64 u0x224538d85ed15a82, ; 29: System.IO.Pipes => 53
	i64 u0x2407aef2bbe8fadf, ; 30: System.Console => 46
	i64 u0x240abe014b27e7d3, ; 31: Xamarin.AndroidX.Core.dll => 22
	i64 u0x2662c629b96b0b30, ; 32: lib_Xamarin.Kotlin.StdLib.dll.so => 33
	i64 u0x26c87620848dde27, ; 33: FFmpegKit.Net.FullGpl.Android => 17
	i64 u0x277e4a36150ed3a3, ; 34: Avalonia.Base.dll => 1
	i64 u0x27b410442fad6cf1, ; 35: Java.Interop.dll => 76
	i64 u0x2801845a2c71fbfb, ; 36: System.Net.Primitives.dll => 59
	i64 u0x2927d345f3daec35, ; 37: SkiaSharp.dll => 19
	i64 u0x2937d81e11ec0ddf, ; 38: Avalonia.Markup.Xaml.dll => 5
	i64 u0x2af298f63581d886, ; 39: System.Text.RegularExpressions.dll => 72
	i64 u0x2afc1c4f898552ee, ; 40: lib_System.Formats.Asn1.dll.so => 49
	i64 u0x2b17908826439236, ; 41: Avalonia.Metal.dll => 7
	i64 u0x2b52706233239866, ; 42: Avalonia.Remote.Protocol.dll => 14
	i64 u0x2d169d318a968379, ; 43: System.Threading.dll => 73
	i64 u0x2db915caf23548d2, ; 44: System.Text.Json.dll => 71
	i64 u0x2f02f94df3200fe5, ; 45: System.Diagnostics.Process => 48
	i64 u0x309ee9eeec09a71e, ; 46: lib_Xamarin.AndroidX.Fragment.dll.so => 25
	i64 u0x31195fef5d8fb552, ; 47: _Microsoft.Android.Resource.Designer.dll => 0
	i64 u0x312c8ed623cbfc8d, ; 48: Xamarin.AndroidX.Window.dll => 32
	i64 u0x341abc357fbb4ebf, ; 49: lib_System.Net.Sockets.dll.so => 61
	i64 u0x385c17636bb6fe6e, ; 50: Xamarin.AndroidX.CustomView.dll => 23
	i64 u0x38869c811d74050e, ; 51: System.Net.NameResolution.dll => 58
	i64 u0x3a51880eea7585d2, ; 52: lib_Avalonia.Markup.Xaml.dll.so => 5
	i64 u0x3b860f9932505633, ; 53: lib_System.Text.Encoding.Extensions.dll.so => 69
	i64 u0x3be99b43dd39dd37, ; 54: Xamarin.AndroidX.SavedState.SavedState.Android => 31
	i64 u0x3c7c495f58ac5ee9, ; 55: Xamarin.Kotlin.StdLib => 33
	i64 u0x3d35282e52245958, ; 56: Bulkut.Shared => 36
	i64 u0x3d9c2a242b040a50, ; 57: lib_Xamarin.AndroidX.Core.dll.so => 22
	i64 u0x4125358d890aaf57, ; 58: Bulkut.Core.dll => 35
	i64 u0x434c4e1d9284cdae, ; 59: Mono.Android.dll => 78
	i64 u0x4515080865a951a5, ; 60: Xamarin.Kotlin.StdLib.dll => 33
	i64 u0x4972c623c86d2c28, ; 61: lib_Avalonia.DesignerSupport.dll.so => 3
	i64 u0x49e952f19a4e2022, ; 62: System.ObjectModel => 62
	i64 u0x4a2b78d721357cc7, ; 63: Bulkut.Android.dll => 37
	i64 u0x4ab01d3ffaf3dd27, ; 64: lib_Avalonia.Dialogs.dll.so => 4
	i64 u0x4b7b6532ded934b7, ; 65: System.Text.Json => 71
	i64 u0x4ca7077b553ba065, ; 66: Avalonia.Controls => 2
	i64 u0x4cc5f15266470798, ; 67: lib_Xamarin.AndroidX.Loader.dll.so => 29
	i64 u0x4d479f968a05e504, ; 68: System.Linq.Expressions.dll => 54
	i64 u0x4d55a010ffc4faff, ; 69: System.Private.Xml => 64
	i64 u0x4d6f94aa6b878efe, ; 70: lib_Bulkut.Core.dll.so => 35
	i64 u0x4dd9247f1d2c3235, ; 71: Xamarin.AndroidX.Loader.dll => 29
	i64 u0x4e32f00cb0937401, ; 72: Mono.Android.Runtime => 77
	i64 u0x5131bbe80989093f, ; 73: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 28
	i64 u0x526ce79eb8e90527, ; 74: lib_System.Net.Primitives.dll.so => 59
	i64 u0x529ffe06f39ab8db, ; 75: Xamarin.AndroidX.Core => 22
	i64 u0x54795225dd1587af, ; 76: lib_System.Runtime.dll.so => 67
	i64 u0x556e8b63b660ab8b, ; 77: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 26
	i64 u0x5588627c9a108ec9, ; 78: System.Collections.Specialized => 41
	i64 u0x571c5cfbec5ae8e2, ; 79: System.Private.Uri => 63
	i64 u0x579a06fed6eec900, ; 80: System.Private.CoreLib.dll => 75
	i64 u0x57c542c14049b66d, ; 81: System.Diagnostics.DiagnosticSource => 47
	i64 u0x5a8f6699f4a1caa9, ; 82: lib_System.Threading.dll.so => 73
	i64 u0x5ae9cd33b15841bf, ; 83: System.ComponentModel => 45
	i64 u0x5db0cbbd1028510e, ; 84: lib_System.Runtime.InteropServices.dll.so => 65
	i64 u0x5e361f1dfaff19f1, ; 85: Avalonia.Fonts.Inter.dll => 12
	i64 u0x5e467bc8f09ad026, ; 86: System.Collections.Specialized.dll => 41
	i64 u0x5ea92fdb19ec8c4c, ; 87: System.Text.Encodings.Web.dll => 70
	i64 u0x5eb8046dd40e9ac3, ; 88: System.ComponentModel.Primitives => 43
	i64 u0x60cd4e33d7e60134, ; 89: Xamarin.KotlinX.Coroutines.Core.Jvm => 34
	i64 u0x60f62d786afcf130, ; 90: System.Memory => 56
	i64 u0x622eef6f9e59068d, ; 91: System.Private.CoreLib => 75
	i64 u0x6376ee64ab136329, ; 92: lib_Avalonia.Themes.Fluent.dll.so => 16
	i64 u0x641c60df5c993ae3, ; 93: Avalonia.DesignerSupport => 3
	i64 u0x65ece51227bfa724, ; 94: lib_System.Runtime.Numerics.dll.so => 66
	i64 u0x6692e924eade1b29, ; 95: lib_System.Console.dll.so => 46
	i64 u0x66a4e5c6a3fb0bae, ; 96: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 28
	i64 u0x68fbbbe2eb455198, ; 97: System.Formats.Asn1 => 49
	i64 u0x6a4d7577b2317255, ; 98: System.Runtime.InteropServices.dll => 65
	i64 u0x6bb10f67bf2db28f, ; 99: Avalonia.HarfBuzz => 13
	i64 u0x71ad672adbe48f35, ; 100: System.ComponentModel.Primitives.dll => 43
	i64 u0x73e4ce94e2eb6ffc, ; 101: lib_System.Memory.dll.so => 56
	i64 u0x74327ad47b9741a4, ; 102: Xamarin.AndroidX.NavigationEvent.Android.dll => 30
	i64 u0x76ca07b878f44da0, ; 103: System.Runtime.Numerics.dll => 66
	i64 u0x78979a5b2d9eda26, ; 104: Avalonia.OpenGL => 8
	i64 u0x78a45e51311409b6, ; 105: Xamarin.AndroidX.Fragment.dll => 25
	i64 u0x78f38ea0bc87fb0a, ; 106: lib_FFmpegKit.Net.FullGpl.Android.dll.so => 17
	i64 u0x7be1aa84e6400e60, ; 107: lib_Bulkut.Android.dll.so => 37
	i64 u0x7bef86a4335c4870, ; 108: System.ComponentModel.TypeConverter => 44
	i64 u0x7d14464ae904af64, ; 109: lib_Avalonia.Metal.dll.so => 7
	i64 u0x7dfc3d6d9d8d7b70, ; 110: System.Collections => 42
	i64 u0x7e946809d6008ef2, ; 111: lib_System.ObjectModel.dll.so => 62
	i64 u0x7ecc13347c8fd849, ; 112: lib_System.ComponentModel.dll.so => 45
	i64 u0x7fbd557c99b3ce6f, ; 113: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 27
	i64 u0x803f1de6fe44738a, ; 114: lib_Avalonia.dll.so => 10
	i64 u0x812c069d5cdecc17, ; 115: System.dll => 74
	i64 u0x8277f2be6b5ce05f, ; 116: Xamarin.AndroidX.AppCompat => 21
	i64 u0x8308a506644563bb, ; 117: Avalonia.Metal => 7
	i64 u0x84ae73148a4557d2, ; 118: lib_System.IO.Pipes.dll.so => 53
	i64 u0x84f9060cc4a93c8f, ; 119: lib_SkiaSharp.dll.so => 19
	i64 u0x87f6569b25707834, ; 120: System.IO.Compression.Brotli.dll => 50
	i64 u0x8808a9d7c53dc4c0, ; 121: lib_HarfBuzzSharp.dll.so => 18
	i64 u0x88bda98e0cffb7a9, ; 122: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 34
	i64 u0x897075a3fff0dec2, ; 123: Bulkut.Android => 37
	i64 u0x897a606c9e39c75f, ; 124: lib_System.ComponentModel.Primitives.dll.so => 43
	i64 u0x898a5c6bc9e47ec1, ; 125: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 31
	i64 u0x8ad229ea26432ee2, ; 126: Xamarin.AndroidX.Loader => 29
	i64 u0x8ae5e68fcf33c32b, ; 127: Bulkut.Shared.dll => 36
	i64 u0x8b4ff5d0fdd5faa1, ; 128: lib_System.Diagnostics.DiagnosticSource.dll.so => 47
	i64 u0x8b8d01333a96d0b5, ; 129: System.Diagnostics.Process.dll => 48
	i64 u0x8d7b8ab4b3310ead, ; 130: System.Threading => 73
	i64 u0x8da188285aadfe8e, ; 131: System.Collections.Concurrent => 39
	i64 u0x8fb4480c06374c78, ; 132: lib_Avalonia.Android.dll.so => 11
	i64 u0x903101b46fb73a04, ; 133: _Microsoft.Android.Resource.Designer => 0
	i64 u0x90393bd4865292f3, ; 134: lib_System.IO.Compression.dll.so => 51
	i64 u0x90634f86c5ebe2b5, ; 135: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 28
	i64 u0x91418dc638b29e68, ; 136: lib_Xamarin.AndroidX.CustomView.dll.so => 23
	i64 u0x9157bd523cd7ed36, ; 137: lib_System.Text.Json.dll.so => 71
	i64 u0x91a74f07b30d37e2, ; 138: System.Linq.dll => 55
	i64 u0x9216ea747d0be31f, ; 139: lib_Avalonia.Controls.dll.so => 2
	i64 u0x9246426168cfbd4a, ; 140: Avalonia.Dialogs.dll => 4
	i64 u0x944077d8ca3c6580, ; 141: System.IO.Compression.dll => 51
	i64 u0x96a7347adc67c496, ; 142: lib_Avalonia.Skia.dll.so => 15
	i64 u0x96cfafe6410410d8, ; 143: lib_Avalonia.Vulkan.dll.so => 9
	i64 u0x9799aee8e42cced3, ; 144: Avalonia.Skia.dll => 15
	i64 u0x97b8c771ea3e4220, ; 145: System.ComponentModel.dll => 45
	i64 u0x97e144c9d3c6976e, ; 146: System.Collections.Concurrent.dll => 39
	i64 u0x98b05cc81e6f333c, ; 147: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 31
	i64 u0x991d510397f92d9d, ; 148: System.Linq.Expressions => 54
	i64 u0x9ae6940b11c02876, ; 149: lib_Xamarin.AndroidX.Window.dll.so => 32
	i64 u0x9b68e31c09020a8f, ; 150: Avalonia.Markup.dll => 6
	i64 u0x9d5dbcf5a48583fe, ; 151: lib_Xamarin.AndroidX.Activity.dll.so => 20
	i64 u0x9ef542cf1f78c506, ; 152: Xamarin.AndroidX.Lifecycle.LiveData.Core => 27
	i64 u0x9f9c5c252feedc26, ; 153: Avalonia.OpenGL.dll => 8
	i64 u0xa0ad78236b7b267f, ; 154: Xamarin.AndroidX.Window => 32
	i64 u0xa0d8259f4cc284ec, ; 155: lib_System.Security.Cryptography.dll.so => 68
	i64 u0xa2572680829d2c7c, ; 156: System.IO.Pipelines.dll => 52
	i64 u0xa28642c7ac33c167, ; 157: Avalonia.Markup => 6
	i64 u0xa5f1ba49b85dd355, ; 158: System.Security.Cryptography.dll => 68
	i64 u0xa68a420042bb9b1f, ; 159: Xamarin.AndroidX.DrawerLayout.dll => 24
	i64 u0xa763fbb98df8d9fb, ; 160: lib_Microsoft.Win32.Primitives.dll.so => 38
	i64 u0xa78ce3745383236a, ; 161: Xamarin.AndroidX.Lifecycle.Common.Jvm => 26
	i64 u0xaa443ac34067eeef, ; 162: System.Private.Xml.dll => 64
	i64 u0xaa52de307ef5d1dd, ; 163: System.Net.Http => 57
	i64 u0xab9c1b2687d86b0b, ; 164: lib_System.Linq.Expressions.dll.so => 54
	i64 u0xac2af3fa195a15ce, ; 165: System.Runtime.Numerics => 66
	i64 u0xac5376a2a538dc10, ; 166: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 27
	i64 u0xadc90ab061a9e6e4, ; 167: System.ComponentModel.TypeConverter.dll => 44
	i64 u0xae282bcd03739de7, ; 168: Java.Interop => 76
	i64 u0xae53579c90db1107, ; 169: System.ObjectModel.dll => 62
	i64 u0xafcbb263128f7b93, ; 170: lib_Avalonia.HarfBuzz.dll.so => 13
	i64 u0xb220631954820169, ; 171: System.Text.RegularExpressions => 72
	i64 u0xb4bd7015ecee9d86, ; 172: System.IO.Pipelines => 52
	i64 u0xb81a2c6e0aee50fe, ; 173: lib_System.Private.CoreLib.dll.so => 75
	i64 u0xba48785529705af9, ; 174: System.Collections.dll => 42
	i64 u0xbb65706fde942ce3, ; 175: System.Net.Sockets => 61
	i64 u0xbd0e2c0d55246576, ; 176: System.Net.Http.dll => 57
	i64 u0xc0d928351ab5ca77, ; 177: System.Console.dll => 46
	i64 u0xc12b8b3afa48329c, ; 178: lib_System.Linq.dll.so => 55
	i64 u0xc1ff9ae3cdb6e1e6, ; 179: Xamarin.AndroidX.Activity.dll => 20
	i64 u0xc4f72c53a5b1ad3e, ; 180: Avalonia.Android.dll => 11
	i64 u0xc50fded0ded1418c, ; 181: lib_System.ComponentModel.TypeConverter.dll.so => 44
	i64 u0xc519125d6bc8fb11, ; 182: lib_System.Net.Requests.dll.so => 60
	i64 u0xc5325b2fcb37446f, ; 183: lib_System.Private.Xml.dll.so => 64
	i64 u0xc5a0f4b95a699af7, ; 184: lib_System.Private.Uri.dll.so => 63
	i64 u0xc6068c73a3554082, ; 185: Avalonia.Fonts.Inter => 12
	i64 u0xc674822f2d239e99, ; 186: lib_Avalonia.Markup.dll.so => 6
	i64 u0xc7c01e7d7c93a110, ; 187: System.Text.Encoding.Extensions.dll => 69
	i64 u0xc858a28d9ee5a6c5, ; 188: lib_System.Collections.Specialized.dll.so => 41
	i64 u0xcbd4fdd9cef4a294, ; 189: lib__Microsoft.Android.Resource.Designer.dll.so => 0
	i64 u0xcc2876b32ef2794c, ; 190: lib_System.Text.RegularExpressions.dll.so => 72
	i64 u0xcc5c3bb714c4561e, ; 191: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 34
	i64 u0xcd10a42808629144, ; 192: System.Net.Requests => 60
	i64 u0xcf23d8093f3ceadf, ; 193: System.Diagnostics.DiagnosticSource.dll => 47
	i64 u0xd1134ab26fd96d16, ; 194: FFmpegKit.Net.FullGpl.Android.dll => 17
	i64 u0xd1194e1d8a8de83c, ; 195: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 26
	i64 u0xd1268c6d5c152eea, ; 196: lib_Avalonia.OpenGL.dll.so => 8
	i64 u0xd333d0af9e423810, ; 197: System.Runtime.InteropServices => 65
	i64 u0xd3651b6fc3125825, ; 198: System.Private.Uri.dll => 63
	i64 u0xd6f6d366d4896aef, ; 199: lib_Xamarin.AndroidX.NavigationEvent.Android.dll.so => 30
	i64 u0xd88b5f5bbc332508, ; 200: Avalonia.Base => 1
	i64 u0xdad05a11827959a3, ; 201: System.Collections.NonGeneric.dll => 40
	i64 u0xdbf9607a441b4505, ; 202: System.Linq => 55
	i64 u0xdd2b722d78ef5f43, ; 203: System.Runtime.dll => 67
	i64 u0xdd67031857c72f96, ; 204: lib_System.Text.Encodings.Web.dll.so => 70
	i64 u0xdfefe13b112aff31, ; 205: lib_Avalonia.Base.dll.so => 1
	i64 u0xe0142572c095a480, ; 206: Xamarin.AndroidX.AppCompat.dll => 21
	i64 u0xe192a588d4410686, ; 207: lib_System.IO.Pipelines.dll.so => 52
	i64 u0xe2420585aeceb728, ; 208: System.Net.Requests.dll => 60
	i64 u0xe2e426c7714fa0bc, ; 209: Microsoft.Win32.Primitives.dll => 38
	i64 u0xe38f2586e1a6af0e, ; 210: Avalonia.Controls.dll => 2
	i64 u0xe4648f9beb38b02f, ; 211: Avalonia => 10
	i64 u0xe5434e8a119ceb69, ; 212: lib_Mono.Android.dll.so => 78
	i64 u0xe67ddaf3b05935e8, ; 213: lib_Avalonia.Remote.Protocol.dll.so => 14
	i64 u0xe7ef84b36819564e, ; 214: Xamarin.AndroidX.NavigationEvent.Android => 30
	i64 u0xe87bd4169ee1a380, ; 215: Avalonia.HarfBuzz.dll => 13
	i64 u0xe95567db18c48c1a, ; 216: lib_Bulkut.Shared.dll.so => 36
	i64 u0xebffd941bf21a7d7, ; 217: Bulkut.Core => 35
	i64 u0xedc4817167106c23, ; 218: System.Net.Sockets.dll => 61
	i64 u0xedc632067fb20ff3, ; 219: System.Memory.dll => 56
	i64 u0xefec0b7fdc57ec42, ; 220: Xamarin.AndroidX.Activity => 20
	i64 u0xf09e47b6ae914f6e, ; 221: System.Net.NameResolution => 58
	i64 u0xf1c4b4005493d871, ; 222: System.Formats.Asn1.dll => 49
	i64 u0xf368e771ca059e99, ; 223: Avalonia.Android => 11
	i64 u0xf3ddfe05336abf29, ; 224: System => 74
	i64 u0xf4727d423e5d26f3, ; 225: SkiaSharp => 19
	i64 u0xf4c1dd70a5496a17, ; 226: System.IO.Compression => 51
	i64 u0xf57137e5984abfa8, ; 227: Avalonia.dll => 10
	i64 u0xf9ae35b3d65d7bb8, ; 228: Avalonia.Themes.Fluent.dll => 16
	i64 u0xfbe99333ee5a53d9, ; 229: Avalonia.Vulkan => 9
	i64 u0xfbf0a31c9fc34bc4, ; 230: lib_System.Net.Http.dll.so => 57
	i64 u0xfc4186c2448201c7, ; 231: Avalonia.Dialogs => 4
	i64 u0xfc70c50e7e4385e2, ; 232: Avalonia.Skia => 15
	i64 u0xfd22f00870e40ae0, ; 233: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 24
	i64 u0xfd536c702f64dc47, ; 234: System.Text.Encoding.Extensions => 69
	i64 u0xfd583f7657b6a1cb, ; 235: Xamarin.AndroidX.Fragment => 25
	i64 u0xfeca84fe7f34860b ; 236: HarfBuzzSharp.dll => 18
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [237 x i32] [
	i32 77, i32 21, i32 59, i32 42, i32 18, i32 40, i32 24, i32 40,
	i32 68, i32 12, i32 78, i32 58, i32 23, i32 50, i32 76, i32 38,
	i32 53, i32 14, i32 70, i32 3, i32 39, i32 74, i32 77, i32 5,
	i32 9, i32 16, i32 50, i32 48, i32 67, i32 53, i32 46, i32 22,
	i32 33, i32 17, i32 1, i32 76, i32 59, i32 19, i32 5, i32 72,
	i32 49, i32 7, i32 14, i32 73, i32 71, i32 48, i32 25, i32 0,
	i32 32, i32 61, i32 23, i32 58, i32 5, i32 69, i32 31, i32 33,
	i32 36, i32 22, i32 35, i32 78, i32 33, i32 3, i32 62, i32 37,
	i32 4, i32 71, i32 2, i32 29, i32 54, i32 64, i32 35, i32 29,
	i32 77, i32 28, i32 59, i32 22, i32 67, i32 26, i32 41, i32 63,
	i32 75, i32 47, i32 73, i32 45, i32 65, i32 12, i32 41, i32 70,
	i32 43, i32 34, i32 56, i32 75, i32 16, i32 3, i32 66, i32 46,
	i32 28, i32 49, i32 65, i32 13, i32 43, i32 56, i32 30, i32 66,
	i32 8, i32 25, i32 17, i32 37, i32 44, i32 7, i32 42, i32 62,
	i32 45, i32 27, i32 10, i32 74, i32 21, i32 7, i32 53, i32 19,
	i32 50, i32 18, i32 34, i32 37, i32 43, i32 31, i32 29, i32 36,
	i32 47, i32 48, i32 73, i32 39, i32 11, i32 0, i32 51, i32 28,
	i32 23, i32 71, i32 55, i32 2, i32 4, i32 51, i32 15, i32 9,
	i32 15, i32 45, i32 39, i32 31, i32 54, i32 32, i32 6, i32 20,
	i32 27, i32 8, i32 32, i32 68, i32 52, i32 6, i32 68, i32 24,
	i32 38, i32 26, i32 64, i32 57, i32 54, i32 66, i32 27, i32 44,
	i32 76, i32 62, i32 13, i32 72, i32 52, i32 75, i32 42, i32 61,
	i32 57, i32 46, i32 55, i32 20, i32 11, i32 44, i32 60, i32 64,
	i32 63, i32 12, i32 6, i32 69, i32 41, i32 0, i32 72, i32 34,
	i32 60, i32 47, i32 17, i32 26, i32 8, i32 65, i32 63, i32 30,
	i32 1, i32 40, i32 55, i32 67, i32 70, i32 1, i32 21, i32 52,
	i32 60, i32 38, i32 2, i32 10, i32 78, i32 14, i32 30, i32 13,
	i32 36, i32 35, i32 61, i32 56, i32 20, i32 58, i32 49, i32 11,
	i32 74, i32 19, i32 51, i32 10, i32 16, i32 9, i32 57, i32 4,
	i32 15, i32 24, i32 69, i32 25, i32 18
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 38, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [38 x %struct.MarshalMethodsManagedClass] [
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000100, ; class name: Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 0
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000235, ; class name: Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 1
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200027c, ; class name: Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 2
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200023b, ; class name: Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 3
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000296, ; class name: Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 4
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000ec, ; class name: Android.OS.MessageQueue/IIdleHandlerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 5
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000008, ; class name: AndroidX.CustomView.Widget.ExploreByTouchHelper, Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 6
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000204, ; class name: Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 7
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200010c, ; class name: Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 8
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000205, ; class name: Android.App.Application, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 9
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000fa, ; class name: Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 10
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000010, ; class name: AndroidX.Activity.OnBackPressedCallback, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 11
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000132, ; class name: Android.Views.ISurfaceHolderCallback2Invoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 12
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000131, ; class name: Android.Views.ISurfaceHolderCallback2, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 13
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000130, ; class name: Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 14
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000068, ; class name: AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 15
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000055, ; class name: AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 16
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001e4, ; class name: Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 17
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001c9, ; class name: Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 18
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000178, ; class name: Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 19
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000177, ; class name: Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 20
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200003d, ; class name: Ffmpegkit.Droid.IFFmpegSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 21
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200003f, ; class name: Ffmpegkit.Droid.IFFprobeSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 22
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000043, ; class name: Ffmpegkit.Droid.IMediaInformationSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 23
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000041, ; class name: Ffmpegkit.Droid.ILogCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 24
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000047, ; class name: Ffmpegkit.Droid.IStatisticsCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 25
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200001d, ; class name: AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 26
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000fe, ; class name: Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 27
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200002f, ; class name: AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 28
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200003c, ; class name: AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 29
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000043, ; class name: AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 30
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000047, ; class name: AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 31
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000070, ; class name: AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 32
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000018, ; class name: AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 33
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000031, ; class name: AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 34
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000030, ; class name: AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 35
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000047, ; class name: AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 36
	%struct.MarshalMethodsManagedClass {
		i32 u0x020002b2, ; class name: Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	} ; 37
], align 16

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [38 x ptr] [
	ptr @.mm.0, ; 0 ('Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.1, ; 1 ('Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.2, ; 2 ('Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.3, ; 3 ('Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.4, ; 4 ('Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.5, ; 5 ('Android.OS.MessageQueue/IIdleHandlerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.6, ; 6 ('AndroidX.CustomView.Widget.ExploreByTouchHelper, Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.7, ; 7 ('Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.8, ; 8 ('Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.9, ; 9 ('Android.App.Application, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.10, ; 10 ('Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.11, ; 11 ('AndroidX.Activity.OnBackPressedCallback, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.12, ; 12 ('Android.Views.ISurfaceHolderCallback2Invoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.13, ; 13 ('Android.Views.ISurfaceHolderCallback2, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.14, ; 14 ('Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.15, ; 15 ('AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.16, ; 16 ('AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.17, ; 17 ('Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.18, ; 18 ('Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.19, ; 19 ('Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.20, ; 20 ('Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.21, ; 21 ('Ffmpegkit.Droid.IFFmpegSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.22, ; 22 ('Ffmpegkit.Droid.IFFprobeSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.23, ; 23 ('Ffmpegkit.Droid.IMediaInformationSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.24, ; 24 ('Ffmpegkit.Droid.ILogCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.25, ; 25 ('Ffmpegkit.Droid.IStatisticsCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.26, ; 26 ('AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.27, ; 27 ('Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.28, ; 28 ('AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.29, ; 29 ('AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.30, ; 30 ('AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.31, ; 31 ('AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.32, ; 32 ('AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.33, ; 33 ('AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.34, ; 34 ('AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.35, ; 35 ('AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.36, ; 36 ('AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.37 ; 37 ('Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
], align 16

@mm_method_names = dso_local local_unnamed_addr constant [116 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000004e0600066e, ; name: n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 0
	%struct.MarshalMethodName {
		i64 u0x0000004e060015d9, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 1
	%struct.MarshalMethodName {
		i64 u0x0000004e060015da, ; name: n_Read_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.2_name; char* name
	}, ; 2
	%struct.MarshalMethodName {
		i64 u0x0000004e060015db, ; name: n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.3_name; char* name
	}, ; 3
	%struct.MarshalMethodName {
		i64 u0x0000004e060015dc, ; name: n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.4_name; char* name
	}, ; 4
	%struct.MarshalMethodName {
		i64 u0x0000004e06001a67, ; name: n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.5_name; char* name
	}, ; 5
	%struct.MarshalMethodName {
		i64 u0x0000004e06001a68, ; name: n_GetHashCode_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.6_name; char* name
	}, ; 6
	%struct.MarshalMethodName {
		i64 u0x0000004e06001a69, ; name: n_ToString_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.7_name; char* name
	}, ; 7
	%struct.MarshalMethodName {
		i64 u0x0000004e06001608, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 8
	%struct.MarshalMethodName {
		i64 u0x0000004e06001609, ; name: n_Flush_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.8_name; char* name
	}, ; 9
	%struct.MarshalMethodName {
		i64 u0x0000004e0600160a, ; name: n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.9_name; char* name
	}, ; 10
	%struct.MarshalMethodName {
		i64 u0x0000004e0600160b, ; name: n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.10_name; char* name
	}, ; 11
	%struct.MarshalMethodName {
		i64 u0x0000004e0600160c, ; name: n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.11_name; char* name
	}, ; 12
	%struct.MarshalMethodName {
		i64 u0x0000004e06001b48, ; name: n_Run_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.12_name; char* name
	}, ; 13
	%struct.MarshalMethodName {
		i64 u0x0000004e06000578, ; name: n_QueueIdle_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.13_name; char* name
	}, ; 14
	%struct.MarshalMethodName {
		i64 u0x0000001706000037, ; name: n_GetVirtualViewAt_FF_mm_wrapper(IntPtr,IntPtr,Single,Single)
		ptr @.MarshalMethodName.14_name; char* name
	}, ; 15
	%struct.MarshalMethodName {
		i64 u0x0000001706000038, ; name: n_GetVisibleVirtualViews_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.15_name; char* name
	}, ; 16
	%struct.MarshalMethodName {
		i64 u0x0000001706000039, ; name: n_OnPerformActionForVirtualView_IILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)
		ptr @.MarshalMethodName.16_name; char* name
	}, ; 17
	%struct.MarshalMethodName {
		i64 u0x000000170600003a, ; name: n_OnPopulateNodeForVirtualView_ILandroidx_core_view_accessibility_AccessibilityNodeInfoCompat__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.17_name; char* name
	}, ; 18
	%struct.MarshalMethodName {
		i64 u0x0000004e060013e9, ; name: n_OnBackPressed_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.18_name; char* name
	}, ; 19
	%struct.MarshalMethodName {
		i64 u0x0000004e060013ea, ; name: n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.19_name; char* name
	}, ; 20
	%struct.MarshalMethodName {
		i64 u0x0000004e060013eb, ; name: n_OnNewIntent_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.20_name; char* name
	}, ; 21
	%struct.MarshalMethodName {
		i64 u0x0000004e060013ec, ; name: n_OnStop_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.21_name; char* name
	}, ; 22
	%struct.MarshalMethodName {
		i64 u0x0000004e060013ed, ; name: n_OnStart_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.22_name; char* name
	}, ; 23
	%struct.MarshalMethodName {
		i64 u0x0000004e060013ee, ; name: n_OnResume_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.23_name; char* name
	}, ; 24
	%struct.MarshalMethodName {
		i64 u0x0000004e060013ef, ; name: n_OnDestroy_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.24_name; char* name
	}, ; 25
	%struct.MarshalMethodName {
		i64 u0x0000004e060013f0, ; name: n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)
		ptr @.MarshalMethodName.25_name; char* name
	}, ; 26
	%struct.MarshalMethodName {
		i64 u0x0000004e060013f1, ; name: n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)
		ptr @.MarshalMethodName.26_name; char* name
	}, ; 27
	%struct.MarshalMethodName {
		i64 u0x0000004e060006d4, ; name: n_OnGlobalLayout_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.27_name; char* name
	}, ; 28
	%struct.MarshalMethodName {
		i64 u0x0000004e060013fe, ; name: n_OnCreate_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.28_name; char* name
	}, ; 29
	%struct.MarshalMethodName {
		i64 u0x0000004e06000642, ; name: n_OnAttachedToWindow_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.29_name; char* name
	}, ; 30
	%struct.MarshalMethodName {
		i64 u0x0000004e06000643, ; name: n_OnVisibilityAggregated_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.30_name; char* name
	}, ; 31
	%struct.MarshalMethodName {
		i64 u0x0000004e06000644, ; name: n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.31_name; char* name
	}, ; 32
	%struct.MarshalMethodName {
		i64 u0x0000004e06000645, ; name: n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.32_name; char* name
	}, ; 33
	%struct.MarshalMethodName {
		i64 u0x0000004e06000646, ; name: n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.33_name; char* name
	}, ; 34
	%struct.MarshalMethodName {
		i64 u0x0000004e06000647, ; name: n_OnFocusChanged_ZILandroid_graphics_Rect__mm_wrapper(IntPtr,IntPtr,SByte,Int32,IntPtr)
		ptr @.MarshalMethodName.34_name; char* name
	}, ; 35
	%struct.MarshalMethodName {
		i64 u0x0000004e06000648, ; name: n_DispatchHoverEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.35_name; char* name
	}, ; 36
	%struct.MarshalMethodName {
		i64 u0x0000004e06000649, ; name: n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.36_name; char* name
	}, ; 37
	%struct.MarshalMethodName {
		i64 u0x0000004e0600064a, ; name: n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.37_name; char* name
	}, ; 38
	%struct.MarshalMethodName {
		i64 u0x0000004e0600064b, ; name: n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.38_name; char* name
	}, ; 39
	%struct.MarshalMethodName {
		i64 u0x0000001406000092, ; name: n_HandleOnBackPressed_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.39_name; char* name
	}, ; 40
	%struct.MarshalMethodName {
		i64 u0x0000004e060009ce, ; name: n_SurfaceRedrawNeeded_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.40_name; char* name
	}, ; 41
	%struct.MarshalMethodName {
		i64 u0x0000004e060009c0, ; name: n_SurfaceRedrawNeededAsync_Landroid_view_SurfaceHolder_Ljava_lang_Runnable__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.41_name; char* name
	}, ; 42
	%struct.MarshalMethodName {
		i64 u0x0000004e060009b9, ; name: n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)
		ptr @.MarshalMethodName.42_name; char* name
	}, ; 43
	%struct.MarshalMethodName {
		i64 u0x0000004e060009ba, ; name: n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.43_name; char* name
	}, ; 44
	%struct.MarshalMethodName {
		i64 u0x0000004e060009bb, ; name: n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.44_name; char* name
	}, ; 45
	%struct.MarshalMethodName {
		i64 u0x00000016060004c5, ; name: n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.45_name; char* name
	}, ; 46
	%struct.MarshalMethodName {
		i64 u0x00000016060004c6, ; name: n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.46_name; char* name
	}, ; 47
	%struct.MarshalMethodName {
		i64 u0x0000001606000321, ; name: n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.47_name; char* name
	}, ; 48
	%struct.MarshalMethodName {
		i64 u0x0000004e06001217, ; name: n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.48_name; char* name
	}, ; 49
	%struct.MarshalMethodName {
		i64 u0x0000004e060010ae, ; name: n_OnDisplayAdded_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.49_name; char* name
	}, ; 50
	%struct.MarshalMethodName {
		i64 u0x0000004e060010af, ; name: n_OnDisplayChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.50_name; char* name
	}, ; 51
	%struct.MarshalMethodName {
		i64 u0x0000004e060010b0, ; name: n_OnDisplayRemoved_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.51_name; char* name
	}, ; 52
	%struct.MarshalMethodName {
		i64 u0x0000004e0600064c, ; name: n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.52_name; char* name
	}, ; 53
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d51, ; name: n_GetHandler_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.53_name; char* name
	}, ; 54
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d52, ; name: n_BeginBatchEdit_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.54_name; char* name
	}, ; 55
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d53, ; name: n_ClearMetaKeyStates_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.55_name; char* name
	}, ; 56
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d54, ; name: n_CloseConnection_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.56_name; char* name
	}, ; 57
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d55, ; name: n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.57_name; char* name
	}, ; 58
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d56, ; name: n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.58_name; char* name
	}, ; 59
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d57, ; name: n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.59_name; char* name
	}, ; 60
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d58, ; name: n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.60_name; char* name
	}, ; 61
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d09, ; name: n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.61_name; char* name
	}, ; 62
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d59, ; name: n_DeleteSurroundingText_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.62_name; char* name
	}, ; 63
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5a, ; name: n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.63_name; char* name
	}, ; 64
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5b, ; name: n_EndBatchEdit_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.64_name; char* name
	}, ; 65
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5c, ; name: n_FinishComposingText_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.65_name; char* name
	}, ; 66
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5d, ; name: n_GetCursorCapsMode_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.66_name; char* name
	}, ; 67
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5e, ; name: n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.67_name; char* name
	}, ; 68
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d5f, ; name: n_GetSelectedText_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.68_name; char* name
	}, ; 69
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d60, ; name: n_GetTextAfterCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.69_name; char* name
	}, ; 70
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d61, ; name: n_GetTextBeforeCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.70_name; char* name
	}, ; 71
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d62, ; name: n_PerformContextMenuAction_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.71_name; char* name
	}, ; 72
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d63, ; name: n_PerformEditorAction_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.72_name; char* name
	}, ; 73
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d64, ; name: n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.73_name; char* name
	}, ; 74
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d65, ; name: n_ReportFullscreenMode_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.74_name; char* name
	}, ; 75
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d66, ; name: n_RequestCursorUpdates_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.75_name; char* name
	}, ; 76
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0a, ; name: n_RequestCursorUpdates_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.76_name; char* name
	}, ; 77
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d67, ; name: n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.77_name; char* name
	}, ; 78
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d68, ; name: n_SetComposingRegion_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.78_name; char* name
	}, ; 79
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0b, ; name: n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)
		ptr @.MarshalMethodName.79_name; char* name
	}, ; 80
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d69, ; name: n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.80_name; char* name
	}, ; 81
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0c, ; name: n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.81_name; char* name
	}, ; 82
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d6a, ; name: n_SetSelection_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.82_name; char* name
	}, ; 83
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0d, ; name: n_GetSurroundingText_III_mm_wrapper(IntPtr,IntPtr,Int32,Int32,Int32)
		ptr @.MarshalMethodName.83_name; char* name
	}, ; 84
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0e, ; name: n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.84_name; char* name
	}, ; 85
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d0f, ; name: n_PerformSpellCheck_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.85_name; char* name
	}, ; 86
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d10, ; name: n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.86_name; char* name
	}, ; 87
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d11, ; name: n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.87_name; char* name
	}, ; 88
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d12, ; name: n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.88_name; char* name
	}, ; 89
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d13, ; name: n_SetImeConsumesInput_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.89_name; char* name
	}, ; 90
	%struct.MarshalMethodName {
		i64 u0x0000004e06000d14, ; name: n_TakeSnapshot_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.90_name; char* name
	}, ; 91
	%struct.MarshalMethodName {
		i64 u0x00000011060002ee, ; name: n_Apply_Lcom_arthenica_ffmpegkit_FFmpegSession__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.91_name; char* name
	}, ; 92
	%struct.MarshalMethodName {
		i64 u0x00000011060002fb, ; name: n_Apply_Lcom_arthenica_ffmpegkit_FFprobeSession__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.92_name; char* name
	}, ; 93
	%struct.MarshalMethodName {
		i64 u0x0000001106000315, ; name: n_Apply_Lcom_arthenica_ffmpegkit_MediaInformationSession__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.93_name; char* name
	}, ; 94
	%struct.MarshalMethodName {
		i64 u0x0000001106000308, ; name: n_Apply_Lcom_arthenica_ffmpegkit_Log__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.94_name; char* name
	}, ; 95
	%struct.MarshalMethodName {
		i64 u0x0000001106000393, ; name: n_Apply_Lcom_arthenica_ffmpegkit_Statistics__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.95_name; char* name
	}, ; 96
	%struct.MarshalMethodName {
		i64 u0x000000140600010f, ; name: n_OnContextAvailable_Landroid_content_Context__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.96_name; char* name
	}, ; 97
	%struct.MarshalMethodName {
		i64 u0x0000004e06000662, ; name: n_OnClick_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.97_name; char* name
	}, ; 98
	%struct.MarshalMethodName {
		i64 u0x00000015060001bd, ; name: n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.98_name; char* name
	}, ; 99
	%struct.MarshalMethodName {
		i64 u0x0000001506000402, ; name: n_OnMenuVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.99_name; char* name
	}, ; 100
	%struct.MarshalMethodName {
		i64 u0x00000016060002b3, ; name: n_OnSubUiVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.100_name; char* name
	}, ; 101
	%struct.MarshalMethodName {
		i64 u0x00000016060002c7, ; name: n_OnActionProviderVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.101_name; char* name
	}, ; 102
	%struct.MarshalMethodName {
		i64 u0x000000160600058d, ; name: n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.102_name; char* name
	}, ; 103
	%struct.MarshalMethodName {
		i64 u0x00000018060000c7, ; name: n_OnDrawerClosed_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.103_name; char* name
	}, ; 104
	%struct.MarshalMethodName {
		i64 u0x00000018060000c8, ; name: n_OnDrawerOpened_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.104_name; char* name
	}, ; 105
	%struct.MarshalMethodName {
		i64 u0x00000018060000c9, ; name: n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(IntPtr,IntPtr,IntPtr,Single)
		ptr @.MarshalMethodName.105_name; char* name
	}, ; 106
	%struct.MarshalMethodName {
		i64 u0x00000018060000ca, ; name: n_OnDrawerStateChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.106_name; char* name
	}, ; 107
	%struct.MarshalMethodName {
		i64 u0x000000190600030d, ; name: n_OnBackStackChanged_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.107_name; char* name
	}, ; 108
	%struct.MarshalMethodName {
		i64 u0x00000019060002fe, ; name: n_OnBackStackChangeCancelled_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.108_name; char* name
	}, ; 109
	%struct.MarshalMethodName {
		i64 u0x00000019060002ff, ; name: n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.109_name; char* name
	}, ; 110
	%struct.MarshalMethodName {
		i64 u0x0000001906000300, ; name: n_OnBackStackChangeProgressed_Landroidx_activity_BackEventCompat__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.110_name; char* name
	}, ; 111
	%struct.MarshalMethodName {
		i64 u0x0000001906000301, ; name: n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.111_name; char* name
	}, ; 112
	%struct.MarshalMethodName {
		i64 u0x00000019060003c0, ; name: n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.112_name; char* name
	}, ; 113
	%struct.MarshalMethodName {
		i64 u0x0000004e06001c18, ; name: n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.113_name; char* name
	}, ; 114
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.114_name; char* name
	} ; 115
], align 16

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Marshal methods backing fields, pointers to native functions
@native_cb_onFocusChange_0_0_600066e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_1_60015d9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60015da = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60015db = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60015dc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_equals_0_2_6001a67 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_hashCode_0_2_6001a68 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_toString_0_2_6001a69 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_3_6001608 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_flush_0_3_6001609 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600160a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600160b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600160c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_run_0_4_6001b48 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_queueIdle_0_5_6000578 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getVirtualViewAt_1_6_6000037 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getVisibleVirtualViews_1_6_6000038 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onPerformActionForVirtualView_1_6_6000039 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onPopulateNodeForVirtualView_1_6_600003a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackPressed_0_7_60013e9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_7_60013ea = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onNewIntent_0_7_60013eb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStop_0_7_60013ec = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStart_0_7_60013ed = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onResume_0_7_60013ee = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDestroy_0_7_60013ef = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onActivityResult_0_7_60013f0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onRequestPermissionsResult_0_7_60013f1 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onGlobalLayout_0_8_60006d4 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_9_60013fe = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onAttachedToWindow_0_10_6000642 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onVisibilityAggregated_0_10_6000643 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onVisibilityChanged_0_10_6000644 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onConfigurationChanged_0_10_6000645 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreateInputConnection_0_10_6000646 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onFocusChanged_0_10_6000647 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchHoverEvent_0_10_6000648 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchGenericPointerEvent_0_10_6000649 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchTouchEvent_0_10_600064a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchKeyEvent_0_10_600064b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_handleOnBackPressed_2_11_6000092 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceRedrawNeeded_0_12_60009ce = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceRedrawNeededAsync_0_13_60009c0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceChanged_0_14_60009b9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceCreated_0_14_60009ba = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceDestroyed_0_14_60009bb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStart_3_15_60004c5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onProgress_3_15_60004c6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onApplyWindowInsets_3_16_6000321 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onReceive_0_17_6001217 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayAdded_0_18_60010ae = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayChanged_0_18_60010af = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayRemoved_0_18_60010b0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchDraw_0_10_600064c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getHandler_0_19_6000d51 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_beginBatchEdit_0_19_6000d52 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_clearMetaKeyStates_0_19_6000d53 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_closeConnection_0_19_6000d54 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitCompletion_0_19_6000d55 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitContent_0_19_6000d56 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitCorrection_0_19_6000d57 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitText_0_19_6000d58 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitText_0_20_6000d09 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_deleteSurroundingText_0_19_6000d59 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_deleteSurroundingTextInCodePoints_0_19_6000d5a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_endBatchEdit_0_19_6000d5b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_finishComposingText_0_19_6000d5c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getCursorCapsMode_0_19_6000d5d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getExtractedText_0_19_6000d5e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getSelectedText_0_19_6000d5f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getTextAfterCursor_0_19_6000d60 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getTextBeforeCursor_0_19_6000d61 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performContextMenuAction_0_19_6000d62 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performEditorAction_0_19_6000d63 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performPrivateCommand_0_19_6000d64 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_reportFullscreenMode_0_19_6000d65 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestCursorUpdates_0_19_6000d66 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestCursorUpdates_0_20_6000d0a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_sendKeyEvent_0_19_6000d67 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingRegion_0_19_6000d68 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingRegion_0_20_6000d0b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingText_0_19_6000d69 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingText_0_20_6000d0c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setSelection_0_19_6000d6a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getSurroundingText_0_20_6000d0d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performHandwritingGesture_0_20_6000d0e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performSpellCheck_0_20_6000d0f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_previewHandwritingGesture_0_20_6000d10 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_replaceText_0_20_6000d11 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestTextBoundsInfo_0_20_6000d12 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setImeConsumesInput_0_20_6000d13 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_takeSnapshot_0_20_6000d14 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_apply_4_21_60002ee = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_apply_4_22_60002fb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_apply_4_23_6000315 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_apply_4_24_6000308 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_apply_4_25_6000393 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onContextAvailable_2_26_600010f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onClick_0_27_6000662 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onMenuItemClick_5_28_60001bd = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onMenuVisibilityChanged_5_29_6000402 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onSubUiVisibilityChanged_3_30_60002b3 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onActionProviderVisibilityChanged_3_31_60002c7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onControllableInsetsChanged_3_32_600058d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerClosed_6_33_60000c7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerOpened_6_33_60000c8 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerSlide_6_33_60000c9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerStateChanged_6_33_60000ca = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChanged_7_34_600030d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeCancelled_7_35_60002fe = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeCommitted_7_35_60002ff = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeProgressed_7_35_6000300 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeStarted_7_35_6000301 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onAttachFragment_7_36_60003c0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_activate_0_37_6001c18 = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.38)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Method: System.Void Android.Views.View/IOnFocusChangeListenerInvoker::n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View/IOnFocusChangeListener::OnFocusChange(Android.Views.View,System.Boolean)
; Implemented: System.Void Android.Views.View/IOnFocusChangeListener::OnFocusChange(Android.Views.View,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_view_View_1OnFocusChangeListenerImplementor_n_1onFocusChange(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onFocusChange_0_0_600066e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 0, i32 noundef 100664942, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onFocusChange_0_0_600066e)
	%cb2 = load ptr, ptr @native_cb_onFocusChange_0_0_600066e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1)
	ret void
}

; Method: System.Void Java.IO.InputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.InputStream::Close()
; Implemented: System.Void Android.Runtime.InputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_InputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_1_60015d9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 1, i32 noundef 100668889, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_1_60015d9)
	%cb2 = load ptr, ptr @native_cb_close_0_1_60015d9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Java.IO.InputStream::n_Read_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read()
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60015da, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 1, i32 noundef 100668890, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60015da)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60015da, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[])
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60015db, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 1, i32 noundef 100668891, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60015db)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60015db, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60015dc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 1, i32 noundef 100668892, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60015dc)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60015dc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length)
	ret i32 %1
}

; Method: System.SByte Java.Lang.Object::n_Equals_Ljava_lang_Object__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Java.Lang.Object::Equals(Java.Lang.Object)
; Implemented: System.Boolean Android.Runtime.JavaObject::Equals(Java.Lang.Object)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_android_runtime_JavaObject_n_1equals(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_equals_0_2_6001a67, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 2, i32 noundef 100670055, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_equals_0_2_6001a67)
	%cb2 = load ptr, ptr @native_cb_equals_0_2_6001a67, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Int32 Java.Lang.Object::n_GetHashCode_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.Lang.Object::GetHashCode()
; Implemented: System.Int32 Android.Runtime.JavaObject::GetHashCode()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_JavaObject_n_1hashCode(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_hashCode_0_2_6001a68, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 2, i32 noundef 100670056, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_hashCode_0_2_6001a68)
	%cb2 = load ptr, ptr @native_cb_hashCode_0_2_6001a68, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.IntPtr Java.Lang.Object::n_ToString_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.String Java.Lang.Object::ToString()
; Implemented: System.String Android.Runtime.JavaObject::ToString()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_mono_android_runtime_JavaObject_n_1toString(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_toString_0_2_6001a69, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 2, i32 noundef 100670057, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_toString_0_2_6001a69)
	%cb2 = load ptr, ptr @native_cb_toString_0_2_6001a69, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Java.IO.OutputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Close()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_3_6001608, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 3, i32 noundef 100668936, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_3_6001608)
	%cb2 = load ptr, ptr @native_cb_close_0_3_6001608, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Flush_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Flush()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Flush()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1flush(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_flush_0_3_6001609, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 3, i32 noundef 100668937, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_flush_0_3_6001609)
	%cb2 = load ptr, ptr @native_cb_flush_0_3_6001609, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[])
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600160a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 3, i32 noundef 100668938, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600160a)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600160a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600160b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 3, i32 noundef 100668939, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600160b)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600160b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write__I(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600160c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 3, i32 noundef 100668940, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600160c)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600160c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_Runnable_n_1run__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_4_6001b48, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 4, i32 noundef 100670280, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_4_6001b48)
	%cb2 = load ptr, ptr @native_cb_run_0_4_6001b48, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_RunnableImplementor_n_1run__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_4_6001b48, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 4, i32 noundef 100670280, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_4_6001b48)
	%cb2 = load ptr, ptr @native_cb_run_0_4_6001b48, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.SByte Android.OS.MessageQueue/IIdleHandlerInvoker::n_QueueIdle_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.OS.MessageQueue/IIdleHandler::QueueIdle()
; Implemented: System.Boolean Android.OS.MessageQueue/IIdleHandler::QueueIdle()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AndroidDispatcherImpl_1IdleHandler_n_1queueIdle(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_queueIdle_0_5_6000578, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 5, i32 noundef 100664696, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_queueIdle_0_5_6000578)
	%cb2 = load ptr, ptr @native_cb_queueIdle_0_5_6000578, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.Int32 AndroidX.CustomView.Widget.ExploreByTouchHelper::n_GetVirtualViewAt_FF_mm_wrapper(System.IntPtr,System.IntPtr,System.Single,System.Single)
; Assembly: Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Int32 AndroidX.CustomView.Widget.ExploreByTouchHelper::GetVirtualViewAt(System.Single,System.Single)
; Implemented: System.Int32 Avalonia.Android.AvaloniaAccessHelper::GetVirtualViewAt(System.Single,System.Single)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_crc6431345fe65afe8d98_AvaloniaAccessHelper_n_1getVirtualViewAt(ptr noundef %env, ptr noundef %klass, float noundef %0, float noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getVirtualViewAt_1_6_6000037, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 6, i32 noundef 100663351, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getVirtualViewAt_1_6_6000037)
	%cb2 = load ptr, ptr @native_cb_getVirtualViewAt_1_6_6000037, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, float noundef %0, float noundef %1)
	ret i32 %3
}

; Method: System.Void AndroidX.CustomView.Widget.ExploreByTouchHelper::n_GetVisibleVirtualViews_Ljava_util_List__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.CustomView.Widget.ExploreByTouchHelper::GetVisibleVirtualViews(System.Collections.Generic.IList`1<Java.Lang.Integer>)
; Implemented: System.Void Avalonia.Android.AvaloniaAccessHelper::GetVisibleVirtualViews(System.Collections.Generic.IList`1<Java.Lang.Integer>)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaAccessHelper_n_1getVisibleVirtualViews(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getVisibleVirtualViews_1_6_6000038, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 6, i32 noundef 100663352, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getVisibleVirtualViews_1_6_6000038)
	%cb2 = load ptr, ptr @native_cb_getVisibleVirtualViews_1_6_6000038, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.SByte AndroidX.CustomView.Widget.ExploreByTouchHelper::n_OnPerformActionForVirtualView_IILandroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr)
; Assembly: Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Boolean AndroidX.CustomView.Widget.ExploreByTouchHelper::OnPerformActionForVirtualView(System.Int32,System.Int32,Android.OS.Bundle)
; Implemented: System.Boolean Avalonia.Android.AvaloniaAccessHelper::OnPerformActionForVirtualView(System.Int32,System.Int32,Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaAccessHelper_n_1onPerformActionForVirtualView(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onPerformActionForVirtualView_1_6_6000039, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 6, i32 noundef 100663353, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onPerformActionForVirtualView_1_6_6000039)
	%cb2 = load ptr, ptr @native_cb_onPerformActionForVirtualView_1_6_6000039, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.Void AndroidX.CustomView.Widget.ExploreByTouchHelper::n_OnPopulateNodeForVirtualView_ILandroidx_core_view_accessibility_AccessibilityNodeInfoCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.CustomView.Widget.ExploreByTouchHelper::OnPopulateNodeForVirtualView(System.Int32,AndroidX.Core.View.Accessibility.AccessibilityNodeInfoCompat)
; Implemented: System.Void Avalonia.Android.AvaloniaAccessHelper::OnPopulateNodeForVirtualView(System.Int32,AndroidX.Core.View.Accessibility.AccessibilityNodeInfoCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaAccessHelper_n_1onPopulateNodeForVirtualView(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onPopulateNodeForVirtualView_1_6_600003a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 6, i32 noundef 100663354, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onPopulateNodeForVirtualView_1_6_600003a)
	%cb2 = load ptr, ptr @native_cb_onPopulateNodeForVirtualView_1_6_600003a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnBackPressed_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnBackPressed()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnBackPressed()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onBackPressed(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackPressed_0_7_60013e9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668393, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackPressed_0_7_60013e9)
	%cb2 = load ptr, ptr @native_cb_onBackPressed_0_7_60013e9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onCreate(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_7_60013ea, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668394, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_7_60013ea)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_7_60013ea, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnNewIntent_Landroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnNewIntent(Android.Content.Intent)
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnNewIntent(Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onNewIntent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onNewIntent_0_7_60013eb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668395, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onNewIntent_0_7_60013eb)
	%cb2 = load ptr, ptr @native_cb_onNewIntent_0_7_60013eb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnStop_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnStop()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnStop()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onStop(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStop_0_7_60013ec, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668396, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStop_0_7_60013ec)
	%cb2 = load ptr, ptr @native_cb_onStop_0_7_60013ec, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnStart_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnStart()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnStart()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onStart(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStart_0_7_60013ed, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668397, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStart_0_7_60013ed)
	%cb2 = load ptr, ptr @native_cb_onStart_0_7_60013ed, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnResume_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnResume()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnResume()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onResume__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onResume_0_7_60013ee, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668398, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onResume_0_7_60013ee)
	%cb2 = load ptr, ptr @native_cb_onResume_0_7_60013ee, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnResume_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnResume()
; Implemented: System.Void Avalonia.Android.AvaloniaMainActivity::OnResume()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaMainActivity_n_1onResume__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onResume_0_7_60013ee, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668398, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onResume_0_7_60013ee)
	%cb2 = load ptr, ptr @native_cb_onResume_0_7_60013ee, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnDestroy()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onDestroy__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_7_60013ef, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668399, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_7_60013ef)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_7_60013ef, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnDestroy()
; Implemented: System.Void Avalonia.Android.AvaloniaMainActivity::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaMainActivity_n_1onDestroy__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_7_60013ef, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668399, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_7_60013ef)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_7_60013ef, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnActivityResult(System.Int32,Android.App.Result,Android.Content.Intent)
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnActivityResult(System.Int32,Android.App.Result,Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onActivityResult(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onActivityResult_0_7_60013f0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668400, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onActivityResult_0_7_60013f0)
	%cb2 = load ptr, ptr @native_cb_onActivityResult_0_7_60013f0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onRequestPermissionsResult(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_7_60013f1, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 7, i32 noundef 100668401, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onRequestPermissionsResult_0_7_60013f1)
	%cb2 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_7_60013f1, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker::n_OnGlobalLayout_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
; Implemented: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_1GlobalLayoutListener_n_1onGlobalLayout__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onGlobalLayout_0_8_60006d4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 8, i32 noundef 100665044, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onGlobalLayout_0_8_60006d4)
	%cb2 = load ptr, ptr @native_cb_onGlobalLayout_0_8_60006d4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker::n_OnGlobalLayout_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
; Implemented: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onGlobalLayout__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onGlobalLayout_0_8_60006d4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 8, i32 noundef 100665044, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onGlobalLayout_0_8_60006d4)
	%cb2 = load ptr, ptr @native_cb_onGlobalLayout_0_8_60006d4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Application::n_OnCreate_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Application::OnCreate()
; Implemented: System.Void Avalonia.Android.AvaloniaAndroidApplication`1::OnCreate()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaAndroidApplication_11_n_1onCreate(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_9_60013fe, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 9, i32 noundef 100668414, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_9_60013fe)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_9_60013fe, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.View::n_OnAttachedToWindow_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnAttachedToWindow()
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnAttachedToWindow()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onAttachedToWindow(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onAttachedToWindow_0_10_6000642, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664898, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onAttachedToWindow_0_10_6000642)
	%cb2 = load ptr, ptr @native_cb_onAttachedToWindow_0_10_6000642, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.View::n_OnVisibilityAggregated_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnVisibilityAggregated(System.Boolean)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnVisibilityAggregated(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onVisibilityAggregated(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onVisibilityAggregated_0_10_6000643, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664899, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onVisibilityAggregated_0_10_6000643)
	%cb2 = load ptr, ptr @native_cb_onVisibilityAggregated_0_10_6000643, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret void
}

; Method: System.Void Android.Views.View::n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnVisibilityChanged(Android.Views.View,Android.Views.ViewStates)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnVisibilityChanged(Android.Views.View,Android.Views.ViewStates)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onVisibilityChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onVisibilityChanged_0_10_6000644, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664900, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onVisibilityChanged_0_10_6000644)
	%cb2 = load ptr, ptr @native_cb_onVisibilityChanged_0_10_6000644, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret void
}

; Method: System.Void Android.Views.View::n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnConfigurationChanged(Android.Content.Res.Configuration)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnConfigurationChanged(Android.Content.Res.Configuration)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onConfigurationChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onConfigurationChanged_0_10_6000645, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664901, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onConfigurationChanged_0_10_6000645)
	%cb2 = load ptr, ptr @native_cb_onConfigurationChanged_0_10_6000645, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.IntPtr Android.Views.View::n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.IInputConnection Android.Views.View::OnCreateInputConnection(Android.Views.InputMethods.EditorInfo)
; Implemented: Android.Views.InputMethods.IInputConnection Avalonia.Android.AvaloniaView::OnCreateInputConnection(Android.Views.InputMethods.EditorInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onCreateInputConnection(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreateInputConnection_0_10_6000646, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664902, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreateInputConnection_0_10_6000646)
	%cb2 = load ptr, ptr @native_cb_onCreateInputConnection_0_10_6000646, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret ptr %2
}

; Method: System.Void Android.Views.View::n_OnFocusChanged_ZILandroid_graphics_Rect__mm_wrapper(System.IntPtr,System.IntPtr,System.SByte,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnFocusChanged(System.Boolean,Android.Views.FocusSearchDirection,Android.Graphics.Rect)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnFocusChanged(System.Boolean,Android.Views.FocusSearchDirection,Android.Graphics.Rect)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onFocusChanged(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onFocusChanged_0_10_6000647, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664903, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onFocusChanged_0_10_6000647)
	%cb2 = load ptr, ptr @native_cb_onFocusChanged_0_10_6000647, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0, i32 noundef %1, ptr noundef %2)
	ret void
}

; Method: System.SByte Android.Views.View::n_DispatchHoverEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchHoverEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Avalonia.Android.AvaloniaView::DispatchHoverEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaView_n_1dispatchHoverEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchHoverEvent_0_10_6000648, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664904, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchHoverEvent_0_10_6000648)
	%cb2 = load ptr, ptr @native_cb_dispatchHoverEvent_0_10_6000648, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchGenericPointerEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Avalonia.Android.AvaloniaView::DispatchGenericPointerEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaView_n_1dispatchGenericPointerEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchGenericPointerEvent_0_10_6000649, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664905, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchGenericPointerEvent_0_10_6000649)
	%cb2 = load ptr, ptr @native_cb_dispatchGenericPointerEvent_0_10_6000649, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchTouchEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Avalonia.Android.AvaloniaView::DispatchTouchEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaView_n_1dispatchTouchEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchTouchEvent_0_10_600064a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664906, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchTouchEvent_0_10_600064a)
	%cb2 = load ptr, ptr @native_cb_dispatchTouchEvent_0_10_600064a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchKeyEvent(Android.Views.KeyEvent)
; Implemented: System.Boolean Avalonia.Android.AvaloniaView::DispatchKeyEvent(Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaView_n_1dispatchKeyEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchKeyEvent_0_10_600064b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664907, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchKeyEvent_0_10_600064b)
	%cb2 = load ptr, ptr @native_cb_dispatchKeyEvent_0_10_600064b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Void AndroidX.Activity.OnBackPressedCallback::n_HandleOnBackPressed_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Activity.OnBackPressedCallback::HandleOnBackPressed()
; Implemented: System.Void Avalonia.Android.BackPressedCallback::HandleOnBackPressed()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_BackPressedCallback_n_1handleOnBackPressed(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_handleOnBackPressed_2_11_6000092, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 20, i32 noundef 11, i32 noundef 100663442, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_handleOnBackPressed_2_11_6000092)
	%cb2 = load ptr, ptr @native_cb_handleOnBackPressed_2_11_6000092, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallback2Invoker::n_SurfaceRedrawNeeded_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback2::SurfaceRedrawNeeded(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback2::SurfaceRedrawNeeded(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceRedrawNeeded(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceRedrawNeeded_0_12_60009ce, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 12, i32 noundef 100665806, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceRedrawNeeded_0_12_60009ce)
	%cb2 = load ptr, ptr @native_cb_surfaceRedrawNeeded_0_12_60009ce, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallback2::n_SurfaceRedrawNeededAsync_Landroid_view_SurfaceHolder_Ljava_lang_Runnable__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback2::SurfaceRedrawNeededAsync(Android.Views.ISurfaceHolder,Java.Lang.IRunnable)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback2::SurfaceRedrawNeededAsync(Android.Views.ISurfaceHolder,Java.Lang.IRunnable)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceRedrawNeededAsync(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceRedrawNeededAsync_0_13_60009c0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 13, i32 noundef 100665792, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceRedrawNeededAsync_0_13_60009c0)
	%cb2 = load ptr, ptr @native_cb_surfaceRedrawNeededAsync_0_13_60009c0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceChanged_0_14_60009b9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %4
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 14, i32 noundef 100665785, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceChanged_0_14_60009b9)
	%cb2 = load ptr, ptr @native_cb_surfaceChanged_0_14_60009b9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %4
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %4]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceCreated(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceCreated_0_14_60009ba, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 14, i32 noundef 100665786, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceCreated_0_14_60009ba)
	%cb2 = load ptr, ptr @native_cb_surfaceCreated_0_14_60009ba, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceDestroyed(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceDestroyed_0_14_60009bb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 14, i32 noundef 100665787, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceDestroyed_0_14_60009bb)
	%cb2 = load ptr, ptr @native_cb_surfaceDestroyed_0_14_60009bb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.IntPtr AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::OnStart(AndroidX.Core.View.WindowInsetsAnimationCompat,AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat)
; Implemented: AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat Avalonia.Android.Platform.AndroidInsetsManager::OnStart(AndroidX.Core.View.WindowInsetsAnimationCompat,AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onStart(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStart_3_15_60004c5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 15, i32 noundef 100664517, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStart_3_15_60004c5)
	%cb2 = load ptr, ptr @native_cb_onStart_3_15_60004c5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.IntPtr AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::OnProgress(AndroidX.Core.View.WindowInsetsCompat,System.Collections.Generic.IList`1<AndroidX.Core.View.WindowInsetsAnimationCompat>)
; Implemented: AndroidX.Core.View.WindowInsetsCompat Avalonia.Android.Platform.AndroidInsetsManager::OnProgress(AndroidX.Core.View.WindowInsetsCompat,System.Collections.Generic.IList`1<AndroidX.Core.View.WindowInsetsAnimationCompat>)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onProgress(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onProgress_3_15_60004c6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 15, i32 noundef 100664518, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onProgress_3_15_60004c6)
	%cb2 = load ptr, ptr @native_cb_onProgress_3_15_60004c6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.IntPtr AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker::n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.IOnApplyWindowInsetsListener::OnApplyWindowInsets(Android.Views.View,AndroidX.Core.View.WindowInsetsCompat)
; Implemented: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.IOnApplyWindowInsetsListener::OnApplyWindowInsets(Android.Views.View,AndroidX.Core.View.WindowInsetsCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onApplyWindowInsets(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onApplyWindowInsets_3_16_6000321, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 16, i32 noundef 100664097, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onApplyWindowInsets_3_16_6000321)
	%cb2 = load ptr, ptr @native_cb_onApplyWindowInsets_3_16_6000321, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.Void Android.Content.BroadcastReceiver::n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Content.BroadcastReceiver::OnReceive(Android.Content.Context,Android.Content.Intent)
; Implemented: System.Void Avalonia.Android.Platform.AndroidPlatformSettings/ConfigurationChangedReceiver::OnReceive(Android.Content.Context,Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidPlatformSettings_1ConfigurationChangedReceiver_n_1onReceive(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onReceive_0_17_6001217, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 17, i32 noundef 100667927, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onReceive_0_17_6001217)
	%cb2 = load ptr, ptr @native_cb_onReceive_0_17_6001217, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayAdded_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayAdded(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayAdded(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayAdded(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayAdded_0_18_60010ae, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 18, i32 noundef 100667566, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayAdded_0_18_60010ae)
	%cb2 = load ptr, ptr @native_cb_onDisplayAdded_0_18_60010ae, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayChanged_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayChanged(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayChanged(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayChanged(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayChanged_0_18_60010af, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 18, i32 noundef 100667567, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayChanged_0_18_60010af)
	%cb2 = load ptr, ptr @native_cb_onDisplayChanged_0_18_60010af, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayRemoved_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayRemoved(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayRemoved(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayRemoved(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayRemoved_0_18_60010b0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 18, i32 noundef 100667568, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayRemoved_0_18_60010b0)
	%cb2 = load ptr, ptr @native_cb_onDisplayRemoved_0_18_60010b0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Views.View::n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::DispatchDraw(Android.Graphics.Canvas)
; Implemented: System.Void Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/SurfaceViewImpl::DispatchDraw(Android.Graphics.Canvas)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64bd239b21961e24ab_TopLevelImpl_1SurfaceViewImpl_n_1dispatchDraw(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchDraw_0_10_600064c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 10, i32 noundef 100664908, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchDraw_0_10_600064c)
	%cb2 = load ptr, ptr @native_cb_dispatchDraw_0_10_600064c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetHandler_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.OS.Handler Android.Views.InputMethods.IInputConnection::get_Handler()
; Implemented: Android.OS.Handler Android.Views.InputMethods.IInputConnection::get_Handler()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getHandler(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getHandler_0_19_6000d51, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666705, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getHandler_0_19_6000d51)
	%cb2 = load ptr, ptr @native_cb_getHandler_0_19_6000d51, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_BeginBatchEdit_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::BeginBatchEdit()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::BeginBatchEdit()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1beginBatchEdit(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_beginBatchEdit_0_19_6000d52, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666706, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_beginBatchEdit_0_19_6000d52)
	%cb2 = load ptr, ptr @native_cb_beginBatchEdit_0_19_6000d52, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_ClearMetaKeyStates_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ClearMetaKeyStates(Android.Views.MetaKeyStates)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ClearMetaKeyStates(Android.Views.MetaKeyStates)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1clearMetaKeyStates(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_clearMetaKeyStates_0_19_6000d53, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666707, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_clearMetaKeyStates_0_19_6000d53)
	%cb2 = load ptr, ptr @native_cb_clearMetaKeyStates_0_19_6000d53, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.Void Android.Views.InputMethods.IInputConnectionInvoker::n_CloseConnection_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::CloseConnection()
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::CloseConnection()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1closeConnection(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_closeConnection_0_19_6000d54, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666708, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_closeConnection_0_19_6000d54)
	%cb2 = load ptr, ptr @native_cb_closeConnection_0_19_6000d54, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCompletion(Android.Views.InputMethods.CompletionInfo)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCompletion(Android.Views.InputMethods.CompletionInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitCompletion(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitCompletion_0_19_6000d55, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666709, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitCompletion_0_19_6000d55)
	%cb2 = load ptr, ptr @native_cb_commitCompletion_0_19_6000d55, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitContent(Android.Views.InputMethods.InputContentInfo,Android.Views.InputMethods.InputContentFlags,Android.OS.Bundle)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitContent(Android.Views.InputMethods.InputContentInfo,Android.Views.InputMethods.InputContentFlags,Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitContent(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitContent_0_19_6000d56, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666710, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitContent_0_19_6000d56)
	%cb2 = load ptr, ptr @native_cb_commitContent_0_19_6000d56, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCorrection(Android.Views.InputMethods.CorrectionInfo)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCorrection(Android.Views.InputMethods.CorrectionInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitCorrection(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitCorrection_0_19_6000d57, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666711, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitCorrection_0_19_6000d57)
	%cb2 = load ptr, ptr @native_cb_commitCorrection_0_19_6000d57, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitText__Ljava_lang_CharSequence_2I(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitText_0_19_6000d58, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666712, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitText_0_19_6000d58)
	%cb2 = load ptr, ptr @native_cb_commitText_0_19_6000d58, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitText__Ljava_lang_CharSequence_2ILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitText_0_20_6000d09, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666633, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitText_0_20_6000d09)
	%cb2 = load ptr, ptr @native_cb_commitText_0_20_6000d09, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_DeleteSurroundingText_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingText(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingText(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1deleteSurroundingText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_deleteSurroundingText_0_19_6000d59, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666713, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_deleteSurroundingText_0_19_6000d59)
	%cb2 = load ptr, ptr @native_cb_deleteSurroundingText_0_19_6000d59, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingTextInCodePoints(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingTextInCodePoints(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1deleteSurroundingTextInCodePoints(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_deleteSurroundingTextInCodePoints_0_19_6000d5a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666714, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_deleteSurroundingTextInCodePoints_0_19_6000d5a)
	%cb2 = load ptr, ptr @native_cb_deleteSurroundingTextInCodePoints_0_19_6000d5a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_EndBatchEdit_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::EndBatchEdit()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::EndBatchEdit()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1endBatchEdit(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_endBatchEdit_0_19_6000d5b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666715, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_endBatchEdit_0_19_6000d5b)
	%cb2 = load ptr, ptr @native_cb_endBatchEdit_0_19_6000d5b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_FinishComposingText_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::FinishComposingText()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::FinishComposingText()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1finishComposingText(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_finishComposingText_0_19_6000d5c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666716, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_finishComposingText_0_19_6000d5c)
	%cb2 = load ptr, ptr @native_cb_finishComposingText_0_19_6000d5c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.Int32 Android.Views.InputMethods.IInputConnectionInvoker::n_GetCursorCapsMode_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Text.CapitalizationMode Android.Views.InputMethods.IInputConnection::GetCursorCapsMode(Android.Text.CapitalizationMode)
; Implemented: Android.Text.CapitalizationMode Android.Views.InputMethods.IInputConnection::GetCursorCapsMode(Android.Text.CapitalizationMode)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getCursorCapsMode(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getCursorCapsMode_0_19_6000d5d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666717, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getCursorCapsMode_0_19_6000d5d)
	%cb2 = load ptr, ptr @native_cb_getCursorCapsMode_0_19_6000d5d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i32 %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.ExtractedText Android.Views.InputMethods.IInputConnection::GetExtractedText(Android.Views.InputMethods.ExtractedTextRequest,Android.Views.InputMethods.GetTextFlags)
; Implemented: Android.Views.InputMethods.ExtractedText Android.Views.InputMethods.IInputConnection::GetExtractedText(Android.Views.InputMethods.ExtractedTextRequest,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getExtractedText(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getExtractedText_0_19_6000d5e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666718, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getExtractedText_0_19_6000d5e)
	%cb2 = load ptr, ptr @native_cb_getExtractedText_0_19_6000d5e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetSelectedText_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetSelectedTextFormatted(Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetSelectedTextFormatted(Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getSelectedText(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getSelectedText_0_19_6000d5f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666719, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getSelectedText_0_19_6000d5f)
	%cb2 = load ptr, ptr @native_cb_getSelectedText_0_19_6000d5f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret ptr %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetTextAfterCursor_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextAfterCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextAfterCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getTextAfterCursor(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getTextAfterCursor_0_19_6000d60, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666720, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getTextAfterCursor_0_19_6000d60)
	%cb2 = load ptr, ptr @native_cb_getTextAfterCursor_0_19_6000d60, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetTextBeforeCursor_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextBeforeCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextBeforeCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getTextBeforeCursor(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getTextBeforeCursor_0_19_6000d61, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666721, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getTextBeforeCursor_0_19_6000d61)
	%cb2 = load ptr, ptr @native_cb_getTextBeforeCursor_0_19_6000d61, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformContextMenuAction_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformContextMenuAction(System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformContextMenuAction(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performContextMenuAction(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performContextMenuAction_0_19_6000d62, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666722, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performContextMenuAction_0_19_6000d62)
	%cb2 = load ptr, ptr @native_cb_performContextMenuAction_0_19_6000d62, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformEditorAction_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformEditorAction(Android.Views.InputMethods.ImeAction)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformEditorAction(Android.Views.InputMethods.ImeAction)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performEditorAction(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performEditorAction_0_19_6000d63, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666723, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performEditorAction_0_19_6000d63)
	%cb2 = load ptr, ptr @native_cb_performEditorAction_0_19_6000d63, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformPrivateCommand(System.String,Android.OS.Bundle)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformPrivateCommand(System.String,Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performPrivateCommand(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performPrivateCommand_0_19_6000d64, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666724, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performPrivateCommand_0_19_6000d64)
	%cb2 = load ptr, ptr @native_cb_performPrivateCommand_0_19_6000d64, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_ReportFullscreenMode_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ReportFullscreenMode(System.Boolean)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ReportFullscreenMode(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1reportFullscreenMode(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_reportFullscreenMode_0_19_6000d65, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666725, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_reportFullscreenMode_0_19_6000d65)
	%cb2 = load ptr, ptr @native_cb_reportFullscreenMode_0_19_6000d65, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_RequestCursorUpdates_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestCursorUpdates__I(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestCursorUpdates_0_19_6000d66, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666726, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestCursorUpdates_0_19_6000d66)
	%cb2 = load ptr, ptr @native_cb_requestCursorUpdates_0_19_6000d66, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_RequestCursorUpdates_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestCursorUpdates__II(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestCursorUpdates_0_20_6000d0a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666634, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestCursorUpdates_0_20_6000d0a)
	%cb2 = load ptr, ptr @native_cb_requestCursorUpdates_0_20_6000d0a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SendKeyEvent(Android.Views.KeyEvent)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SendKeyEvent(Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1sendKeyEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_sendKeyEvent_0_19_6000d67, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666727, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_sendKeyEvent_0_19_6000d67)
	%cb2 = load ptr, ptr @native_cb_sendKeyEvent_0_19_6000d67, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetComposingRegion_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingRegion__II(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingRegion_0_19_6000d68, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666728, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingRegion_0_19_6000d68)
	%cb2 = load ptr, ptr @native_cb_setComposingRegion_0_19_6000d68, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingRegion__IILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingRegion_0_20_6000d0b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666635, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingRegion_0_20_6000d0b)
	%cb2 = load ptr, ptr @native_cb_setComposingRegion_0_20_6000d0b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingText__Ljava_lang_CharSequence_2I(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingText_0_19_6000d69, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666729, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingText_0_19_6000d69)
	%cb2 = load ptr, ptr @native_cb_setComposingText_0_19_6000d69, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingText__Ljava_lang_CharSequence_2ILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingText_0_20_6000d0c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666636, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingText_0_20_6000d0c)
	%cb2 = load ptr, ptr @native_cb_setComposingText_0_20_6000d0c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetSelection_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetSelection(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetSelection(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setSelection(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setSelection_0_19_6000d6a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 19, i32 noundef 100666730, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setSelection_0_19_6000d6a)
	%cb2 = load ptr, ptr @native_cb_setSelection_0_19_6000d6a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnection::n_GetSurroundingText_III_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.SurroundingText Android.Views.InputMethods.IInputConnection::GetSurroundingText(System.Int32,System.Int32,System.Int32)
; Implemented: Android.Views.InputMethods.SurroundingText Android.Views.InputMethods.IInputConnection::GetSurroundingText(System.Int32,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getSurroundingText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getSurroundingText_0_20_6000d0d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666637, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getSurroundingText_0_20_6000d0d)
	%cb2 = load ptr, ptr @native_cb_getSurroundingText_0_20_6000d0d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, i32 noundef %2)
	ret ptr %4
}

; Method: System.Void Android.Views.InputMethods.IInputConnection::n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::PerformHandwritingGesture(Android.Views.InputMethods.HandwritingGesture,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IIntConsumer)
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::PerformHandwritingGesture(Android.Views.InputMethods.HandwritingGesture,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IIntConsumer)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performHandwritingGesture(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performHandwritingGesture_0_20_6000d0e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666638, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performHandwritingGesture_0_20_6000d0e)
	%cb2 = load ptr, ptr @native_cb_performHandwritingGesture_0_20_6000d0e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_PerformSpellCheck_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformSpellCheck()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformSpellCheck()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performSpellCheck(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performSpellCheck_0_20_6000d0f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666639, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performSpellCheck_0_20_6000d0f)
	%cb2 = load ptr, ptr @native_cb_performSpellCheck_0_20_6000d0f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PreviewHandwritingGesture(Android.Views.InputMethods.PreviewableHandwritingGesture,Android.OS.CancellationSignal)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PreviewHandwritingGesture(Android.Views.InputMethods.PreviewableHandwritingGesture,Android.OS.CancellationSignal)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1previewHandwritingGesture(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_previewHandwritingGesture_0_20_6000d10, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666640, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_previewHandwritingGesture_0_20_6000d10)
	%cb2 = load ptr, ptr @native_cb_previewHandwritingGesture_0_20_6000d10, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ReplaceText(System.Int32,System.Int32,Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ReplaceText(System.Int32,System.Int32,Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1replaceText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_replaceText_0_20_6000d11, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %5
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666641, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_replaceText_0_20_6000d11)
	%cb2 = load ptr, ptr @native_cb_replaceText_0_20_6000d11, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %5
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %5]
	%6 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4)
	ret i1 %6
}

; Method: System.Void Android.Views.InputMethods.IInputConnection::n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::RequestTextBoundsInfo(Android.Graphics.RectF,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IConsumer)
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::RequestTextBoundsInfo(Android.Graphics.RectF,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IConsumer)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestTextBoundsInfo(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestTextBoundsInfo_0_20_6000d12, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666642, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestTextBoundsInfo_0_20_6000d12)
	%cb2 = load ptr, ptr @native_cb_requestTextBoundsInfo_0_20_6000d12, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetImeConsumesInput_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetImeConsumesInput(System.Boolean)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetImeConsumesInput(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setImeConsumesInput(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setImeConsumesInput_0_20_6000d13, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666643, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setImeConsumesInput_0_20_6000d13)
	%cb2 = load ptr, ptr @native_cb_setImeConsumesInput_0_20_6000d13, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret i1 %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnection::n_TakeSnapshot_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.TextSnapshot Android.Views.InputMethods.IInputConnection::TakeSnapshot()
; Implemented: Android.Views.InputMethods.TextSnapshot Android.Views.InputMethods.IInputConnection::TakeSnapshot()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1takeSnapshot(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_takeSnapshot_0_20_6000d14, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 20, i32 noundef 100666644, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_takeSnapshot_0_20_6000d14)
	%cb2 = load ptr, ptr @native_cb_takeSnapshot_0_20_6000d14, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Ffmpegkit.Droid.IFFmpegSessionCompleteCallbackInvoker::n_Apply_Lcom_arthenica_ffmpegkit_FFmpegSession__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
; Registered: System.Void Ffmpegkit.Droid.IFFmpegSessionCompleteCallback::Apply(Ffmpegkit.Droid.FFmpegSession)
; Implemented: System.Void Ffmpegkit.Droid.IFFmpegSessionCompleteCallback::Apply(Ffmpegkit.Droid.FFmpegSession)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6414fb8ed825ee5337_ActionFFmpegSessionCompleteCallback_n_1apply(ptr noundef %env, ptr noundef %klass, ptr noundef %p0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_apply_4_21_60002ee, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 17, i32 noundef 21, i32 noundef 100664046, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_apply_4_21_60002ee)
	%cb2 = load ptr, ptr @native_cb_apply_4_21_60002ee, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %p0)
	ret void
}

; Method: System.Void Ffmpegkit.Droid.IFFprobeSessionCompleteCallbackInvoker::n_Apply_Lcom_arthenica_ffmpegkit_FFprobeSession__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
; Registered: System.Void Ffmpegkit.Droid.IFFprobeSessionCompleteCallback::Apply(Ffmpegkit.Droid.FFprobeSession)
; Implemented: System.Void Ffmpegkit.Droid.IFFprobeSessionCompleteCallback::Apply(Ffmpegkit.Droid.FFprobeSession)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6414fb8ed825ee5337_ActionFFprobeSessionCompleteCallback_n_1apply(ptr noundef %env, ptr noundef %klass, ptr noundef %p0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_apply_4_22_60002fb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 17, i32 noundef 22, i32 noundef 100664059, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_apply_4_22_60002fb)
	%cb2 = load ptr, ptr @native_cb_apply_4_22_60002fb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %p0)
	ret void
}

; Method: System.Void Ffmpegkit.Droid.IMediaInformationSessionCompleteCallbackInvoker::n_Apply_Lcom_arthenica_ffmpegkit_MediaInformationSession__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
; Registered: System.Void Ffmpegkit.Droid.IMediaInformationSessionCompleteCallback::Apply(Ffmpegkit.Droid.MediaInformationSession)
; Implemented: System.Void Ffmpegkit.Droid.IMediaInformationSessionCompleteCallback::Apply(Ffmpegkit.Droid.MediaInformationSession)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6414fb8ed825ee5337_ActionMediaInformationSessionCompleteCallback_n_1apply(ptr noundef %env, ptr noundef %klass, ptr noundef %p0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_apply_4_23_6000315, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 17, i32 noundef 23, i32 noundef 100664085, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_apply_4_23_6000315)
	%cb2 = load ptr, ptr @native_cb_apply_4_23_6000315, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %p0)
	ret void
}

; Method: System.Void Ffmpegkit.Droid.ILogCallbackInvoker::n_Apply_Lcom_arthenica_ffmpegkit_Log__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
; Registered: System.Void Ffmpegkit.Droid.ILogCallback::Apply(Ffmpegkit.Droid.Log)
; Implemented: System.Void Ffmpegkit.Droid.ILogCallback::Apply(Ffmpegkit.Droid.Log)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6414fb8ed825ee5337_ActionLogCallback_n_1apply(ptr noundef %env, ptr noundef %klass, ptr noundef %p0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_apply_4_24_6000308, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 17, i32 noundef 24, i32 noundef 100664072, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_apply_4_24_6000308)
	%cb2 = load ptr, ptr @native_cb_apply_4_24_6000308, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %p0)
	ret void
}

; Method: System.Void Ffmpegkit.Droid.IStatisticsCallbackInvoker::n_Apply_Lcom_arthenica_ffmpegkit_Statistics__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null
; Registered: System.Void Ffmpegkit.Droid.IStatisticsCallback::Apply(Ffmpegkit.Droid.Statistics)
; Implemented: System.Void Ffmpegkit.Droid.IStatisticsCallback::Apply(Ffmpegkit.Droid.Statistics)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6414fb8ed825ee5337_ActionStatisticsCallback_n_1apply(ptr noundef %env, ptr noundef %klass, ptr noundef %p0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_apply_4_25_6000393, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 17, i32 noundef 25, i32 noundef 100664211, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_apply_4_25_6000393)
	%cb2 = load ptr, ptr @native_cb_apply_4_25_6000393, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %p0)
	ret void
}

; Method: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker::n_OnContextAvailable_Landroid_content_Context__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListener::OnContextAvailable(Android.Content.Context)
; Implemented: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListener::OnContextAvailable(Android.Content.Context)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_activity_contextaware_OnContextAvailableListenerImplementor_n_1onContextAvailable(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onContextAvailable_2_26_600010f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 20, i32 noundef 26, i32 noundef 100663567, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onContextAvailable_2_26_600010f)
	%cb2 = load ptr, ptr @native_cb_onContextAvailable_2_26_600010f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.View/IOnClickListenerInvoker::n_OnClick_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View/IOnClickListener::OnClick(Android.Views.View)
; Implemented: System.Void Android.Views.View/IOnClickListener::OnClick(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_androidx_appcompat_widget_Toolbar_1NavigationOnClickEventDispatcher_n_1onClick(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onClick_0_27_6000662, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 27, i32 noundef 100664930, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onClick_0_27_6000662)
	%cb2 = load ptr, ptr @native_cb_onClick_0_27_6000662, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.SByte AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker::n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Boolean AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListener::OnMenuItemClick(Android.Views.IMenuItem)
; Implemented: System.Boolean AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListener::OnMenuItemClick(Android.Views.IMenuItem)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_androidx_appcompat_widget_Toolbar_1OnMenuItemClickListenerImplementor_n_1onMenuItemClick(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onMenuItemClick_5_28_60001bd, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 28, i32 noundef 100663741, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onMenuItemClick_5_28_60001bd)
	%cb2 = load ptr, ptr @native_cb_onMenuItemClick_5_28_60001bd, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker::n_OnMenuVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListener::OnMenuVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListener::OnMenuVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_appcompat_app_ActionBar_1OnMenuVisibilityListenerImplementor_n_1onMenuVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onMenuVisibilityChanged_5_29_6000402, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 29, i32 noundef 100664322, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onMenuVisibilityChanged_5_29_6000402)
	%cb2 = load ptr, ptr @native_cb_onMenuVisibilityChanged_5_29_6000402, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret void
}

; Method: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker::n_OnSubUiVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListener::OnSubUiVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListener::OnSubUiVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_ActionProvider_1SubUiVisibilityListenerImplementor_n_1onSubUiVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onSubUiVisibilityChanged_3_30_60002b3, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 30, i32 noundef 100663987, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onSubUiVisibilityChanged_3_30_60002b3)
	%cb2 = load ptr, ptr @native_cb_onSubUiVisibilityChanged_3_30_60002b3, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret void
}

; Method: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker::n_OnActionProviderVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListener::OnActionProviderVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListener::OnActionProviderVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_ActionProvider_1VisibilityListenerImplementor_n_1onActionProviderVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onActionProviderVisibilityChanged_3_31_60002c7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 31, i32 noundef 100664007, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onActionProviderVisibilityChanged_3_31_60002c7)
	%cb2 = load ptr, ptr @native_cb_onActionProviderVisibilityChanged_3_31_60002c7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef zeroext %0)
	ret void
}

; Method: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker::n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
; Implemented: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_WindowInsetsControllerCompat_1OnControllableInsetsChangedListenerImplementor_n_1onControllableInsetsChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onControllableInsetsChanged_3_32_600058d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 32, i32 noundef 100664717, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onControllableInsetsChanged_3_32_600058d)
	%cb2 = load ptr, ptr @native_cb_onControllableInsetsChanged_3_32_600058d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerClosed_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerClosed(Android.Views.View)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerClosed(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerClosed(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerClosed_6_33_60000c7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 33, i32 noundef 100663495, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerClosed_6_33_60000c7)
	%cb2 = load ptr, ptr @native_cb_onDrawerClosed_6_33_60000c7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerOpened_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerOpened(Android.Views.View)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerOpened(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerOpened(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerOpened_6_33_60000c8, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 33, i32 noundef 100663496, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerOpened_6_33_60000c8)
	%cb2 = load ptr, ptr @native_cb_onDrawerOpened_6_33_60000c8, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Single)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerSlide(Android.Views.View,System.Single)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerSlide(Android.Views.View,System.Single)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerSlide(ptr noundef %env, ptr noundef %klass, ptr noundef %0, float noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerSlide_6_33_60000c9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 33, i32 noundef 100663497, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerSlide_6_33_60000c9)
	%cb2 = load ptr, ptr @native_cb_onDrawerSlide_6_33_60000c9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, float noundef %1)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerStateChanged_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerStateChanged(System.Int32)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerStateChanged(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerStateChanged(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerStateChanged_6_33_60000ca, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 33, i32 noundef 100663498, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerStateChanged_6_33_60000ca)
	%cb2 = load ptr, ptr @native_cb_onDrawerStateChanged_6_33_60000ca, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker::n_OnBackStackChanged_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChanged()
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChanged()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChanged(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChanged_7_34_600030d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 34, i32 noundef 100664077, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChanged_7_34_600030d)
	%cb2 = load ptr, ptr @native_cb_onBackStackChanged_7_34_600030d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeCancelled_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCancelled()
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCancelled()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeCancelled(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeCancelled_7_35_60002fe, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 35, i32 noundef 100664062, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeCancelled_7_35_60002fe)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeCancelled_7_35_60002fe, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCommitted(AndroidX.Fragment.App.Fragment,System.Boolean)
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCommitted(AndroidX.Fragment.App.Fragment,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeCommitted(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeCommitted_7_35_60002ff, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 35, i32 noundef 100664063, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeCommitted_7_35_60002ff)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeCommitted_7_35_60002ff, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeProgressed_Landroidx_activity_BackEventCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeProgressed(AndroidX.Activity.BackEventCompat)
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeProgressed(AndroidX.Activity.BackEventCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeProgressed(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeProgressed_7_35_6000300, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 35, i32 noundef 100664064, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeProgressed_7_35_6000300)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeProgressed_7_35_6000300, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeStarted(AndroidX.Fragment.App.Fragment,System.Boolean)
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeStarted(AndroidX.Fragment.App.Fragment,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeStarted(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeStarted_7_35_6000301, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 35, i32 noundef 100664065, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeStarted_7_35_6000301)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeStarted_7_35_6000301, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef zeroext %1)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker::n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.IFragmentOnAttachListener::OnAttachFragment(AndroidX.Fragment.App.FragmentManager,AndroidX.Fragment.App.Fragment)
; Implemented: System.Void AndroidX.Fragment.App.IFragmentOnAttachListener::OnAttachFragment(AndroidX.Fragment.App.FragmentManager,AndroidX.Fragment.App.Fragment)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentOnAttachListenerImplementor_n_1onAttachFragment(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onAttachFragment_7_36_60003c0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 25, i32 noundef 36, i32 noundef 100664256, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onAttachFragment_7_36_60003c0)
	%cb2 = load ptr, ptr @native_cb_onAttachFragment_7_36_60003c0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void Java.Interop.TypeManager/JavaTypeManager::n_Activate_mm(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: none
; Implemented: none
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_TypeManager_n_1activate(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_activate_0_37_6001c18, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 78, i32 noundef 37, i32 noundef 100670488, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_activate_0_37_6001c18)
	%cb2 = load ptr, ptr @native_cb_activate_0_37_6001c18, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr)
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [130 x i8] c"Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.1 = private unnamed_addr constant [101 x i8] c"Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.2 = private unnamed_addr constant [98 x i8] c"Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.3 = private unnamed_addr constant [102 x i8] c"Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.4 = private unnamed_addr constant [108 x i8] c"Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.5 = private unnamed_addr constant [125 x i8] c"Android.OS.MessageQueue/IIdleHandlerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.6 = private unnamed_addr constant [132 x i8] c"AndroidX.CustomView.Widget.ExploreByTouchHelper, Xamarin.AndroidX.CustomView, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.7 = private unnamed_addr constant [102 x i8] c"Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.8 = private unnamed_addr constant [143 x i8] c"Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.9 = private unnamed_addr constant [105 x i8] c"Android.App.Application, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.10 = private unnamed_addr constant [100 x i8] c"Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.11 = private unnamed_addr constant [122 x i8] c"AndroidX.Activity.OnBackPressedCallback, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.12 = private unnamed_addr constant [126 x i8] c"Android.Views.ISurfaceHolderCallback2Invoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.13 = private unnamed_addr constant [119 x i8] c"Android.Views.ISurfaceHolderCallback2, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.14 = private unnamed_addr constant [125 x i8] c"Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.15 = private unnamed_addr constant [134 x i8] c"AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.16 = private unnamed_addr constant [133 x i8] c"AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.17 = private unnamed_addr constant [115 x i8] c"Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.18 = private unnamed_addr constant [145 x i8] c"Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.19 = private unnamed_addr constant [132 x i8] c"Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.20 = private unnamed_addr constant [125 x i8] c"Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.21 = private unnamed_addr constant [140 x i8] c"Ffmpegkit.Droid.IFFmpegSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.22 = private unnamed_addr constant [141 x i8] c"Ffmpegkit.Droid.IFFprobeSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.23 = private unnamed_addr constant [150 x i8] c"Ffmpegkit.Droid.IMediaInformationSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.24 = private unnamed_addr constant [122 x i8] c"Ffmpegkit.Droid.ILogCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.25 = private unnamed_addr constant [129 x i8] c"Ffmpegkit.Droid.IStatisticsCallbackInvoker, FFmpegKit.Net.FullGpl.Android, Version=8.1.2.4, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.26 = private unnamed_addr constant [148 x i8] c"AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.27 = private unnamed_addr constant [124 x i8] c"Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.28 = private unnamed_addr constant [149 x i8] c"AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.29 = private unnamed_addr constant [149 x i8] c"AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.30 = private unnamed_addr constant [144 x i8] c"AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.31 = private unnamed_addr constant [139 x i8] c"AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.32 = private unnamed_addr constant [170 x i8] c"AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.33 = private unnamed_addr constant [151 x i8] c"AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.34 = private unnamed_addr constant [155 x i8] c"AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.35 = private unnamed_addr constant [148 x i8] c"AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.36 = private unnamed_addr constant [137 x i8] c"AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 16
@.mm.37 = private unnamed_addr constant [122 x i8] c"Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 16
@.mm.38 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [76 x i8] c"n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.1_name = private unnamed_addr constant [34 x i8] c"n_Close_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.2_name = private unnamed_addr constant [33 x i8] c"n_Read_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.3_name = private unnamed_addr constant [47 x i8] c"n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.4_name = private unnamed_addr constant [61 x i8] c"n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.5_name = private unnamed_addr constant [61 x i8] c"n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.6_name = private unnamed_addr constant [40 x i8] c"n_GetHashCode_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.7_name = private unnamed_addr constant [37 x i8] c"n_ToString_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.8_name = private unnamed_addr constant [34 x i8] c"n_Flush_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.9_name = private unnamed_addr constant [48 x i8] c"n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.10_name = private unnamed_addr constant [62 x i8] c"n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.11_name = private unnamed_addr constant [42 x i8] c"n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.12_name = private unnamed_addr constant [32 x i8] c"n_Run_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.13_name = private unnamed_addr constant [38 x i8] c"n_QueueIdle_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.14_name = private unnamed_addr constant [62 x i8] c"n_GetVirtualViewAt_FF_mm_wrapper(IntPtr,IntPtr,Single,Single)\00", align 16
@.MarshalMethodName.15_name = private unnamed_addr constant [75 x i8] c"n_GetVisibleVirtualViews_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.16_name = private unnamed_addr constant [99 x i8] c"n_OnPerformActionForVirtualView_IILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)\00", align 16
@.MarshalMethodName.17_name = private unnamed_addr constant [134 x i8] c"n_OnPopulateNodeForVirtualView_ILandroidx_core_view_accessibility_AccessibilityNodeInfoCompat__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)\00", align 16
@.MarshalMethodName.18_name = private unnamed_addr constant [42 x i8] c"n_OnBackPressed_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.19_name = private unnamed_addr constant [64 x i8] c"n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.20_name = private unnamed_addr constant [72 x i8] c"n_OnNewIntent_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.21_name = private unnamed_addr constant [35 x i8] c"n_OnStop_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.22_name = private unnamed_addr constant [36 x i8] c"n_OnStart_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.23_name = private unnamed_addr constant [37 x i8] c"n_OnResume_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.24_name = private unnamed_addr constant [38 x i8] c"n_OnDestroy_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.25_name = private unnamed_addr constant [91 x i8] c"n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)\00", align 16
@.MarshalMethodName.26_name = private unnamed_addr constant [106 x i8] c"n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.27_name = private unnamed_addr constant [43 x i8] c"n_OnGlobalLayout_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.28_name = private unnamed_addr constant [37 x i8] c"n_OnCreate_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.29_name = private unnamed_addr constant [47 x i8] c"n_OnAttachedToWindow_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.30_name = private unnamed_addr constant [59 x i8] c"n_OnVisibilityAggregated_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.31_name = private unnamed_addr constant [82 x i8] c"n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.32_name = private unnamed_addr constant [94 x i8] c"n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.33_name = private unnamed_addr constant [97 x i8] c"n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.34_name = private unnamed_addr constant [88 x i8] c"n_OnFocusChanged_ZILandroid_graphics_Rect__mm_wrapper(IntPtr,IntPtr,SByte,Int32,IntPtr)\00", align 16
@.MarshalMethodName.35_name = private unnamed_addr constant [81 x i8] c"n_DispatchHoverEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.36_name = private unnamed_addr constant [90 x i8] c"n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.37_name = private unnamed_addr constant [81 x i8] c"n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.38_name = private unnamed_addr constant [76 x i8] c"n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.39_name = private unnamed_addr constant [48 x i8] c"n_HandleOnBackPressed_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.40_name = private unnamed_addr constant [84 x i8] c"n_SurfaceRedrawNeeded_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.41_name = private unnamed_addr constant [116 x i8] c"n_SurfaceRedrawNeededAsync_Landroid_view_SurfaceHolder_Ljava_lang_Runnable__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.42_name = private unnamed_addr constant [100 x i8] c"n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)\00", align 16
@.MarshalMethodName.43_name = private unnamed_addr constant [79 x i8] c"n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.44_name = private unnamed_addr constant [81 x i8] c"n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.45_name = private unnamed_addr constant [160 x i8] c"n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.46_name = private unnamed_addr constant [109 x i8] c"n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.47_name = private unnamed_addr constant [121 x i8] c"n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.48_name = private unnamed_addr constant [102 x i8] c"n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.49_name = private unnamed_addr constant [51 x i8] c"n_OnDisplayAdded_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.50_name = private unnamed_addr constant [53 x i8] c"n_OnDisplayChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.51_name = private unnamed_addr constant [53 x i8] c"n_OnDisplayRemoved_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.52_name = private unnamed_addr constant [74 x i8] c"n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.53_name = private unnamed_addr constant [39 x i8] c"n_GetHandler_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.54_name = private unnamed_addr constant [43 x i8] c"n_BeginBatchEdit_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.55_name = private unnamed_addr constant [55 x i8] c"n_ClearMetaKeyStates_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.56_name = private unnamed_addr constant [44 x i8] c"n_CloseConnection_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.57_name = private unnamed_addr constant [94 x i8] c"n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.58_name = private unnamed_addr constant [126 x i8] c"n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 16
@.MarshalMethodName.59_name = private unnamed_addr constant [94 x i8] c"n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.60_name = private unnamed_addr constant [78 x i8] c"n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.61_name = private unnamed_addr constant [125 x i8] c"n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 16
@.MarshalMethodName.62_name = private unnamed_addr constant [65 x i8] c"n_DeleteSurroundingText_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.63_name = private unnamed_addr constant [77 x i8] c"n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.64_name = private unnamed_addr constant [41 x i8] c"n_EndBatchEdit_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.65_name = private unnamed_addr constant [48 x i8] c"n_FinishComposingText_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.66_name = private unnamed_addr constant [54 x i8] c"n_GetCursorCapsMode_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.67_name = private unnamed_addr constant [107 x i8] c"n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.68_name = private unnamed_addr constant [52 x i8] c"n_GetSelectedText_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.69_name = private unnamed_addr constant [62 x i8] c"n_GetTextAfterCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.70_name = private unnamed_addr constant [63 x i8] c"n_GetTextBeforeCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.71_name = private unnamed_addr constant [61 x i8] c"n_PerformContextMenuAction_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.72_name = private unnamed_addr constant [56 x i8] c"n_PerformEditorAction_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.73_name = private unnamed_addr constant [102 x i8] c"n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.74_name = private unnamed_addr constant [57 x i8] c"n_ReportFullscreenMode_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.75_name = private unnamed_addr constant [57 x i8] c"n_RequestCursorUpdates_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.76_name = private unnamed_addr constant [64 x i8] c"n_RequestCursorUpdates_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.77_name = private unnamed_addr constant [72 x i8] c"n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.78_name = private unnamed_addr constant [62 x i8] c"n_SetComposingRegion_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.79_name = private unnamed_addr constant [109 x i8] c"n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)\00", align 16
@.MarshalMethodName.80_name = private unnamed_addr constant [84 x i8] c"n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.81_name = private unnamed_addr constant [131 x i8] c"n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 16
@.MarshalMethodName.82_name = private unnamed_addr constant [56 x i8] c"n_SetSelection_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 16
@.MarshalMethodName.83_name = private unnamed_addr constant [69 x i8] c"n_GetSurroundingText_III_mm_wrapper(IntPtr,IntPtr,Int32,Int32,Int32)\00", align 16
@.MarshalMethodName.84_name = private unnamed_addr constant [184 x i8] c"n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.85_name = private unnamed_addr constant [46 x i8] c"n_PerformSpellCheck_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.86_name = private unnamed_addr constant [156 x i8] c"n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.87_name = private unnamed_addr constant [140 x i8] c"n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr,Int32,IntPtr)\00", align 16
@.MarshalMethodName.88_name = private unnamed_addr constant [156 x i8] c"n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.89_name = private unnamed_addr constant [56 x i8] c"n_SetImeConsumesInput_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.90_name = private unnamed_addr constant [41 x i8] c"n_TakeSnapshot_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.91_name = private unnamed_addr constant [81 x i8] c"n_Apply_Lcom_arthenica_ffmpegkit_FFmpegSession__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.92_name = private unnamed_addr constant [82 x i8] c"n_Apply_Lcom_arthenica_ffmpegkit_FFprobeSession__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.93_name = private unnamed_addr constant [91 x i8] c"n_Apply_Lcom_arthenica_ffmpegkit_MediaInformationSession__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.94_name = private unnamed_addr constant [71 x i8] c"n_Apply_Lcom_arthenica_ffmpegkit_Log__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.95_name = private unnamed_addr constant [78 x i8] c"n_Apply_Lcom_arthenica_ffmpegkit_Statistics__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.96_name = private unnamed_addr constant [80 x i8] c"n_OnContextAvailable_Landroid_content_Context__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.97_name = private unnamed_addr constant [63 x i8] c"n_OnClick_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.98_name = private unnamed_addr constant [75 x i8] c"n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.99_name = private unnamed_addr constant [60 x i8] c"n_OnMenuVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.100_name = private unnamed_addr constant [61 x i8] c"n_OnSubUiVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.101_name = private unnamed_addr constant [70 x i8] c"n_OnActionProviderVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.102_name = private unnamed_addr constant [120 x i8] c"n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.103_name = private unnamed_addr constant [70 x i8] c"n_OnDrawerClosed_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.104_name = private unnamed_addr constant [70 x i8] c"n_OnDrawerOpened_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.105_name = private unnamed_addr constant [77 x i8] c"n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(IntPtr,IntPtr,IntPtr,Single)\00", align 16
@.MarshalMethodName.106_name = private unnamed_addr constant [57 x i8] c"n_OnDrawerStateChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 16
@.MarshalMethodName.107_name = private unnamed_addr constant [47 x i8] c"n_OnBackStackChanged_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.108_name = private unnamed_addr constant [55 x i8] c"n_OnBackStackChangeCancelled_mm_wrapper(IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.109_name = private unnamed_addr constant [102 x i8] c"n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.110_name = private unnamed_addr constant [99 x i8] c"n_OnBackStackChangeProgressed_Landroidx_activity_BackEventCompat__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.111_name = private unnamed_addr constant [100 x i8] c"n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)\00", align 16
@.MarshalMethodName.112_name = private unnamed_addr constant [131 x i8] c"n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.113_name = private unnamed_addr constant [57 x i8] c"n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 16
@.MarshalMethodName.114_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ d549e1dc4e2a083b08b4f24cb5495e81b99d79b5"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
