; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 79, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [79 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 1627136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: Avalonia.Base
	%struct.CompressedAssemblyDescriptor {
		i32 859648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1629696; uint32_t buffer_offset
	}, ; 2: Avalonia.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 214528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2489344; uint32_t buffer_offset
	}, ; 3: Avalonia.DesignerSupport
	%struct.CompressedAssemblyDescriptor {
		i32 189952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2703872; uint32_t buffer_offset
	}, ; 4: Avalonia.Dialogs
	%struct.CompressedAssemblyDescriptor {
		i32 40448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2893824; uint32_t buffer_offset
	}, ; 5: Avalonia.Markup.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2934272; uint32_t buffer_offset
	}, ; 6: Avalonia.Markup
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2952704; uint32_t buffer_offset
	}, ; 7: Avalonia.Metal
	%struct.CompressedAssemblyDescriptor {
		i32 60416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2966528; uint32_t buffer_offset
	}, ; 8: Avalonia.OpenGL
	%struct.CompressedAssemblyDescriptor {
		i32 164864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3026944; uint32_t buffer_offset
	}, ; 9: Avalonia.Vulkan
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3191808; uint32_t buffer_offset
	}, ; 10: Avalonia
	%struct.CompressedAssemblyDescriptor {
		i32 128512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3195904; uint32_t buffer_offset
	}, ; 11: Avalonia.Android
	%struct.CompressedAssemblyDescriptor {
		i32 1892864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3324416; uint32_t buffer_offset
	}, ; 12: Avalonia.Fonts.Inter
	%struct.CompressedAssemblyDescriptor {
		i32 20992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5217280; uint32_t buffer_offset
	}, ; 13: Avalonia.HarfBuzz
	%struct.CompressedAssemblyDescriptor {
		i32 58368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5238272; uint32_t buffer_offset
	}, ; 14: Avalonia.Remote.Protocol
	%struct.CompressedAssemblyDescriptor {
		i32 92160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5296640; uint32_t buffer_offset
	}, ; 15: Avalonia.Skia
	%struct.CompressedAssemblyDescriptor {
		i32 666112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5388800; uint32_t buffer_offset
	}, ; 16: Avalonia.Themes.Fluent
	%struct.CompressedAssemblyDescriptor {
		i32 221184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6054912; uint32_t buffer_offset
	}, ; 17: FFmpegKit.Net.FullGpl.Android
	%struct.CompressedAssemblyDescriptor {
		i32 29696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6276096; uint32_t buffer_offset
	}, ; 18: HarfBuzzSharp
	%struct.CompressedAssemblyDescriptor {
		i32 109056, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6305792; uint32_t buffer_offset
	}, ; 19: SkiaSharp
	%struct.CompressedAssemblyDescriptor {
		i32 61952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6414848; uint32_t buffer_offset
	}, ; 20: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 375808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6476800; uint32_t buffer_offset
	}, ; 21: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 508416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6852608; uint32_t buffer_offset
	}, ; 22: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 20992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7361024; uint32_t buffer_offset
	}, ; 23: Xamarin.AndroidX.CustomView
	%struct.CompressedAssemblyDescriptor {
		i32 44544, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7382016; uint32_t buffer_offset
	}, ; 24: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 223232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7426560; uint32_t buffer_offset
	}, ; 25: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7649792; uint32_t buffer_offset
	}, ; 26: Xamarin.AndroidX.Lifecycle.Common.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7669248; uint32_t buffer_offset
	}, ; 27: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 32768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7686656; uint32_t buffer_offset
	}, ; 28: Xamarin.AndroidX.Lifecycle.ViewModel.Android
	%struct.CompressedAssemblyDescriptor {
		i32 39424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7719424; uint32_t buffer_offset
	}, ; 29: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 34816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7758848; uint32_t buffer_offset
	}, ; 30: Xamarin.AndroidX.NavigationEvent.Android
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7793664; uint32_t buffer_offset
	}, ; 31: Xamarin.AndroidX.SavedState.SavedState.Android
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7805952; uint32_t buffer_offset
	}, ; 32: Xamarin.AndroidX.Window
	%struct.CompressedAssemblyDescriptor {
		i32 89600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7825920; uint32_t buffer_offset
	}, ; 33: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7915520; uint32_t buffer_offset
	}, ; 34: Xamarin.KotlinX.Coroutines.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 205312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7933952; uint32_t buffer_offset
	}, ; 35: Bulkut.Core
	%struct.CompressedAssemblyDescriptor {
		i32 212992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8139264; uint32_t buffer_offset
	}, ; 36: Bulkut.Shared
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8352256; uint32_t buffer_offset
	}, ; 37: Bulkut.Android
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8371712; uint32_t buffer_offset
	}, ; 38: Microsoft.Win32.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 30720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8376832; uint32_t buffer_offset
	}, ; 39: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8407552; uint32_t buffer_offset
	}, ; 40: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8422400; uint32_t buffer_offset
	}, ; 41: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 45056, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8433664; uint32_t buffer_offset
	}, ; 42: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8478720; uint32_t buffer_offset
	}, ; 43: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 85504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8490496; uint32_t buffer_offset
	}, ; 44: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8576000; uint32_t buffer_offset
	}, ; 45: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8581632; uint32_t buffer_offset
	}, ; 46: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 46080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8593920; uint32_t buffer_offset
	}, ; 47: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 68608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8640000; uint32_t buffer_offset
	}, ; 48: System.Diagnostics.Process
	%struct.CompressedAssemblyDescriptor {
		i32 60416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8708608; uint32_t buffer_offset
	}, ; 49: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8769024; uint32_t buffer_offset
	}, ; 50: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 32256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8791040; uint32_t buffer_offset
	}, ; 51: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8823296; uint32_t buffer_offset
	}, ; 52: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 22528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8829440; uint32_t buffer_offset
	}, ; 53: System.IO.Pipes
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8851968; uint32_t buffer_offset
	}, ; 54: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 66048, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8863232; uint32_t buffer_offset
	}, ; 55: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 14336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8929280; uint32_t buffer_offset
	}, ; 56: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 119808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 8943616; uint32_t buffer_offset
	}, ; 57: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9063424; uint32_t buffer_offset
	}, ; 58: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 64000, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9090560; uint32_t buffer_offset
	}, ; 59: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9154560; uint32_t buffer_offset
	}, ; 60: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 105472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9162240; uint32_t buffer_offset
	}, ; 61: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9267712; uint32_t buffer_offset
	}, ; 62: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 74240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9284608; uint32_t buffer_offset
	}, ; 63: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 72192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9358848; uint32_t buffer_offset
	}, ; 64: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9431040; uint32_t buffer_offset
	}, ; 65: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 77312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9440256; uint32_t buffer_offset
	}, ; 66: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9517568; uint32_t buffer_offset
	}, ; 67: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 124416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9528832; uint32_t buffer_offset
	}, ; 68: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9653248; uint32_t buffer_offset
	}, ; 69: System.Text.Encoding.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 29696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9658368; uint32_t buffer_offset
	}, ; 70: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 360448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9688064; uint32_t buffer_offset
	}, ; 71: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 329728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 10048512; uint32_t buffer_offset
	}, ; 72: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 10378240; uint32_t buffer_offset
	}, ; 73: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 10390528; uint32_t buffer_offset
	}, ; 74: System
	%struct.CompressedAssemblyDescriptor {
		i32 2017280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 10395648; uint32_t buffer_offset
	}, ; 75: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 169472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 12412928; uint32_t buffer_offset
	}, ; 76: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 22368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 12582400; uint32_t buffer_offset
	}, ; 77: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 1201664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 12604768; uint32_t buffer_offset
	} ; 78: Mono.Android
], align 4

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 13806432, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [13806432 x i8] zeroinitializer, align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ d549e1dc4e2a083b08b4f24cb5495e81b99d79b5"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
