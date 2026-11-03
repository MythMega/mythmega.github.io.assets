; ModuleID = 'typemaps.x86_64.ll'
source_filename = "typemaps.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 20, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 547, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [20 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x03, i8 u0x27, i8 u0x8b, i8 u0xbb, i8 u0xa2, i8 u0xff, i8 u0x5b, i8 u0x45, i8 u0x98, i8 u0x19, i8 u0x44, i8 u0x3e, i8 u0x56, i8 u0x9b, i8 u0x63, i8 u0xde ], ; module_uuid: bb8b2703-ffa2-455b-9819-443e569b63de
		i32 57, ; uint32_t entry_count
		i32 19, ; uint32_t duplicate_count
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module0_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: Xamarin.AndroidX.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x13, i8 u0xeb, i8 u0x7d, i8 u0xef, i8 u0x97, i8 u0xb7, i8 u0xf2, i8 u0x4a, i8 u0xbc, i8 u0x4c, i8 u0xdc, i8 u0x4f, i8 u0x37, i8 u0x70, i8 u0x04, i8 u0x6e ], ; module_uuid: ef7deb13-b797-4af2-bc4c-dc4f3770046e
		i32 2, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.LiveData.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x1d, i8 u0x59, i8 u0xaf, i8 u0x3b, i8 u0x24, i8 u0x78, i8 u0x18, i8 u0x47, i8 u0x9a, i8 u0xce, i8 u0xd1, i8 u0x35, i8 u0xa9, i8 u0x44, i8 u0x04, i8 u0xcd ], ; module_uuid: 3baf591d-7824-4718-9ace-d135a94404cd
		i32 5, ; uint32_t entry_count
		i32 3, ; uint32_t duplicate_count
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.Common.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 2
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x25, i8 u0x67, i8 u0x8c, i8 u0x35, i8 u0x8e, i8 u0xe4, i8 u0xb6, i8 u0x4d, i8 u0xbb, i8 u0x4b, i8 u0x4e, i8 u0xea, i8 u0x3c, i8 u0xd8, i8 u0x29, i8 u0xc4 ], ; module_uuid: 358c6725-e48e-4db6-bb4b-4eea3cd829c4
		i32 29, ; uint32_t entry_count
		i32 16, ; uint32_t duplicate_count
		ptr @module3_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module3_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.3_assembly_name, ; assembly_name: Xamarin.AndroidX.AppCompat
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 3
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x3c, i8 u0x3f, i8 u0x1a, i8 u0x34, i8 u0x23, i8 u0xf4, i8 u0x6e, i8 u0x47, i8 u0x8b, i8 u0x19, i8 u0x86, i8 u0xab, i8 u0x4d, i8 u0x27, i8 u0x7f, i8 u0x83 ], ; module_uuid: 341a3f3c-f423-476e-8b19-86ab4d277f83
		i32 2, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module4_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.4_assembly_name, ; assembly_name: Bulkut.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 4
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x46, i8 u0x4a, i8 u0x12, i8 u0xd2, i8 u0x78, i8 u0x9b, i8 u0xbd, i8 u0x4a, i8 u0xbb, i8 u0xcc, i8 u0x51, i8 u0xd8, i8 u0x5c, i8 u0xaf, i8 u0x41, i8 u0x64 ], ; module_uuid: d2124a46-9b78-4abd-bbcc-51d85caf4164
		i32 8, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module5_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module5_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.5_assembly_name, ; assembly_name: Xamarin.AndroidX.NavigationEvent.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 5
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x56, i8 u0xc8, i8 u0x8a, i8 u0x8b, i8 u0xdb, i8 u0x11, i8 u0xbe, i8 u0x49, i8 u0xba, i8 u0x1c, i8 u0x95, i8 u0x48, i8 u0x57, i8 u0x8e, i8 u0x52, i8 u0x0b ], ; module_uuid: 8b8ac856-11db-49be-ba1c-9548578e520b
		i32 5, ; uint32_t entry_count
		i32 4, ; uint32_t duplicate_count
		ptr @module6_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module6_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.6_assembly_name, ; assembly_name: Xamarin.AndroidX.Loader
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 6
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x74, i8 u0x38, i8 u0x6f, i8 u0x5b, i8 u0x67, i8 u0x93, i8 u0x12, i8 u0x4f, i8 u0xba, i8 u0x23, i8 u0xf8, i8 u0x24, i8 u0xd3, i8 u0x83, i8 u0xe5, i8 u0x51 ], ; module_uuid: 5b6f3874-9367-4f12-ba23-f824d383e551
		i32 19, ; uint32_t entry_count
		i32 10, ; uint32_t duplicate_count
		ptr @module7_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module7_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.7_assembly_name, ; assembly_name: Xamarin.AndroidX.Fragment
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 7
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x8e, i8 u0xd7, i8 u0x64, i8 u0x1b, i8 u0x4b, i8 u0x12, i8 u0x9f, i8 u0x4a, i8 u0xbf, i8 u0xfd, i8 u0x0a, i8 u0x9c, i8 u0xbd, i8 u0x57, i8 u0x5e, i8 u0x74 ], ; module_uuid: 1b64d78e-124b-4a9f-bffd-0a9cbd575e74
		i32 5, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module8_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module8_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.8_assembly_name, ; assembly_name: Xamarin.AndroidX.Window
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 8
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x9e, i8 u0x06, i8 u0x4e, i8 u0x90, i8 u0x45, i8 u0x91, i8 u0x83, i8 u0x4a, i8 u0xa0, i8 u0x27, i8 u0x01, i8 u0xcf, i8 u0xdf, i8 u0xf1, i8 u0xde, i8 u0xf5 ], ; module_uuid: 904e069e-9145-4a83-a027-01cfdff1def5
		i32 23, ; uint32_t entry_count
		i32 18, ; uint32_t duplicate_count
		ptr @module9_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module9_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.9_assembly_name, ; assembly_name: Xamarin.Kotlin.StdLib
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 9
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa1, i8 u0xfc, i8 u0x58, i8 u0xdd, i8 u0x0c, i8 u0xef, i8 u0x17, i8 u0x4e, i8 u0xa3, i8 u0xc9, i8 u0x21, i8 u0xcb, i8 u0x11, i8 u0x64, i8 u0x3b, i8 u0xd8 ], ; module_uuid: dd58fca1-ef0c-4e17-a3c9-21cb11643bd8
		i32 9, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module10_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module10_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.10_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.ViewModel.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 10
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa8, i8 u0xc5, i8 u0x9e, i8 u0x47, i8 u0x3a, i8 u0x98, i8 u0x0e, i8 u0x46, i8 u0x8e, i8 u0x33, i8 u0x8c, i8 u0xc5, i8 u0x5c, i8 u0x7c, i8 u0x6c, i8 u0xb7 ], ; module_uuid: 479ec5a8-983a-460e-8e33-8cc55c7c6cb7
		i32 293, ; uint32_t entry_count
		i32 124, ; uint32_t duplicate_count
		ptr @module11_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module11_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.11_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 11
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xb3, i8 u0x1d, i8 u0xe6, i8 u0xee, i8 u0xa0, i8 u0xae, i8 u0x40, i8 u0x4b, i8 u0xb0, i8 u0x2c, i8 u0x3e, i8 u0x80, i8 u0x28, i8 u0x3b, i8 u0x95, i8 u0x28 ], ; module_uuid: eee61db3-aea0-4b40-b02c-3e80283b9528
		i32 41, ; uint32_t entry_count
		i32 8, ; uint32_t duplicate_count
		ptr @module12_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module12_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.12_assembly_name, ; assembly_name: FFmpegKit.Net.FullGpl.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 12
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xd9, i8 u0x0e, i8 u0x15, i8 u0x27, i8 u0x26, i8 u0x3c, i8 u0x89, i8 u0x46, i8 u0xab, i8 u0x82, i8 u0x93, i8 u0xfd, i8 u0x6a, i8 u0xcc, i8 u0xa8, i8 u0xe3 ], ; module_uuid: 27150ed9-3c26-4689-ab82-93fd6acca8e3
		i32 1, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module13_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module13_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.13_assembly_name, ; assembly_name: Xamarin.AndroidX.CustomView
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 13
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe3, i8 u0x1f, i8 u0x79, i8 u0xcb, i8 u0x15, i8 u0x66, i8 u0xe3, i8 u0x4f, i8 u0xbb, i8 u0x96, i8 u0x26, i8 u0xd9, i8 u0x32, i8 u0x5b, i8 u0x00, i8 u0x5b ], ; module_uuid: cb791fe3-6615-4fe3-bb96-26d9325b005b
		i32 14, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module14_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.14_assembly_name, ; assembly_name: Avalonia.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 14
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe3, i8 u0xa9, i8 u0x61, i8 u0x6e, i8 u0x2c, i8 u0xaa, i8 u0x42, i8 u0x43, i8 u0xaa, i8 u0xd8, i8 u0x17, i8 u0x7e, i8 u0x22, i8 u0x6b, i8 u0xb9, i8 u0xee ], ; module_uuid: 6e61a9e3-aa2c-4342-aad8-177e226bb9ee
		i32 14, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module15_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module15_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.15_assembly_name, ; assembly_name: Java.Interop
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 15
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe3, i8 u0xf7, i8 u0x23, i8 u0xf6, i8 u0xd0, i8 u0x03, i8 u0x73, i8 u0x48, i8 u0xab, i8 u0x3c, i8 u0x90, i8 u0x8c, i8 u0xc6, i8 u0x1d, i8 u0x0f, i8 u0xd0 ], ; module_uuid: f623f7e3-03d0-4873-ab3c-908cc61d0fd0
		i32 5, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module16_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module16_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.16_assembly_name, ; assembly_name: Xamarin.KotlinX.Coroutines.Core.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 16
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe6, i8 u0x16, i8 u0x37, i8 u0xdf, i8 u0xda, i8 u0xe4, i8 u0x88, i8 u0x4f, i8 u0x94, i8 u0x98, i8 u0x9d, i8 u0x7c, i8 u0xf2, i8 u0x51, i8 u0x4b, i8 u0xb9 ], ; module_uuid: df3716e6-e4da-4f88-9498-9d7cf2514bb9
		i32 2, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module17_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module17_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.17_assembly_name, ; assembly_name: Xamarin.AndroidX.SavedState.SavedState.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 17
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xed, i8 u0x5c, i8 u0x7f, i8 u0x0c, i8 u0xa3, i8 u0xeb, i8 u0xce, i8 u0x4b, i8 u0xb0, i8 u0x05, i8 u0x16, i8 u0xc5, i8 u0x09, i8 u0xd6, i8 u0x00, i8 u0x50 ], ; module_uuid: 0c7f5ced-eba3-4bce-b005-16c509d60050
		i32 3, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module18_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module18_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.18_assembly_name, ; assembly_name: Xamarin.AndroidX.DrawerLayout
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 18
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xf9, i8 u0xf7, i8 u0x24, i8 u0x8e, i8 u0x00, i8 u0xa7, i8 u0x8c, i8 u0x42, i8 u0x9f, i8 u0xbd, i8 u0x59, i8 u0x49, i8 u0xdd, i8 u0xc6, i8 u0x6c, i8 u0x2f ], ; module_uuid: 8e24f7f9-a700-428c-9fbd-5949ddc66c2f
		i32 12, ; uint32_t entry_count
		i32 6, ; uint32_t duplicate_count
		ptr @module19_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module19_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.19_assembly_name, ; assembly_name: Xamarin.AndroidX.Activity
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	} ; 19
], align 16

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [547 x i64] [
	i64 u0x00acd1e6ad3a3aeb, ; 0 => androidx/core/view/autofill/AutofillIdCompat
	i64 u0x013d70f30586d278, ; 1 => javax/net/ssl/KeyManagerFactory
	i64 u0x01beb04ccd88502c, ; 2 => java/util/ListIterator
	i64 u0x01cd624f1e38cc9f, ; 3 => java/lang/Byte
	i64 u0x0304e457b1d15194, ; 4 => android/view/ViewGroup$MarginLayoutParams
	i64 u0x0322801148f8b287, ; 5 => androidx/activity/result/contract/ActivityResultContract$SynchronousResult
	i64 u0x03cc98b851d4262c, ; 6 => javax/net/ssl/SSLContext
	i64 u0x041aa4da751eea19, ; 7 => android/text/style/CharacterStyle
	i64 u0x046f73a441471a0a, ; 8 => com/arthenica/ffmpegkit/Chapter
	i64 u0x0577cfd0edc0d47c, ; 9 => android/view/View$OnFocusChangeListener
	i64 u0x05dce036569f9c03, ; 10 => androidx/lifecycle/LiveData
	i64 u0x0667c2ff529558c5, ; 11 => androidx/navigationevent/NavigationEventInput
	i64 u0x06c347d38116f240, ; 12 => android/content/res/TypedArray
	i64 u0x06f84afe4273c430, ; 13 => java/net/InetSocketAddress
	i64 u0x07ede16120373a51, ; 14 => androidx/appcompat/view/menu/SubMenuBuilder
	i64 u0x083e83bb2321dd50, ; 15 => java/util/Random
	i64 u0x08ba5597603eed52, ; 16 => androidx/core/view/WindowInsetsAnimationControlListenerCompat
	i64 u0x093dc45ca957cef5, ; 17 => com/arthenica/ffmpegkit/LibreTranslateProvider
	i64 u0x09f386b034c10e2a, ; 18 => java/util/function/IntFunction
	i64 u0x0a364502506e12a9, ; 19 => android/os/CancellationSignal
	i64 u0x0ab77b7a4f03d9cf, ; 20 => android/widget/Adapter
	i64 u0x0b1da699fb29019a, ; 21 => android/os/BaseBundle
	i64 u0x0b6d47b337d450b1, ; 22 => androidx/lifecycle/viewmodel/ViewModelInitializer
	i64 u0x0b95dc6056abf25b, ; 23 => android/widget/FrameLayout
	i64 u0x0c44130caa233945, ; 24 => mono/android/runtime/JavaObject
	i64 u0x0d9335f0988cd796, ; 25 => java/util/HashMap
	i64 u0x0ed9459c549526c1, ; 26 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat
	i64 u0x0fbb00760377c24f, ; 27 => kotlinx/coroutines/flow/FlowCollector
	i64 u0x102731205d6f1f1c, ; 28 => android/graphics/Path
	i64 u0x103d8579c39974d7, ; 29 => androidx/core/view/DisplayCutoutCompat
	i64 u0x10626cf007c7eb7e, ; 30 => crc641fe58d40b3a958ab/AndroidInsetsManager
	i64 u0x106be7c89662702e, ; 31 => java/net/Proxy$Type
	i64 u0x10cc64dc53558d33, ; 32 => android/content/ComponentName
	i64 u0x10e015905ca8bd0f, ; 33 => java/security/cert/Certificate
	i64 u0x110217f9f8accd72, ; 34 => android/view/WindowInsetsController
	i64 u0x116532ec07ee0771, ; 35 => java/security/spec/KeySpec
	i64 u0x11b3df35e5eac800, ; 36 => androidx/appcompat/app/ActionBar$OnNavigationListener
	i64 u0x11cef49ec24439a7, ; 37 => androidx/core/graphics/Insets
	i64 u0x11d17bb5232d3c3a, ; 38 => android/view/ContentInfo
	i64 u0x134fb5354fb590b7, ; 39 => kotlin/reflect/KCallable
	i64 u0x13e5902d3b855db6, ; 40 => javax/net/ssl/TrustManagerFactory
	i64 u0x13e7a20cea38d010, ; 41 => kotlin/reflect/KFunction
	i64 u0x15771589264f32c6, ; 42 => java/util/List
	i64 u0x16698ccdb078d100, ; 43 => androidx/core/app/ActivityOptionsCompat
	i64 u0x167be582da7ac6ee, ; 44 => android/view/WindowInsetsController$OnControllableInsetsChangedListener
	i64 u0x16c70a05a8455695, ; 45 => android/view/inputmethod/InputMethodManager
	i64 u0x1709693bced8b619, ; 46 => android/view/animation/Animation
	i64 u0x1759b71b41bc5f1b, ; 47 => android/content/pm/PackageItemInfo
	i64 u0x17e1aa318b621d80, ; 48 => androidx/lifecycle/LifecycleOwner
	i64 u0x1830778aad99d496, ; 49 => androidx/lifecycle/ViewModelProvider
	i64 u0x1895f55b7520a32a, ; 50 => android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo
	i64 u0x193ea5b13d78ca47, ; 51 => androidx/appcompat/view/menu/MenuPresenter
	i64 u0x194b32fbae047fc7, ; 52 => net/dot/jni/internal/JavaProxyObject
	i64 u0x194d1c70efc62030, ; 53 => java/util/concurrent/atomic/AtomicLong
	i64 u0x1950fac852291891, ; 54 => android/view/WindowInsetsAnimationControlListener
	i64 u0x1cbdcf00c44f2034, ; 55 => androidx/lifecycle/Observer
	i64 u0x1e0000284caa3573, ; 56 => android/os/LocaleList
	i64 u0x1e04bf19f9c14045, ; 57 => android/util/AttributeSet
	i64 u0x1e549855226528a2, ; 58 => java/io/InterruptedIOException
	i64 u0x1e69018626ef9ffb, ; 59 => android/os/Handler
	i64 u0x1e72ebd893590a84, ; 60 => mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor
	i64 u0x1e957b3efd87ae08, ; 61 => android/content/res/ColorStateList
	i64 u0x1eef7492beaf81e2, ; 62 => android/os/IInterface
	i64 u0x1f60d95e7953fe94, ; 63 => android/media/AudioManager
	i64 u0x1f76a92524b92e96, ; 64 => android/graphics/Region
	i64 u0x1fb6522f1211b131, ; 65 => androidx/core/view/WindowInsetsCompat
	i64 u0x1fd3d46d86772e2b, ; 66 => com/arthenica/ffmpegkit/AsyncGetMediaInformationTask
	i64 u0x208c2e59c4c6d758, ; 67 => java/util/function/ToIntFunction
	i64 u0x2146d4441cf6b35f, ; 68 => androidx/navigationevent/NavigationEventDispatcher
	i64 u0x218f07bbf08c531e, ; 69 => kotlin/coroutines/CoroutineContext$Key
	i64 u0x21b381333982058e, ; 70 => javax/net/SocketFactory
	i64 u0x22436d73eb9797a7, ; 71 => android/content/IntentFilter
	i64 u0x22565b94c87f5a2d, ; 72 => androidx/navigationevent/NavigationEventHistory
	i64 u0x225c20a45cb91cd7, ; 73 => java/lang/Error
	i64 u0x228edb5145b4bbc1, ; 74 => android/view/InputEvent
	i64 u0x24336b0b8aaf4cfe, ; 75 => androidx/appcompat/app/ActionBarDrawerToggle$Delegate
	i64 u0x248f0ba39c12bd38, ; 76 => com/arthenica/ffmpegkit/StreamInformation
	i64 u0x24edf00764c48f4d, ; 77 => androidx/navigationevent/OnBackCompletedFallback
	i64 u0x24f44152583c2169, ; 78 => androidx/core/view/WindowInsetsCompat$Type
	i64 u0x25d7c87aca9055b7, ; 79 => androidx/window/layout/WindowMetricsCalculator
	i64 u0x26289fe3271b6a30, ; 80 => crc6431345fe65afe8d98/AndroidDispatcherImpl_IdleHandler
	i64 u0x262aa502bcb0b33a, ; 81 => mono/internal/androidx/window/layout/WindowMetricsCalculator
	i64 u0x272ea4375d87e30b, ; 82 => androidx/activity/result/ActivityResultCallback
	i64 u0x2975831afa63f308, ; 83 => android/view/SearchEvent
	i64 u0x2a863404765de198, ; 84 => android/provider/DocumentsContract
	i64 u0x2aaa580533bdfc87, ; 85 => com/arthenica/ffmpegkit/Session
	i64 u0x2aee053a4160bbec, ; 86 => kotlinx/coroutines/flow/Flow
	i64 u0x2b4dc18b8f592fba, ; 87 => android/view/inputmethod/ExtractedText
	i64 u0x2bcca4a8219ac237, ; 88 => javax/security/cert/X509Certificate
	i64 u0x2bd1ad3b5c2d27f0, ; 89 => android/graphics/BlendMode
	i64 u0x2bf6d6708afd9c04, ; 90 => androidx/savedstate/SavedStateRegistry
	i64 u0x2bfb1e07ada83eca, ; 91 => androidx/lifecycle/viewmodel/CreationExtras$Key
	i64 u0x2c0c9dbeeb804874, ; 92 => android/widget/AdapterView
	i64 u0x2ca69a05bb648bda, ; 93 => android/os/MessageQueue$IdleHandler
	i64 u0x2eacb325830db74c, ; 94 => android/database/ContentObserver
	i64 u0x2ff9fb2c70f4f954, ; 95 => java/lang/SecurityException
	i64 u0x3068b2cc16f39dc1, ; 96 => android/view/ContextMenu$ContextMenuInfo
	i64 u0x30abf4d5cd5193ea, ; 97 => kotlin/reflect/KAnnotatedElement
	i64 u0x31f6cbff3196a79a, ; 98 => android/content/IntentSender
	i64 u0x321c29cf8c6f7a93, ; 99 => android/content/res/Resources
	i64 u0x32d6a1d6ee9f6d5a, ; 100 => android/content/Intent
	i64 u0x32f4c79d0d754da7, ; 101 => android/content/ClipDescription
	i64 u0x3303b2dc3e6264c8, ; 102 => com/arthenica/ffmpegkit/GoogleTranslateProvider
	i64 u0x332031975eda7654, ; 103 => java/lang/Boolean
	i64 u0x33446dc637a16331, ; 104 => android/view/Menu
	i64 u0x339314fb190f366a, ; 105 => androidx/appcompat/widget/Toolbar$OnMenuItemClickListener
	i64 u0x33d52fa94ce94e04, ; 106 => androidx/core/internal/view/SupportMenuItem
	i64 u0x3436cf09b45d055e, ; 107 => java/security/Principal
	i64 u0x348d00618320f783, ; 108 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat
	i64 u0x34922aa49b075749, ; 109 => androidx/activity/result/ActivityResultLauncher
	i64 u0x34a4414d9498be08, ; 110 => androidx/core/view/WindowInsetsControllerCompat
	i64 u0x3597601cb7938b19, ; 111 => crc646f32ce3c20719675/MainActivity
	i64 u0x35e989807a64bcd9, ; 112 => java/lang/IllegalStateException
	i64 u0x365beab729cdeb25, ; 113 => com/arthenica/ffmpegkit/WhisperKit
	i64 u0x3690c8ddd0de1650, ; 114 => android/util/Pair
	i64 u0x3695825e95d58a86, ; 115 => java/lang/ClassLoader
	i64 u0x36a21a5536d10d64, ; 116 => android/view/LayoutInflater
	i64 u0x374e29f85377aa8d, ; 117 => androidx/activity/BackEventCompat
	i64 u0x37b71a054ebc0df3, ; 118 => android/animation/AnimatorListenerAdapter
	i64 u0x387ea5e03a2b7d86, ; 119 => crc643ec2256bd5ff4bdb/AvaloniaInputConnection
	i64 u0x39598be8860f4637, ; 120 => androidx/fragment/app/FragmentHostCallback
	i64 u0x399255970a652898, ; 121 => android/view/View$DragShadowBuilder
	i64 u0x39f1c81500ddb55b, ; 122 => [F
	i64 u0x3a8127906692d290, ; 123 => android/graphics/Matrix
	i64 u0x3b01cd169489a0ba, ; 124 => android/view/inputmethod/InputConnection
	i64 u0x3b42d29f06c95015, ; 125 => android/view/accessibility/AccessibilityNodeInfo
	i64 u0x3b7d361981ea925e, ; 126 => crc6414fb8ed825ee5337/ActionFFprobeSessionCompleteCallback
	i64 u0x3bbcf2fd26063dab, ; 127 => androidx/activity/result/ActivityResultRegistry
	i64 u0x3c9998f52981b14e, ; 128 => androidx/window/layout/WindowMetricsCalculatorDecorator
	i64 u0x3d6c541ff5df241e, ; 129 => android/view/contentcapture/ContentCaptureSession
	i64 u0x3f97d8ee32f8b25b, ; 130 => android/view/ViewParent
	i64 u0x406674a24d5431f9, ; 131 => crc641fe58d40b3a958ab/AndroidScreens_DisplayListener
	i64 u0x406e54c64b3bee74, ; 132 => android/runtime/JavaProxyThrowable
	i64 u0x40c05cff47992547, ; 133 => android/view/ViewGroup
	i64 u0x415e631ae10d9777, ; 134 => androidx/fragment/app/FragmentTransaction
	i64 u0x41ac0ab939dc266a, ; 135 => android/view/MenuItem$OnActionExpandListener
	i64 u0x41bebe9788d0065d, ; 136 => java/util/concurrent/Future
	i64 u0x41d091ef7039ab94, ; 137 => java/net/URLConnection
	i64 u0x4209344bc1b095c1, ; 138 => java/net/ProtocolException
	i64 u0x42e91d1f598314ca, ; 139 => android/database/DataSetObserver
	i64 u0x4326e660e16a4f2a, ; 140 => kotlin/jvm/functions/Function2
	i64 u0x439a14affe23e7c0, ; 141 => androidx/appcompat/view/ActionMode$Callback
	i64 u0x43bf06faa05dffed, ; 142 => androidx/loader/content/Loader
	i64 u0x440eda1cb69308a3, ; 143 => androidx/fragment/app/FragmentManager
	i64 u0x44658a06eeb7f200, ; 144 => android/view/SurfaceHolder$Callback2
	i64 u0x44f97d12c07d2d2f, ; 145 => java/util/Date
	i64 u0x44ffe2c45c3ddc75, ; 146 => com/arthenica/ffmpegkit/Log
	i64 u0x46471c60ac99f101, ; 147 => androidx/appcompat/view/menu/MenuItemImpl
	i64 u0x482246ca274ee68f, ; 148 => androidx/activity/contextaware/OnContextAvailableListener
	i64 u0x48551bdd564d3318, ; 149 => com/arthenica/ffmpegkit/SessionState
	i64 u0x48e1abb584b78c94, ; 150 => java/io/Writer
	i64 u0x4953047b4b56c007, ; 151 => androidx/navigationevent/NavigationEventTransitionState
	i64 u0x498a2008341e885e, ; 152 => crc6414fb8ed825ee5337/ActionLogCallback
	i64 u0x498bbf94c21599c2, ; 153 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat
	i64 u0x49f836b50dc30062, ; 154 => androidx/core/app/ComponentActivity$ExtraData
	i64 u0x4a39213a97fe1b2f, ; 155 => java/net/ConnectException
	i64 u0x4b259e47b25e5c84, ; 156 => androidx/appcompat/view/menu/MenuPresenter$Callback
	i64 u0x4b9f25f301daddd8, ; 157 => androidx/core/view/ViewPropertyAnimatorListener
	i64 u0x4bc3254021830535, ; 158 => androidx/fragment/app/Fragment
	i64 u0x4d3c4bca1c8dea14, ; 159 => kotlin/reflect/KTypeProjection
	i64 u0x4da4ac13d373d9d4, ; 160 => android/view/SurfaceHolder$Callback
	i64 u0x4e61c3b9ac2637b5, ; 161 => crc64bd239b21961e24ab/TopLevelImpl_SurfaceViewImpl
	i64 u0x4e6ec1690cfd5ab7, ; 162 => androidx/fragment/app/FragmentOnAttachListener
	i64 u0x4e7e0c32a0c92595, ; 163 => android/animation/Animator
	i64 u0x4f858ea9c9162f43, ; 164 => android/os/IBinder
	i64 u0x505b1379ff157a72, ; 165 => android/view/Surface
	i64 u0x510cd0b373b44ae5, ; 166 => org/json/JSONObject
	i64 u0x516bd5763f07d608, ; 167 => android/net/Uri
	i64 u0x5181b129b1a25949, ; 168 => java/lang/Class
	i64 u0x5238ad63b58da994, ; 169 => java/lang/ClassCastException
	i64 u0x529da4201fa0d461, ; 170 => net/dot/jni/internal/JavaProxyThrowable
	i64 u0x529e559bd64e4c22, ; 171 => javax/net/ssl/HttpsURLConnection
	i64 u0x52fd7957cc296462, ; 172 => android/provider/Settings$Secure
	i64 u0x53ead18b9df3fcb2, ; 173 => android/os/IBinder$FrozenStateChangeCallback
	i64 u0x53f1a1773a4ecbf7, ; 174 => android/content/res/Resources$Theme
	i64 u0x5457a3ee93e79e1b, ; 175 => android/view/inputmethod/EditorInfo
	i64 u0x54c8b157aaa152c8, ; 176 => androidx/fragment/app/FragmentManager$BackStackEntry
	i64 u0x54f3fe7b69fcb0b9, ; 177 => androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener
	i64 u0x551ac881eb4466c0, ; 178 => java/lang/Number
	i64 u0x560a92597b121e00, ; 179 => [C
	i64 u0x56365290d5a06704, ; 180 => java/lang/LinkageError
	i64 u0x5670d8d609f8e657, ; 181 => android/view/inputmethod/CompletionInfo
	i64 u0x5681ede87251094b, ; 182 => android/graphics/Point
	i64 u0x56b3097a5575b1b4, ; 183 => androidx/fragment/app/strictmode/FragmentStrictMode$Policy
	i64 u0x5719cb7a45389d03, ; 184 => android/view/accessibility/AccessibilityRecord
	i64 u0x578cde9a6ed73057, ; 185 => android/graphics/ColorFilter
	i64 u0x57fe4a40460344db, ; 186 => android/os/Build$VERSION
	i64 u0x5857bf23c650015a, ; 187 => com/arthenica/ffmpegkit/StatisticsCallback
	i64 u0x586ab22a14755113, ; 188 => androidx/appcompat/app/ActionBar$Tab
	i64 u0x58a16f68a40a6aaa, ; 189 => androidx/loader/content/Loader$OnLoadCompleteListener
	i64 u0x58cef513210a5ef8, ; 190 => androidx/appcompat/widget/ScrollingTabContainerView
	i64 u0x5a0481aecc8a3ce2, ; 191 => androidx/activity/ComponentActivity
	i64 u0x5a6af884fe3c181e, ; 192 => android/os/Bundle
	i64 u0x5bfd65ae1a6e6ffc, ; 193 => android/app/Activity
	i64 u0x5bff61abc9367a53, ; 194 => android/graphics/drawable/ColorDrawable
	i64 u0x5c654b241f6531ca, ; 195 => androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat
	i64 u0x5c9a08d12cd9a5b9, ; 196 => android/view/ActionProvider
	i64 u0x5cba207f014f46ab, ; 197 => kotlin/jvm/functions/Function0
	i64 u0x5cd7330887d5dd17, ; 198 => crc6431345fe65afe8d98/BackPressedCallback
	i64 u0x5d7120ab35a49dbf, ; 199 => crc6414fb8ed825ee5337/ActionMediaInformationSessionCompleteCallback
	i64 u0x5ddf7f807cfc0078, ; 200 => androidx/drawerlayout/widget/DrawerLayout$DrawerListener
	i64 u0x5e1c513312ebc1b3, ; 201 => android/view/KeyEvent
	i64 u0x5e38b925960b7be9, ; 202 => android/graphics/Rect
	i64 u0x5f5a9fc3430795a4, ; 203 => android/content/ContextWrapper
	i64 u0x5f7e709faf8646e0, ; 204 => java/lang/Short
	i64 u0x6026ccdf174d8a44, ; 205 => androidx/fragment/app/Fragment$SavedState
	i64 u0x61428f9f249ac534, ; 206 => [Z
	i64 u0x61e294aa76550052, ; 207 => java/util/Comparator
	i64 u0x6219335ac57fb821, ; 208 => java/io/Serializable
	i64 u0x6260a9d5dac2c97c, ; 209 => androidx/core/view/ViewStructureCompat
	i64 u0x62daf35c931c09d6, ; 210 => android/content/BroadcastReceiver
	i64 u0x63a4d78ba35c4679, ; 211 => androidx/core/view/ActionProvider$SubUiVisibilityListener
	i64 u0x659c2abe67a29887, ; 212 => java/lang/Iterable
	i64 u0x65f6b14b7e978927, ; 213 => java/io/IOException
	i64 u0x665e90753f8d897c, ; 214 => androidx/core/view/accessibility/AccessibilityNodeProviderCompat
	i64 u0x667f08b6d0af3e72, ; 215 => com/arthenica/ffmpegkit/MediaInformation
	i64 u0x683b34ba77d878ed, ; 216 => java/util/concurrent/TimeUnit
	i64 u0x683ec3c5964ae14b, ; 217 => android/view/MenuItem$OnMenuItemClickListener
	i64 u0x68aab2487f8d8f9d, ; 218 => androidx/navigationevent/NavigationEvent
	i64 u0x6aa7d9af28b4551f, ; 219 => java/net/SocketTimeoutException
	i64 u0x6bb600235e010d5b, ; 220 => android/view/KeyboardShortcutInfo
	i64 u0x6c7a93e30410e372, ; 221 => com/arthenica/ffmpegkit/FFmpegKitConfig
	i64 u0x6d5687238e2037cb, ; 222 => android/text/TextUtils
	i64 u0x6d6e4849a9c9cd73, ; 223 => androidx/fragment/app/FragmentContainerView
	i64 u0x6d736771e9774ab2, ; 224 => androidx/core/view/WindowInsetsAnimationControllerCompat
	i64 u0x6dbcd0082585a8fa, ; 225 => androidx/appcompat/app/ActionBar$LayoutParams
	i64 u0x6e0fb15bd0f04d15, ; 226 => java/lang/StackTraceElement
	i64 u0x6ef4975bdb7af18f, ; 227 => android/view/MotionEvent
	i64 u0x6ef7816e17e24358, ; 228 => android/graphics/Canvas
	i64 u0x6f7d2d169e2ce1a7, ; 229 => androidx/core/view/ActionProvider$VisibilityListener
	i64 u0x7051eff2058593fd, ; 230 => kotlinx/coroutines/flow/StateFlow
	i64 u0x714152b8b4c7f7d6, ; 231 => java/security/KeyFactory
	i64 u0x71715828b1fce114, ; 232 => android/view/InputDevice
	i64 u0x71a366471b83c5b5, ; 233 => android/graphics/PorterDuff$Mode
	i64 u0x720cd712e1248c34, ; 234 => java/util/Iterator
	i64 u0x7277a93836a4600e, ; 235 => androidx/core/content/FileProvider
	i64 u0x72891d9bc06c0558, ; 236 => androidx/core/view/WindowInsetsCompat$Builder
	i64 u0x72902a32c8eefca5, ; 237 => mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor
	i64 u0x72eebb0413ddcb57, ; 238 => androidx/core/view/MenuProvider
	i64 u0x733b91fe6ad98558, ; 239 => java/util/SequencedCollection
	i64 u0x73cf79d254a53ff7, ; 240 => androidx/customview/widget/ExploreByTouchHelper
	i64 u0x75591c18ddf5e52d, ; 241 => mono/android/TypeManager
	i64 u0x75a8e484d572136c, ; 242 => androidx/core/view/PointerIconCompat
	i64 u0x76011f516f0fd1fa, ; 243 => kotlin/reflect/KType
	i64 u0x7618d20d66679b07, ; 244 => android/view/ActionMode$Callback
	i64 u0x761f7e1b6e4804f9, ; 245 => androidx/lifecycle/viewmodel/CreationExtras
	i64 u0x763c2670ea45f55c, ; 246 => android/graphics/drawable/Drawable
	i64 u0x7672ff526305decc, ; 247 => kotlin/coroutines/CoroutineContext
	i64 u0x769858d73eac9d5a, ; 248 => android/widget/AdapterView$OnItemSelectedListener
	i64 u0x76cbd2104dd555ed, ; 249 => android/content/Context
	i64 u0x775f4b008c098a1a, ; 250 => androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat
	i64 u0x77e17daf4f2798d3, ; 251 => androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener
	i64 u0x78a8a09e70ef45d0, ; 252 => androidx/lifecycle/LifecycleObserver
	i64 u0x78f85ce39df68ca7, ; 253 => androidx/activity/OnBackPressedDispatcher
	i64 u0x790004a16b482410, ; 254 => kotlinx/coroutines/flow/SharedFlow
	i64 u0x79010cb7f8e68c03, ; 255 => androidx/core/app/SharedElementCallback
	i64 u0x7a43f934f91a04e7, ; 256 => crc6414fb8ed825ee5337/ActionFFmpegSessionCompleteCallback
	i64 u0x7b3aeb75b65cbd49, ; 257 => java/security/spec/PKCS8EncodedKeySpec
	i64 u0x7b56b4292dd91c4f, ; 258 => androidx/appcompat/app/ActionBar$OnMenuVisibilityListener
	i64 u0x7b8a450ef3d3c146, ; 259 => androidx/core/view/WindowInsetsAnimationCompat
	i64 u0x7b90c42bde036cae, ; 260 => [I
	i64 u0x7b925bdca68a0101, ; 261 => java/util/ArrayList
	i64 u0x7bc72d027e66ad3c, ; 262 => android/view/Display
	i64 u0x7c93df30f68cf9a7, ; 263 => javax/security/auth/Subject
	i64 u0x7d2c987ae4cd1b0a, ; 264 => androidx/appcompat/app/AppCompatDelegate
	i64 u0x7d8f1e430aa19c68, ; 265 => android/content/ContentProvider
	i64 u0x7e201ad40955df46, ; 266 => android/os/Parcel
	i64 u0x7ef93854923e0913, ; 267 => java/util/Locale
	i64 u0x7fc6286783d5249d, ; 268 => java/security/Key
	i64 u0x7fd6b531797aa365, ; 269 => java/net/URL
	i64 u0x803c00108539f471, ; 270 => androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener
	i64 u0x80b2eff68480f860, ; 271 => androidx/core/app/ComponentActivity
	i64 u0x811a6571399defdf, ; 272 => android/view/ViewTreeObserver
	i64 u0x816611be5081e6a6, ; 273 => androidx/loader/content/Loader$OnLoadCanceledListener
	i64 u0x8291daf981203b37, ; 274 => crc6431345fe65afe8d98/AvaloniaActivity
	i64 u0x82b29892b562cd91, ; 275 => com/arthenica/ffmpegkit/MediaInformationSessionCompleteCallback
	i64 u0x82d4b802f5f16be5, ; 276 => androidx/core/view/ContentInfoCompat
	i64 u0x82e9b62b3dbcc8ca, ; 277 => android/text/ClipboardManager
	i64 u0x831ac2299215129e, ; 278 => android/text/style/ClickableSpan
	i64 u0x8389777d2cbf57e8, ; 279 => kotlin/jvm/internal/markers/KMappedMarker
	i64 u0x8407971d2e654189, ; 280 => androidx/core/view/contentcapture/ContentCaptureSessionCompat
	i64 u0x84de4b691bbece02, ; 281 => android/view/WindowInsetsAnimation$Bounds
	i64 u0x84f94178aab6cc34, ; 282 => java/lang/CharSequence
	i64 u0x85050e3cde4e7573, ; 283 => com/arthenica/ffmpegkit/AsyncFFprobeExecuteTask
	i64 u0x851714794ae293d4, ; 284 => android/content/ContentValues
	i64 u0x852b5457ebdd5c87, ; 285 => android/view/ViewGroup$LayoutParams
	i64 u0x857e9a08c0f1b76a, ; 286 => java/lang/Math
	i64 u0x859050153b4663e6, ; 287 => androidx/navigationevent/NavigationEventInfo
	i64 u0x85f0f67c9a393c74, ; 288 => mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor
	i64 u0x8757d6a5a0083426, ; 289 => mono/androidx/fragment/app/FragmentOnAttachListenerImplementor
	i64 u0x888700b03d541d93, ; 290 => java/lang/RuntimeException
	i64 u0x88f7510c649f4a97, ; 291 => java/io/InputStream
	i64 u0x8a1927818aa18084, ; 292 => javax/net/ssl/KeyManager
	i64 u0x8a3ea3c274e8ce68, ; 293 => java/lang/Character
	i64 u0x8a5349863088c262, ; 294 => androidx/appcompat/app/ActionBarDrawerToggle
	i64 u0x8abed19b023ffa85, ; 295 => androidx/core/util/Pair
	i64 u0x8c1b73e735ad84e6, ; 296 => crc6431345fe65afe8d98/AvaloniaMainActivity
	i64 u0x8c77114d6dcd93fe, ; 297 => java/util/function/Function
	i64 u0x8c879d2956e946a9, ; 298 => crc6431345fe65afe8d98/AvaloniaView
	i64 u0x8c9cbedbb1657afd, ; 299 => android/content/pm/ApplicationInfo
	i64 u0x8caee368049c87fb, ; 300 => com/arthenica/ffmpegkit/AbiDetect
	i64 u0x8d02bdee4d42aad5, ; 301 => androidx/lifecycle/ViewModelStoreOwner
	i64 u0x8d3ef13fbeef669c, ; 302 => androidx/appcompat/view/menu/MenuBuilder$Callback
	i64 u0x8e795a0bfb2fe84b, ; 303 => androidx/core/os/LocaleListCompat
	i64 u0x8e80a8cd4be83f8c, ; 304 => android/view/ActionMode
	i64 u0x8ef620892da8a06a, ; 305 => android/view/MenuInflater
	i64 u0x8f6070b59054e406, ; 306 => androidx/core/view/OnApplyWindowInsetsListener
	i64 u0x90b4aeb45636cd6a, ; 307 => mono/android/runtime/OutputStreamAdapter
	i64 u0x92188d393e2af2d2, ; 308 => java/lang/Throwable
	i64 u0x92b59c839bc46278, ; 309 => java/lang/Thread
	i64 u0x93c4de29e549d733, ; 310 => crc6431345fe65afe8d98/InvalidationAwareSurfaceView
	i64 u0x943a2b2e5130aba3, ; 311 => java/util/function/ToDoubleFunction
	i64 u0x9461b0401dbcf96c, ; 312 => android/app/Dialog
	i64 u0x965bfaf1ff1da014, ; 313 => java/lang/ReflectiveOperationException
	i64 u0x971efc77cd148103, ; 314 => android/hardware/display/DisplayManager$DisplayListener
	i64 u0x9721e6ba29424ff0, ; 315 => android/view/inputmethod/PreviewableHandwritingGesture
	i64 u0x97ada2c2479a9b60, ; 316 => kotlin/reflect/KVisibility
	i64 u0x988101eb35e8c40e, ; 317 => androidx/core/view/AccessibilityDelegateCompat
	i64 u0x98ba110c6c57da31, ; 318 => java/lang/Float
	i64 u0x9908090bdf73918a, ; 319 => androidx/lifecycle/Lifecycle
	i64 u0x995f02becc4146fe, ; 320 => android/content/ClipData
	i64 u0x9969c631954df2e4, ; 321 => android/view/inputmethod/CorrectionInfo
	i64 u0x99b4bc4a856dc9da, ; 322 => android/content/pm/PackageManager
	i64 u0x99df91bab800c287, ; 323 => mono/android/runtime/InputStreamAdapter
	i64 u0x9a23c2d41060f81e, ; 324 => java/io/File
	i64 u0x9a55c691985b1ff7, ; 325 => android/os/Parcelable$Creator
	i64 u0x9a68fa465ca8abf9, ; 326 => java/io/FileDescriptor
	i64 u0x9a8aa4ab975e0ae0, ; 327 => com/arthenica/ffmpegkit/LogCallback
	i64 u0x9bf62f3bae28831c, ; 328 => com/arthenica/ffmpegkit/DeepLTranslationProvider
	i64 u0x9c437fa042ccf440, ; 329 => androidx/savedstate/SavedStateRegistry$SavedStateProvider
	i64 u0x9cb23a330863d0c1, ; 330 => crc646f32ce3c20719675/MainApplication
	i64 u0x9db6accc46c9ce7f, ; 331 => java/util/function/Predicate
	i64 u0x9ddb6fe7564e2094, ; 332 => kotlin/reflect/KDeclarationContainer
	i64 u0x9dddbe9a61dc100f, ; 333 => com/arthenica/ffmpegkit/NativeLoader
	i64 u0x9e10a0b3efa170dc, ; 334 => android/view/ContextThemeWrapper
	i64 u0x9e6dc3e8eedaf8a8, ; 335 => java/net/SocketException
	i64 u0x9e8497fc52a96d4d, ; 336 => android/graphics/PorterDuff
	i64 u0x9ecc38fa7e43a0c8, ; 337 => androidx/fragment/app/FragmentContainer
	i64 u0x9f4c9bf8c1f6ddb2, ; 338 => androidx/core/view/ViewPropertyAnimatorCompat
	i64 u0x9fa1370a1b1093fa, ; 339 => java/lang/NullPointerException
	i64 u0x9fceb9720ff4752f, ; 340 => androidx/lifecycle/ViewModelStore
	i64 u0xa07cbd8408019386, ; 341 => java/net/Proxy
	i64 u0xa0e8bade9ecc1b90, ; 342 => androidx/fragment/app/FragmentManager$OnBackStackChangedListener
	i64 u0xa0ef9facbe641466, ; 343 => androidx/core/view/ViewCompat
	i64 u0xa24d07cd0d5c4f0f, ; 344 => android/animation/TimeInterpolator
	i64 u0xa2c344771af945fc, ; 345 => androidx/activity/FullyDrawnReporter
	i64 u0xa398e93d7065b828, ; 346 => kotlin/Function
	i64 u0xa3ad720d45785742, ; 347 => androidx/appcompat/view/menu/MenuView
	i64 u0xa4414bb71bf7bc36, ; 348 => androidx/lifecycle/ViewModelProvider$Factory
	i64 u0xa47433d85b440c29, ; 349 => androidx/core/util/Predicate
	i64 u0xa4f11cb971c9ae41, ; 350 => crc6431345fe65afe8d98/AvaloniaActivity_GlobalLayoutListener
	i64 u0xa588668feb1b05b9, ; 351 => android/view/SurfaceView
	i64 u0xa59db4b8b7dbe046, ; 352 => javax/net/ssl/SSLSession
	i64 u0xa757f83a95bc65d9, ; 353 => kotlin/reflect/KVariance
	i64 u0xa76f26c70ed71676, ; 354 => androidx/appcompat/app/ActionBar$TabListener
	i64 u0xa865adbdd81d9951, ; 355 => java/io/OutputStream
	i64 u0xa95eae500754348a, ; 356 => java/net/SocketAddress
	i64 u0xaa469f39e9e03bd4, ; 357 => androidx/lifecycle/ViewModelProvider$Factory$Companion
	i64 u0xaa75ead031784774, ; 358 => javax/net/ssl/SSLSocketFactory
	i64 u0xaa7b11cdd6000676, ; 359 => android/provider/Settings
	i64 u0xabc3cd0f40f748aa, ; 360 => java/lang/String
	i64 u0xabf23282cb9ad66b, ; 361 => crc6431345fe65afe8d98/AvaloniaAndroidApplication_1
	i64 u0xac86da7d9cd4863e, ; 362 => androidx/appcompat/app/ActionBar
	i64 u0xac9902bb0e4c5217, ; 363 => java/lang/IllegalArgumentException
	i64 u0xacaf4fe23af1f72a, ; 364 => [S
	i64 u0xacbf549cdef93bef, ; 365 => java/net/HttpURLConnection
	i64 u0xada6872f699d2ae8, ; 366 => [J
	i64 u0xaf1679a039f6fbb9, ; 367 => androidx/appcompat/widget/Toolbar
	i64 u0xb00eab597b120f1c, ; 368 => android/view/KeyboardShortcutGroup
	i64 u0xb02badeb1c97535c, ; 369 => java/lang/Integer
	i64 u0xb0e934994bddcba7, ; 370 => android/view/inputmethod/ExtractedTextRequest
	i64 u0xb18d71343ca8e96f, ; 371 => java/lang/Exception
	i64 u0xb209d55b71ead22c, ; 372 => android/view/animation/Interpolator
	i64 u0xb254043df975968d, ; 373 => mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor
	i64 u0xb2f44fc19cc1c2c2, ; 374 => com/arthenica/ffmpegkit/FFmpegSessionCompleteCallback
	i64 u0xb3369008f4fe1419, ; 375 => androidx/appcompat/app/AppCompatActivity
	i64 u0xb3693705985e8b13, ; 376 => androidx/core/view/accessibility/AccessibilityViewCommand
	i64 u0xb378438cc777bbf0, ; 377 => android/view/WindowManager$LayoutParams
	i64 u0xb3ea8750328eba6b, ; 378 => android/graphics/RectF
	i64 u0xb42026236b8f4f29, ; 379 => androidx/drawerlayout/widget/DrawerLayout
	i64 u0xb4fc3e21cc054bc7, ; 380 => android/graphics/Paint
	i64 u0xb54eff3a21a3eefa, ; 381 => androidx/loader/app/LoaderManager$LoaderCallbacks
	i64 u0xb56e3efa284790aa, ; 382 => android/view/WindowInsets
	i64 u0xb56e879bb5d599f3, ; 383 => android/window/OnBackInvokedCallback
	i64 u0xb570f3bf7dea9b6e, ; 384 => mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor
	i64 u0xb69317d4cbae2478, ; 385 => android/content/res/Configuration
	i64 u0xb6c4749da9477c3a, ; 386 => [B
	i64 u0xb7763538def62dee, ; 387 => crc6431345fe65afe8d98/AvaloniaAccessHelper
	i64 u0xb7f60ace3fa0816b, ; 388 => android/view/Window
	i64 u0xb8df224d6b778ca3, ; 389 => android/view/View
	i64 u0xb9e48b25660487c5, ; 390 => javax/net/ssl/TrustManager
	i64 u0xbacf55cfc50d3d0b, ; 391 => kotlin/reflect/KParameter$Kind
	i64 u0xbb388df3745ca0e0, ; 392 => android/content/ActivityNotFoundException
	i64 u0xbb84ccbe48f6c18b, ; 393 => android/os/Looper
	i64 u0xbb8a3a87015de071, ; 394 => com/arthenica/ffmpegkit/FFprobeSessionCompleteCallback
	i64 u0xbc89a6074f33c9ca, ; 395 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat
	i64 u0xbd382d575656cd60, ; 396 => com/arthenica/ffmpegkit/MediaInformationSession
	i64 u0xbd8eeb1678aa451f, ; 397 => androidx/core/app/TaskStackBuilder
	i64 u0xbf6d427143271cb3, ; 398 => java/lang/Object
	i64 u0xbf7142760b6d7c5c, ; 399 => com/arthenica/ffmpegkit/AsyncFFmpegExecuteTask
	i64 u0xbf9dae2beff68075, ; 400 => android/graphics/Insets
	i64 u0xbfcccc29cac8e8a1, ; 401 => mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor
	i64 u0xbfee75e113b64f18, ; 402 => android/widget/SpinnerAdapter
	i64 u0xc00f4c2f11efdcff, ; 403 => java/lang/ClassNotFoundException
	i64 u0xc095e5da02b35ab7, ; 404 => androidx/core/view/accessibility/AccessibilityWindowInfoCompat
	i64 u0xc1a43ce814bd6203, ; 405 => android/content/ClipData$Item
	i64 u0xc1a807325c15cf73, ; 406 => android/graphics/Bitmap
	i64 u0xc288a8550f7ef636, ; 407 => android/view/SubMenu
	i64 u0xc2a8e50a5f08afc6, ; 408 => mono/java/lang/RunnableImplementor
	i64 u0xc2d2916e08f7fcd5, ; 409 => android/view/WindowInsetsAnimationController
	i64 u0xc3a0d1e70fc04a12, ; 410 => androidx/fragment/app/strictmode/Violation
	i64 u0xc3eb0cbb47f178b9, ; 411 => java/lang/Enum
	i64 u0xc410281d3f079bb9, ; 412 => kotlin/reflect/KClassifier
	i64 u0xc4998152ef9eb5a5, ; 413 => kotlin/reflect/KParameter
	i64 u0xc4e1d7e4d6990b04, ; 414 => android/database/Cursor
	i64 u0xc606e1058d794da9, ; 415 => java/lang/AutoCloseable
	i64 u0xc6373e535675298e, ; 416 => android/content/ClipboardManager
	i64 u0xc676eb12115a0cfd, ; 417 => java/util/concurrent/Callable
	i64 u0xc6a64908f989db1f, ; 418 => java/util/Spliterator
	i64 u0xc7352532882255e4, ; 419 => androidx/activity/result/contract/ActivityResultContract
	i64 u0xc77241534a220e8b, ; 420 => android/view/inputmethod/TextAttribute
	i64 u0xc7e7d72888a9cbd1, ; 421 => android/view/accessibility/AccessibilityWindowInfo
	i64 u0xc82348f1aff8b079, ; 422 => androidx/window/layout/WindowMetrics
	i64 u0xc8eafa3defe551dc, ; 423 => com/arthenica/ffmpegkit/MediaInformationJsonParser
	i64 u0xc9106b5f608b7e96, ; 424 => com/arthenica/ffmpegkit/FFmpegSession
	i64 u0xc9f0b2a1b7594f51, ; 425 => java/util/concurrent/Future$State
	i64 u0xca35caf567cfa745, ; 426 => java/util/Collection
	i64 u0xcabf871ef950ad91, ; 427 => android/view/View$OnClickListener
	i64 u0xcb4af9b128fa333f, ; 428 => android/view/SurfaceHolder
	i64 u0xcb4ce04dadf908aa, ; 429 => com/arthenica/ffmpegkit/FFmpegKit
	i64 u0xcb502115d02cfb31, ; 430 => androidx/activity/OnBackPressedCallback
	i64 u0xcc306823503920e9, ; 431 => android/app/Application
	i64 u0xcc3c26b070861b6e, ; 432 => android/view/ViewPropertyAnimator
	i64 u0xccaf19b2bbefc090, ; 433 => android/hardware/display/DisplayManager
	i64 u0xcdf4fe3b1db1eeb0, ; 434 => android/view/MenuItem
	i64 u0xcf5118f37190e6ff, ; 435 => androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks
	i64 u0xcf9f8d71d3de4d65, ; 436 => android/view/inputmethod/InputContentInfo
	i64 u0xd0fdb8dd4573f5f7, ; 437 => android/window/BackEvent
	i64 u0xd1b288a9c7bb8f53, ; 438 => java/lang/Double
	i64 u0xd1bb565fc45586eb, ; 439 => android/app/PendingIntent
	i64 u0xd2608201281255d6, ; 440 => crc641fe58d40b3a958ab/AndroidPlatformSettings_ConfigurationChangedReceiver
	i64 u0xd294b4da088b36d0, ; 441 => androidx/core/util/Consumer
	i64 u0xd2fc750314fd2213, ; 442 => [D
	i64 u0xd34c2aa59b70a3fe, ; 443 => com/arthenica/ffmpegkit/Signal
	i64 u0xd3c43ee198e77de2, ; 444 => androidx/appcompat/view/menu/MenuBuilder
	i64 u0xd457ef90cd8c24b7, ; 445 => com/arthenica/ffmpegkit/FFprobeSession
	i64 u0xd5a28b8fa6d48e71, ; 446 => android/os/Build
	i64 u0xd6aff72a9149f983, ; 447 => com/arthenica/ffmpegkit/Abi
	i64 u0xd6f39bb6d6ac248a, ; 448 => androidx/navigationevent/NavigationEventHandler
	i64 u0xd7bf0ca2c70de05c, ; 449 => android/util/DisplayMetrics
	i64 u0xd7d412ecfd847e8d, ; 450 => android/view/WindowInsetsAnimation
	i64 u0xd88443e11b25ea33, ; 451 => java/util/function/UnaryOperator
	i64 u0xd8ab954c8665d775, ; 452 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat
	i64 u0xd95d6dc3cf850ced, ; 453 => android/view/View$AccessibilityDelegate
	i64 u0xd9894fafe0aa82b4, ; 454 => mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor
	i64 u0xd9aebd86bdaf8ad1, ; 455 => androidx/fragment/app/FragmentResultListener
	i64 u0xd9af3f71e595db52, ; 456 => kotlin/reflect/KTypeParameter
	i64 u0xdafe9059dfa43c62, ; 457 => androidx/window/layout/WindowMetricsCalculator$Companion
	i64 u0xdbb76cb30e7b6509, ; 458 => android/content/ContentResolver
	i64 u0xdc23461fb007fd9e, ; 459 => com/arthenica/ffmpegkit/Packages
	i64 u0xdc5c62ea80134007, ; 460 => android/view/inputmethod/TextSnapshot
	i64 u0xdd463626e67f1bf6, ; 461 => androidx/loader/app/LoaderManager
	i64 u0xdd812f1d4afa427b, ; 462 => java/lang/UnsupportedOperationException
	i64 u0xde36efb42da7cc2d, ; 463 => javax/net/ssl/SSLSessionContext
	i64 u0xde661e8331fec958, ; 464 => androidx/appcompat/graphics/drawable/DrawerArrowDrawable
	i64 u0xdefbe04fed538321, ; 465 => android/os/SystemClock
	i64 u0xdfabd9351f4351a6, ; 466 => [Ljava/lang/Object;
	i64 u0xdfef58a3c722a78d, ; 467 => android/view/ContextMenu
	i64 u0xe024b538ad65ea66, ; 468 => java/util/function/Consumer
	i64 u0xe0446bf91fb0c2dd, ; 469 => java/lang/NoClassDefFoundError
	i64 u0xe0f47e92347d97e9, ; 470 => android/os/Parcelable
	i64 u0xe116bc26f4f89e46, ; 471 => androidx/fragment/app/FragmentFactory
	i64 u0xe156c210e126089c, ; 472 => android/view/ViewStructure
	i64 u0xe17ffbb89b1fb57f, ; 473 => androidx/core/view/RoundedCornerCompat
	i64 u0xe1b3c5871398eb28, ; 474 => java/nio/channels/FileChannel
	i64 u0xe1bb787ca7ca5fee, ; 475 => androidx/appcompat/app/AppCompatCallback
	i64 u0xe22bb95540a673ba, ; 476 => android/window/OnBackInvokedDispatcher
	i64 u0xe28cd0a2e6de00c1, ; 477 => java/security/KeyStore
	i64 u0xe37bab6623ca3f34, ; 478 => androidx/lifecycle/ViewModel
	i64 u0xe3843bf91193455c, ; 479 => android/util/SparseArray
	i64 u0xe38528954b158fff, ; 480 => java/util/concurrent/Executor
	i64 u0xe39829b35e720e04, ; 481 => java/util/function/IntConsumer
	i64 u0xe4c5b0a99cb44963, ; 482 => kotlin/reflect/KTypeProjection$Companion
	i64 u0xe59c130e7d1e4ac3, ; 483 => java/security/SecureRandom
	i64 u0xe5abbaa9de37d34b, ; 484 => net/dot/jni/ManagedPeer
	i64 u0xe5d87141368978fc, ; 485 => crc6414fb8ed825ee5337/ActionStatisticsCallback
	i64 u0xe635a54b0edb478c, ; 486 => android/view/inputmethod/HandwritingGesture
	i64 u0xe663c278c572f570, ; 487 => android/database/CharArrayBuffer
	i64 u0xe6b76c398e304c92, ; 488 => kotlin/coroutines/Continuation
	i64 u0xe6cd200754f8f60a, ; 489 => android/view/Window$Callback
	i64 u0xe72468967b13cd11, ; 490 => androidx/appcompat/view/ActionMode
	i64 u0xe7c5168fd08808ad, ; 491 => android/content/res/AssetFileDescriptor
	i64 u0xe89da97b609fddcb, ; 492 => kotlinx/coroutines/CoroutineScope
	i64 u0xe8b52a7318e34a5d, ; 493 => androidx/core/view/WindowCompat
	i64 u0xea728e0f517c558e, ; 494 => kotlin/reflect/KClass
	i64 u0xea77581d05ee4142, ; 495 => android/view/ViewTreeObserver$OnGlobalLayoutListener
	i64 u0xead2701e78855725, ; 496 => com/arthenica/ffmpegkit/ReturnCode
	i64 u0xeaf24ecbc157d49b, ; 497 => com/arthenica/ffmpegkit/TranslationProvider
	i64 u0xeb7921a59525838f, ; 498 => com/arthenica/ffmpegkit/FFprobeKit
	i64 u0xeb82145dcac4c559, ; 499 => java/lang/Long
	i64 u0xebe39d8298b84309, ; 500 => androidx/lifecycle/Lifecycle$State
	i64 u0xec8b276c12c354ff, ; 501 => android/widget/HorizontalScrollView
	i64 u0xecf577a3b59693fa, ; 502 => androidx/fragment/app/FragmentActivity
	i64 u0xed2fe8e56e774545, ; 503 => android/os/MessageQueue
	i64 u0xed49ed70aa9be1b3, ; 504 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 u0xee58348f4c4ad939, ; 505 => javax/net/ssl/HostnameVerifier
	i64 u0xee6f3d1e7507d907, ; 506 => java/util/Enumeration
	i64 u0xef2f2996a1d369cc, ; 507 => java/io/FileInputStream
	i64 u0xef7212ef395f64aa, ; 508 => mono/android/view/View_OnFocusChangeListenerImplementor
	i64 u0xef953c41325a3428, ; 509 => java/io/PrintWriter
	i64 u0xf0654f9be531078e, ; 510 => java/io/Closeable
	i64 u0xf11f22a6441fcfbc, ; 511 => java/lang/IndexOutOfBoundsException
	i64 u0xf1244788d28ae1f7, ; 512 => androidx/lifecycle/AtomicReference
	i64 u0xf15bb28304fee21c, ; 513 => android/provider/Settings$NameValueTable
	i64 u0xf16e73c8be28bf16, ; 514 => java/lang/annotation/Annotation
	i64 u0xf323c9ddabd70266, ; 515 => kotlin/jvm/functions/Function1
	i64 u0xf38608385d689955, ; 516 => mono/android/runtime/JavaArray
	i64 u0xf3d4ab08aaf25ccb, ; 517 => java/net/UnknownServiceException
	i64 u0xf43224eb7d757fa7, ; 518 => java/util/concurrent/ExecutorService
	i64 u0xf44314212064bd78, ; 519 => android/view/ViewConfiguration
	i64 u0xf5085ea57b8d83a4, ; 520 => android/view/accessibility/AccessibilityEvent
	i64 u0xf52c07920492a796, ; 521 => androidx/fragment/app/strictmode/FragmentStrictMode
	i64 u0xf55d9ff0318ff888, ; 522 => androidx/core/view/WindowInsetsAnimationCompat$Callback
	i64 u0xf57171fdf29f5557, ; 523 => androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher
	i64 u0xf6a84ab2352c2e84, ; 524 => java/util/function/ToLongFunction
	i64 u0xf7595172a9a58b85, ; 525 => mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor
	i64 u0xf75d8dd75143511a, ; 526 => androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments
	i64 u0xf85cbededb432844, ; 527 => java/security/spec/EncodedKeySpec
	i64 u0xf8a0c738b86edbfc, ; 528 => com/arthenica/ffmpegkit/AbstractSession
	i64 u0xf8ce0ad191cefbc4, ; 529 => androidx/core/view/ActionProvider
	i64 u0xf91992806e90a673, ; 530 => com/arthenica/ffmpegkit/Statistics
	i64 u0xf9665f0bb989fc04, ; 531 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat
	i64 u0xf9df3849f259e110, ; 532 => android/view/inputmethod/SurroundingText
	i64 u0xfa1baa381b3f9cde, ; 533 => mono/java/lang/Runnable
	i64 u0xfa1d5ed2f58367c8, ; 534 => androidx/core/view/ViewPropertyAnimatorUpdateListener
	i64 u0xfaee1f89c751c767, ; 535 => android/view/autofill/AutofillId
	i64 u0xfb45b8ad2d7bff3d, ; 536 => com/arthenica/ffmpegkit/LogRedirectionStrategy
	i64 u0xfb9909be06ff7396, ; 537 => androidx/core/view/OnReceiveContentListener
	i64 u0xfb9a51a22eb2843f, ; 538 => javax/security/cert/Certificate
	i64 u0xfbe9bfa5cc50fed6, ; 539 => java/util/HashSet
	i64 u0xfc16c38c998d430c, ; 540 => kotlin/enums/EnumEntries
	i64 u0xfcb3254d3921ac28, ; 541 => androidx/appcompat/widget/DecorToolbar
	i64 u0xfd2b1a3de667eb51, ; 542 => java/lang/Runnable
	i64 u0xfd45cc49d3236300, ; 543 => android/os/IBinder$DeathRecipient
	i64 u0xfebf2b77f1940e7e, ; 544 => java/security/PrivateKey
	i64 u0xff079db13d3076a9, ; 545 => androidx/core/content/ContextCompat
	i64 u0xff2217c661e1c1d5 ; 546 => com/arthenica/ffmpegkit/Level
], align 16

@module0_managed_to_java = internal dso_local constant [57 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 441; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 349; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 295; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 303; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 37; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 545; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 235; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 271; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 154; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 255; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 177; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 397; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 317; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 529; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 211; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 373; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 229; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 288; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 276; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 238; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 306; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 537; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 157; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 534; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 242; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 473; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 343; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 195; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000063, ; uint32_t type_token_id
		i32 338; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000064, ; uint32_t type_token_id
		i32 209; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000065, ; uint32_t type_token_id
		i32 493; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 259; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 250; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 522; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 224; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 65; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 236; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 78; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 110; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 270; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000076, ; uint32_t type_token_id
		i32 280; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x02000078, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 531; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 153; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 395; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 452; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 214; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 404; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 526; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x02000082, ; uint32_t type_token_id
		i32 376; uint32_t java_map_index
	} ; 56
], align 16

@module0_managed_to_java_duplicates = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 441; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 349; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200003d, ; uint32_t type_token_id
		i32 177; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 255; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 211; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 229; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 529; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 238; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 306; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 537; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 157; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 534; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 195; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 522; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 270; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 526; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 376; uint32_t java_map_index
	} ; 18
], align 16

@module1_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	} ; 1
], align 16

@module1_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	} ; 1
], align 16

@module2_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 319; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 500; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 512; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 252; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	} ; 4
], align 16

@module2_managed_to_java_duplicates = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 252; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 319; uint32_t java_map_index
	} ; 2
], align 16

@module3_managed_to_java = internal dso_local constant [29 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 464; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 367; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 523; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 454; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 541; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 190; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 251; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 362; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 225; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 258; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 525; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 188; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 354; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 294; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 375; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 264; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 475; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 490; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 141; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 444; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 302; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 156; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 347; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 147; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 14; uint32_t java_map_index
	} ; 28
], align 16

@module3_managed_to_java_duplicates = internal dso_local constant [16 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 541; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 258; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 188; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 354; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 362; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 264; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 475; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 141; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 490; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 302; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 156; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 347; uint32_t java_map_index
	} ; 15
], align 16

@module4_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 111; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 330; uint32_t java_map_index
	} ; 1
], align 16

@module5_managed_to_java = internal dso_local constant [8 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 218; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 448; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 287; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 151; uint32_t java_map_index
	} ; 7
], align 16

@module5_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 448; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 287; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 151; uint32_t java_map_index
	} ; 4
], align 16

@module6_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 142; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 273; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 189; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 461; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 381; uint32_t java_map_index
	} ; 4
], align 16

@module6_managed_to_java_duplicates = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 273; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 189; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 381; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 461; uint32_t java_map_index
	} ; 3
], align 16

@module7_managed_to_java = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 502; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 158; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 205; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 337; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 223; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 471; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 120; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 176; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 435; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 342; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 237; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 162; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 289; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 455; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 521; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 183; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 410; uint32_t java_map_index
	} ; 18
], align 16

@module7_managed_to_java_duplicates = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 337; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 120; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 176; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 435; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 342; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 162; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 455; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 410; uint32_t java_map_index
	} ; 9
], align 16

@module8_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 457; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 422; uint32_t java_map_index
	} ; 4
], align 16

@module8_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	} ; 1
], align 16

@module9_managed_to_java = internal dso_local constant [23 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 346; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 494; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 412; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 332; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 391; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 413; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 243; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 456; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 159; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 482; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 353; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 316; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 279; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 197; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 515; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 140; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 540; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 488; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 247; uint32_t java_map_index
	} ; 22
], align 16

@module9_managed_to_java_duplicates = internal dso_local constant [18 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 346; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 494; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 412; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 332; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000020, ; uint32_t type_token_id
		i32 413; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 243; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 456; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 279; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 197; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 515; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 140; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 540; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 488; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 247; uint32_t java_map_index
	} ; 17
], align 16

@module10_managed_to_java = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 301; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 478; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 357; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 348; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 340; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 245; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 22; uint32_t java_map_index
	} ; 8
], align 16

@module10_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 301; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 478; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 348; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 245; uint32_t java_map_index
	} ; 4
], align 16

@module11_managed_to_java = internal dso_local constant [293 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000091, ; uint32_t type_token_id
		i32 166; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000093, ; uint32_t type_token_id
		i32 538; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000095, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000097, ; uint32_t type_token_id
		i32 263; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000098, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 171; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200009c, ; uint32_t type_token_id
		i32 505; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 292; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 463; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x020000a4, ; uint32_t type_token_id
		i32 390; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 358; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 437; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000ac, ; uint32_t type_token_id
		i32 383; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 476; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 359; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 513; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 172; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 487; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000b6, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 139; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000bb, ; uint32_t type_token_id
		i32 414; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020000be, ; uint32_t type_token_id
		i32 248; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 23; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 501; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000c3, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000c5, ; uint32_t type_token_id
		i32 402; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 449; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000c8, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020000ca, ; uint32_t type_token_id
		i32 114; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 479; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 277; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 222; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x020000d3, ; uint32_t type_token_id
		i32 278; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 59; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 446; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 186; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x020000da, ; uint32_t type_token_id
		i32 192; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x020000db, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x020000dc, ; uint32_t type_token_id
		i32 543; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020000de, ; uint32_t type_token_id
		i32 164; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020000df, ; uint32_t type_token_id
		i32 173; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 325; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 470; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 393; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 503; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 266; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 465; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 63; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 163; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020000f5, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020000f7, ; uint32_t type_token_id
		i32 344; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 377; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 389; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 453; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 121; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000fd, ; uint32_t type_token_id
		i32 427; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000ff, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x02000102, ; uint32_t type_token_id
		i32 508; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x02000106, ; uint32_t type_token_id
		i32 232; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x02000107, ; uint32_t type_token_id
		i32 201; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x02000108, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x02000109, ; uint32_t type_token_id
		i32 227; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 272; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 495; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 388; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 489; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x02000110, ; uint32_t type_token_id
		i32 304; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x02000111, ; uint32_t type_token_id
		i32 244; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x02000115, ; uint32_t type_token_id
		i32 196; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x02000118, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x02000119, ; uint32_t type_token_id
		i32 334; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 262; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x0200011d, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 467; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x02000121, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x02000123, ; uint32_t type_token_id
		i32 135; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x02000125, ; uint32_t type_token_id
		i32 217; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x02000127, ; uint32_t type_token_id
		i32 434; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x02000129, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 407; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x0200012f, ; uint32_t type_token_id
		i32 160; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x02000131, ; uint32_t type_token_id
		i32 144; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x02000133, ; uint32_t type_token_id
		i32 428; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000135, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x02000137, ; uint32_t type_token_id
		i32 409; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x02000139, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x0200013b, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 368; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000140, ; uint32_t type_token_id
		i32 220; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x02000148, ; uint32_t type_token_id
		i32 305; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x0200014f, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x02000151, ; uint32_t type_token_id
		i32 165; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x02000154, ; uint32_t type_token_id
		i32 351; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x02000157, ; uint32_t type_token_id
		i32 519; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x02000158, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x02000159, ; uint32_t type_token_id
		i32 285; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x0200015a, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x0200015c, ; uint32_t type_token_id
		i32 432; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x0200015e, ; uint32_t type_token_id
		i32 472; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x02000161, ; uint32_t type_token_id
		i32 382; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x02000162, ; uint32_t type_token_id
		i32 450; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x02000163, ; uint32_t type_token_id
		i32 281; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x02000165, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x02000167, ; uint32_t type_token_id
		i32 535; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x02000168, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x0200016a, ; uint32_t type_token_id
		i32 372; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x0200016c, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x0200016d, ; uint32_t type_token_id
		i32 181; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x0200016e, ; uint32_t type_token_id
		i32 321; uint32_t java_map_index
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 u0x0200016f, ; uint32_t type_token_id
		i32 175; uint32_t java_map_index
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 u0x02000170, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 u0x02000172, ; uint32_t type_token_id
		i32 370; uint32_t java_map_index
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 u0x02000174, ; uint32_t type_token_id
		i32 486; uint32_t java_map_index
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 u0x02000177, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 u0x0200017c, ; uint32_t type_token_id
		i32 436; uint32_t java_map_index
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 u0x0200017d, ; uint32_t type_token_id
		i32 315; uint32_t java_map_index
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 u0x02000180, ; uint32_t type_token_id
		i32 532; uint32_t java_map_index
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 u0x02000181, ; uint32_t type_token_id
		i32 420; uint32_t java_map_index
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 u0x02000182, ; uint32_t type_token_id
		i32 460; uint32_t java_map_index
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 u0x02000183, ; uint32_t type_token_id
		i32 520; uint32_t java_map_index
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 u0x02000184, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 u0x02000185, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 u0x02000186, ; uint32_t type_token_id
		i32 184; uint32_t java_map_index
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 u0x02000187, ; uint32_t type_token_id
		i32 421; uint32_t java_map_index
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 u0x0200019e, ; uint32_t type_token_id
		i32 323; uint32_t java_map_index
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 u0x020001a1, ; uint32_t type_token_id
		i32 516; uint32_t java_map_index
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 u0x020001a3, ; uint32_t type_token_id
		i32 426; uint32_t java_map_index
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 u0x020001ae, ; uint32_t type_token_id
		i32 261; uint32_t java_map_index
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 u0x020001b0, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 u0x020001b1, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 u0x020001b2, ; uint32_t type_token_id
		i32 539; uint32_t java_map_index
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 u0x020001be, ; uint32_t type_token_id
		i32 307; uint32_t java_map_index
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 u0x020001c5, ; uint32_t type_token_id
		i32 167; uint32_t java_map_index
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 u0x020001c7, ; uint32_t type_token_id
		i32 433; uint32_t java_map_index
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 u0x020001c8, ; uint32_t type_token_id
		i32 314; uint32_t java_map_index
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 u0x020001ca, ; uint32_t type_token_id
		i32 406; uint32_t java_map_index
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 u0x020001cb, ; uint32_t type_token_id
		i32 228; uint32_t java_map_index
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 u0x020001ce, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 185; uint32_t java_map_index
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 u0x020001d1, ; uint32_t type_token_id
		i32 400; uint32_t java_map_index
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 u0x020001d2, ; uint32_t type_token_id
		i32 123; uint32_t java_map_index
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 380; uint32_t java_map_index
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 28; uint32_t java_map_index
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 182; uint32_t java_map_index
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 u0x020001d6, ; uint32_t type_token_id
		i32 336; uint32_t java_map_index
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 233; uint32_t java_map_index
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 u0x020001d8, ; uint32_t type_token_id
		i32 202; uint32_t java_map_index
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 u0x020001d9, ; uint32_t type_token_id
		i32 378; uint32_t java_map_index
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 u0x020001da, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 u0x020001db, ; uint32_t type_token_id
		i32 246; uint32_t java_map_index
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 194; uint32_t java_map_index
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 u0x020001de, ; uint32_t type_token_id
		i32 265; uint32_t java_map_index
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 u0x020001df, ; uint32_t type_token_id
		i32 284; uint32_t java_map_index
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 u0x020001e0, ; uint32_t type_token_id
		i32 249; uint32_t java_map_index
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 u0x020001e1, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 u0x020001e3, ; uint32_t type_token_id
		i32 392; uint32_t java_map_index
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 u0x020001e4, ; uint32_t type_token_id
		i32 210; uint32_t java_map_index
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 u0x020001e6, ; uint32_t type_token_id
		i32 416; uint32_t java_map_index
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 u0x020001e7, ; uint32_t type_token_id
		i32 320; uint32_t java_map_index
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 u0x020001e8, ; uint32_t type_token_id
		i32 405; uint32_t java_map_index
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 u0x020001e9, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 u0x020001ea, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 u0x020001ec, ; uint32_t type_token_id
		i32 458; uint32_t java_map_index
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 u0x020001ef, ; uint32_t type_token_id
		i32 203; uint32_t java_map_index
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 u0x020001f0, ; uint32_t type_token_id
		i32 71; uint32_t java_map_index
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 u0x020001f1, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 u0x020001f3, ; uint32_t type_token_id
		i32 491; uint32_t java_map_index
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 u0x020001f4, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 u0x020001f5, ; uint32_t type_token_id
		i32 385; uint32_t java_map_index
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 u0x020001f8, ; uint32_t type_token_id
		i32 174; uint32_t java_map_index
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 u0x020001f9, ; uint32_t type_token_id
		i32 12; uint32_t java_map_index
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 u0x020001fb, ; uint32_t type_token_id
		i32 322; uint32_t java_map_index
	}, ; 185
	%struct.TypeMapModuleEntry {
		i32 u0x020001fc, ; uint32_t type_token_id
		i32 299; uint32_t java_map_index
	}, ; 186
	%struct.TypeMapModuleEntry {
		i32 u0x020001fe, ; uint32_t type_token_id
		i32 47; uint32_t java_map_index
	}, ; 187
	%struct.TypeMapModuleEntry {
		i32 u0x02000204, ; uint32_t type_token_id
		i32 193; uint32_t java_map_index
	}, ; 188
	%struct.TypeMapModuleEntry {
		i32 u0x02000205, ; uint32_t type_token_id
		i32 431; uint32_t java_map_index
	}, ; 189
	%struct.TypeMapModuleEntry {
		i32 u0x02000206, ; uint32_t type_token_id
		i32 312; uint32_t java_map_index
	}, ; 190
	%struct.TypeMapModuleEntry {
		i32 u0x0200020a, ; uint32_t type_token_id
		i32 439; uint32_t java_map_index
	}, ; 191
	%struct.TypeMapModuleEntry {
		i32 u0x0200020c, ; uint32_t type_token_id
		i32 155; uint32_t java_map_index
	}, ; 192
	%struct.TypeMapModuleEntry {
		i32 u0x0200020e, ; uint32_t type_token_id
		i32 365; uint32_t java_map_index
	}, ; 193
	%struct.TypeMapModuleEntry {
		i32 u0x02000210, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 194
	%struct.TypeMapModuleEntry {
		i32 u0x02000211, ; uint32_t type_token_id
		i32 138; uint32_t java_map_index
	}, ; 195
	%struct.TypeMapModuleEntry {
		i32 u0x02000212, ; uint32_t type_token_id
		i32 341; uint32_t java_map_index
	}, ; 196
	%struct.TypeMapModuleEntry {
		i32 u0x02000213, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 197
	%struct.TypeMapModuleEntry {
		i32 u0x02000214, ; uint32_t type_token_id
		i32 356; uint32_t java_map_index
	}, ; 198
	%struct.TypeMapModuleEntry {
		i32 u0x02000216, ; uint32_t type_token_id
		i32 335; uint32_t java_map_index
	}, ; 199
	%struct.TypeMapModuleEntry {
		i32 u0x02000217, ; uint32_t type_token_id
		i32 219; uint32_t java_map_index
	}, ; 200
	%struct.TypeMapModuleEntry {
		i32 u0x02000218, ; uint32_t type_token_id
		i32 517; uint32_t java_map_index
	}, ; 201
	%struct.TypeMapModuleEntry {
		i32 u0x02000219, ; uint32_t type_token_id
		i32 269; uint32_t java_map_index
	}, ; 202
	%struct.TypeMapModuleEntry {
		i32 u0x0200021a, ; uint32_t type_token_id
		i32 137; uint32_t java_map_index
	}, ; 203
	%struct.TypeMapModuleEntry {
		i32 u0x0200021c, ; uint32_t type_token_id
		i32 268; uint32_t java_map_index
	}, ; 204
	%struct.TypeMapModuleEntry {
		i32 u0x0200021e, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 205
	%struct.TypeMapModuleEntry {
		i32 u0x02000220, ; uint32_t type_token_id
		i32 544; uint32_t java_map_index
	}, ; 206
	%struct.TypeMapModuleEntry {
		i32 u0x02000222, ; uint32_t type_token_id
		i32 231; uint32_t java_map_index
	}, ; 207
	%struct.TypeMapModuleEntry {
		i32 u0x02000223, ; uint32_t type_token_id
		i32 477; uint32_t java_map_index
	}, ; 208
	%struct.TypeMapModuleEntry {
		i32 u0x02000224, ; uint32_t type_token_id
		i32 483; uint32_t java_map_index
	}, ; 209
	%struct.TypeMapModuleEntry {
		i32 u0x02000225, ; uint32_t type_token_id
		i32 527; uint32_t java_map_index
	}, ; 210
	%struct.TypeMapModuleEntry {
		i32 u0x02000227, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 211
	%struct.TypeMapModuleEntry {
		i32 u0x02000229, ; uint32_t type_token_id
		i32 257; uint32_t java_map_index
	}, ; 212
	%struct.TypeMapModuleEntry {
		i32 u0x0200022a, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 213
	%struct.TypeMapModuleEntry {
		i32 u0x0200022c, ; uint32_t type_token_id
		i32 474; uint32_t java_map_index
	}, ; 214
	%struct.TypeMapModuleEntry {
		i32 u0x0200022e, ; uint32_t type_token_id
		i32 504; uint32_t java_map_index
	}, ; 215
	%struct.TypeMapModuleEntry {
		i32 u0x02000230, ; uint32_t type_token_id
		i32 324; uint32_t java_map_index
	}, ; 216
	%struct.TypeMapModuleEntry {
		i32 u0x02000231, ; uint32_t type_token_id
		i32 326; uint32_t java_map_index
	}, ; 217
	%struct.TypeMapModuleEntry {
		i32 u0x02000232, ; uint32_t type_token_id
		i32 507; uint32_t java_map_index
	}, ; 218
	%struct.TypeMapModuleEntry {
		i32 u0x02000233, ; uint32_t type_token_id
		i32 510; uint32_t java_map_index
	}, ; 219
	%struct.TypeMapModuleEntry {
		i32 u0x02000235, ; uint32_t type_token_id
		i32 291; uint32_t java_map_index
	}, ; 220
	%struct.TypeMapModuleEntry {
		i32 u0x02000237, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 221
	%struct.TypeMapModuleEntry {
		i32 u0x02000238, ; uint32_t type_token_id
		i32 213; uint32_t java_map_index
	}, ; 222
	%struct.TypeMapModuleEntry {
		i32 u0x02000239, ; uint32_t type_token_id
		i32 208; uint32_t java_map_index
	}, ; 223
	%struct.TypeMapModuleEntry {
		i32 u0x0200023b, ; uint32_t type_token_id
		i32 355; uint32_t java_map_index
	}, ; 224
	%struct.TypeMapModuleEntry {
		i32 u0x0200023d, ; uint32_t type_token_id
		i32 509; uint32_t java_map_index
	}, ; 225
	%struct.TypeMapModuleEntry {
		i32 u0x0200023e, ; uint32_t type_token_id
		i32 150; uint32_t java_map_index
	}, ; 226
	%struct.TypeMapModuleEntry {
		i32 u0x02000240, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 227
	%struct.TypeMapModuleEntry {
		i32 u0x02000241, ; uint32_t type_token_id
		i32 145; uint32_t java_map_index
	}, ; 228
	%struct.TypeMapModuleEntry {
		i32 u0x02000244, ; uint32_t type_token_id
		i32 207; uint32_t java_map_index
	}, ; 229
	%struct.TypeMapModuleEntry {
		i32 u0x02000246, ; uint32_t type_token_id
		i32 506; uint32_t java_map_index
	}, ; 230
	%struct.TypeMapModuleEntry {
		i32 u0x02000248, ; uint32_t type_token_id
		i32 234; uint32_t java_map_index
	}, ; 231
	%struct.TypeMapModuleEntry {
		i32 u0x0200024b, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 232
	%struct.TypeMapModuleEntry {
		i32 u0x0200024d, ; uint32_t type_token_id
		i32 239; uint32_t java_map_index
	}, ; 233
	%struct.TypeMapModuleEntry {
		i32 u0x0200024f, ; uint32_t type_token_id
		i32 418; uint32_t java_map_index
	}, ; 234
	%struct.TypeMapModuleEntry {
		i32 u0x02000251, ; uint32_t type_token_id
		i32 267; uint32_t java_map_index
	}, ; 235
	%struct.TypeMapModuleEntry {
		i32 u0x02000252, ; uint32_t type_token_id
		i32 15; uint32_t java_map_index
	}, ; 236
	%struct.TypeMapModuleEntry {
		i32 u0x02000254, ; uint32_t type_token_id
		i32 468; uint32_t java_map_index
	}, ; 237
	%struct.TypeMapModuleEntry {
		i32 u0x02000256, ; uint32_t type_token_id
		i32 297; uint32_t java_map_index
	}, ; 238
	%struct.TypeMapModuleEntry {
		i32 u0x02000258, ; uint32_t type_token_id
		i32 481; uint32_t java_map_index
	}, ; 239
	%struct.TypeMapModuleEntry {
		i32 u0x0200025a, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 240
	%struct.TypeMapModuleEntry {
		i32 u0x0200025c, ; uint32_t type_token_id
		i32 331; uint32_t java_map_index
	}, ; 241
	%struct.TypeMapModuleEntry {
		i32 u0x0200025e, ; uint32_t type_token_id
		i32 311; uint32_t java_map_index
	}, ; 242
	%struct.TypeMapModuleEntry {
		i32 u0x02000260, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 243
	%struct.TypeMapModuleEntry {
		i32 u0x02000262, ; uint32_t type_token_id
		i32 524; uint32_t java_map_index
	}, ; 244
	%struct.TypeMapModuleEntry {
		i32 u0x02000264, ; uint32_t type_token_id
		i32 451; uint32_t java_map_index
	}, ; 245
	%struct.TypeMapModuleEntry {
		i32 u0x02000266, ; uint32_t type_token_id
		i32 417; uint32_t java_map_index
	}, ; 246
	%struct.TypeMapModuleEntry {
		i32 u0x02000268, ; uint32_t type_token_id
		i32 480; uint32_t java_map_index
	}, ; 247
	%struct.TypeMapModuleEntry {
		i32 u0x0200026a, ; uint32_t type_token_id
		i32 518; uint32_t java_map_index
	}, ; 248
	%struct.TypeMapModuleEntry {
		i32 u0x0200026c, ; uint32_t type_token_id
		i32 136; uint32_t java_map_index
	}, ; 249
	%struct.TypeMapModuleEntry {
		i32 u0x0200026d, ; uint32_t type_token_id
		i32 425; uint32_t java_map_index
	}, ; 250
	%struct.TypeMapModuleEntry {
		i32 u0x0200026f, ; uint32_t type_token_id
		i32 216; uint32_t java_map_index
	}, ; 251
	%struct.TypeMapModuleEntry {
		i32 u0x02000270, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 252
	%struct.TypeMapModuleEntry {
		i32 u0x02000271, ; uint32_t type_token_id
		i32 103; uint32_t java_map_index
	}, ; 253
	%struct.TypeMapModuleEntry {
		i32 u0x02000272, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 254
	%struct.TypeMapModuleEntry {
		i32 u0x02000273, ; uint32_t type_token_id
		i32 293; uint32_t java_map_index
	}, ; 255
	%struct.TypeMapModuleEntry {
		i32 u0x02000274, ; uint32_t type_token_id
		i32 168; uint32_t java_map_index
	}, ; 256
	%struct.TypeMapModuleEntry {
		i32 u0x02000275, ; uint32_t type_token_id
		i32 403; uint32_t java_map_index
	}, ; 257
	%struct.TypeMapModuleEntry {
		i32 u0x02000276, ; uint32_t type_token_id
		i32 438; uint32_t java_map_index
	}, ; 258
	%struct.TypeMapModuleEntry {
		i32 u0x02000277, ; uint32_t type_token_id
		i32 371; uint32_t java_map_index
	}, ; 259
	%struct.TypeMapModuleEntry {
		i32 u0x02000278, ; uint32_t type_token_id
		i32 318; uint32_t java_map_index
	}, ; 260
	%struct.TypeMapModuleEntry {
		i32 u0x02000279, ; uint32_t type_token_id
		i32 282; uint32_t java_map_index
	}, ; 261
	%struct.TypeMapModuleEntry {
		i32 u0x0200027a, ; uint32_t type_token_id
		i32 369; uint32_t java_map_index
	}, ; 262
	%struct.TypeMapModuleEntry {
		i32 u0x0200027b, ; uint32_t type_token_id
		i32 499; uint32_t java_map_index
	}, ; 263
	%struct.TypeMapModuleEntry {
		i32 u0x0200027c, ; uint32_t type_token_id
		i32 398; uint32_t java_map_index
	}, ; 264
	%struct.TypeMapModuleEntry {
		i32 u0x0200027d, ; uint32_t type_token_id
		i32 533; uint32_t java_map_index
	}, ; 265
	%struct.TypeMapModuleEntry {
		i32 u0x0200027e, ; uint32_t type_token_id
		i32 290; uint32_t java_map_index
	}, ; 266
	%struct.TypeMapModuleEntry {
		i32 u0x0200027f, ; uint32_t type_token_id
		i32 204; uint32_t java_map_index
	}, ; 267
	%struct.TypeMapModuleEntry {
		i32 u0x02000280, ; uint32_t type_token_id
		i32 360; uint32_t java_map_index
	}, ; 268
	%struct.TypeMapModuleEntry {
		i32 u0x02000282, ; uint32_t type_token_id
		i32 309; uint32_t java_map_index
	}, ; 269
	%struct.TypeMapModuleEntry {
		i32 u0x02000283, ; uint32_t type_token_id
		i32 408; uint32_t java_map_index
	}, ; 270
	%struct.TypeMapModuleEntry {
		i32 u0x02000284, ; uint32_t type_token_id
		i32 308; uint32_t java_map_index
	}, ; 271
	%struct.TypeMapModuleEntry {
		i32 u0x02000285, ; uint32_t type_token_id
		i32 169; uint32_t java_map_index
	}, ; 272
	%struct.TypeMapModuleEntry {
		i32 u0x02000286, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 273
	%struct.TypeMapModuleEntry {
		i32 u0x02000288, ; uint32_t type_token_id
		i32 411; uint32_t java_map_index
	}, ; 274
	%struct.TypeMapModuleEntry {
		i32 u0x0200028a, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 275
	%struct.TypeMapModuleEntry {
		i32 u0x0200028b, ; uint32_t type_token_id
		i32 415; uint32_t java_map_index
	}, ; 276
	%struct.TypeMapModuleEntry {
		i32 u0x02000290, ; uint32_t type_token_id
		i32 212; uint32_t java_map_index
	}, ; 277
	%struct.TypeMapModuleEntry {
		i32 u0x02000292, ; uint32_t type_token_id
		i32 363; uint32_t java_map_index
	}, ; 278
	%struct.TypeMapModuleEntry {
		i32 u0x02000293, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 279
	%struct.TypeMapModuleEntry {
		i32 u0x02000294, ; uint32_t type_token_id
		i32 511; uint32_t java_map_index
	}, ; 280
	%struct.TypeMapModuleEntry {
		i32 u0x02000295, ; uint32_t type_token_id
		i32 542; uint32_t java_map_index
	}, ; 281
	%struct.TypeMapModuleEntry {
		i32 u0x02000297, ; uint32_t type_token_id
		i32 180; uint32_t java_map_index
	}, ; 282
	%struct.TypeMapModuleEntry {
		i32 u0x02000298, ; uint32_t type_token_id
		i32 286; uint32_t java_map_index
	}, ; 283
	%struct.TypeMapModuleEntry {
		i32 u0x02000299, ; uint32_t type_token_id
		i32 469; uint32_t java_map_index
	}, ; 284
	%struct.TypeMapModuleEntry {
		i32 u0x0200029a, ; uint32_t type_token_id
		i32 339; uint32_t java_map_index
	}, ; 285
	%struct.TypeMapModuleEntry {
		i32 u0x0200029b, ; uint32_t type_token_id
		i32 178; uint32_t java_map_index
	}, ; 286
	%struct.TypeMapModuleEntry {
		i32 u0x0200029d, ; uint32_t type_token_id
		i32 313; uint32_t java_map_index
	}, ; 287
	%struct.TypeMapModuleEntry {
		i32 u0x0200029e, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 288
	%struct.TypeMapModuleEntry {
		i32 u0x0200029f, ; uint32_t type_token_id
		i32 226; uint32_t java_map_index
	}, ; 289
	%struct.TypeMapModuleEntry {
		i32 u0x020002a0, ; uint32_t type_token_id
		i32 462; uint32_t java_map_index
	}, ; 290
	%struct.TypeMapModuleEntry {
		i32 u0x020002a1, ; uint32_t type_token_id
		i32 514; uint32_t java_map_index
	}, ; 291
	%struct.TypeMapModuleEntry {
		i32 u0x020002b2, ; uint32_t type_token_id
		i32 241; uint32_t java_map_index
	} ; 292
], align 16

@module11_managed_to_java_duplicates = internal dso_local constant [124 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 538; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000096, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000099, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200009b, ; uint32_t type_token_id
		i32 171; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200009d, ; uint32_t type_token_id
		i32 505; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 292; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 463; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 390; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x020000a9, ; uint32_t type_token_id
		i32 358; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 383; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x020000af, ; uint32_t type_token_id
		i32 476; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x020000b7, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 139; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 414; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 248; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000c0, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 402; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000c9, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000ce, ; uint32_t type_token_id
		i32 277; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000d2, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 278; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000dd, ; uint32_t type_token_id
		i32 543; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000e0, ; uint32_t type_token_id
		i32 173; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 164; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 325; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 470; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000ec, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000f4, ; uint32_t type_token_id
		i32 163; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000f6, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 344; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 427; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000100, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 495; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 489; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000112, ; uint32_t type_token_id
		i32 244; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000113, ; uint32_t type_token_id
		i32 304; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000116, ; uint32_t type_token_id
		i32 196; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x0200011e, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000120, ; uint32_t type_token_id
		i32 467; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000122, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x02000124, ; uint32_t type_token_id
		i32 135; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000126, ; uint32_t type_token_id
		i32 217; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000128, ; uint32_t type_token_id
		i32 434; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x0200012e, ; uint32_t type_token_id
		i32 407; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x02000130, ; uint32_t type_token_id
		i32 160; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x02000132, ; uint32_t type_token_id
		i32 144; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x02000134, ; uint32_t type_token_id
		i32 428; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x02000136, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x02000138, ; uint32_t type_token_id
		i32 409; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x02000146, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x0200015b, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x0200015f, ; uint32_t type_token_id
		i32 472; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x02000160, ; uint32_t type_token_id
		i32 388; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x02000166, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x02000169, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x0200016b, ; uint32_t type_token_id
		i32 372; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x02000175, ; uint32_t type_token_id
		i32 486; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x02000178, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x0200017e, ; uint32_t type_token_id
		i32 315; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020001a4, ; uint32_t type_token_id
		i32 426; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020001aa, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020001af, ; uint32_t type_token_id
		i32 261; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020001b3, ; uint32_t type_token_id
		i32 539; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020001c6, ; uint32_t type_token_id
		i32 167; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020001c9, ; uint32_t type_token_id
		i32 314; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x020001dd, ; uint32_t type_token_id
		i32 246; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x020001e5, ; uint32_t type_token_id
		i32 210; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x020001eb, ; uint32_t type_token_id
		i32 265; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x020001ed, ; uint32_t type_token_id
		i32 458; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x020001ee, ; uint32_t type_token_id
		i32 249; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x020001ff, ; uint32_t type_token_id
		i32 322; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x0200020f, ; uint32_t type_token_id
		i32 365; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x02000215, ; uint32_t type_token_id
		i32 356; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x0200021b, ; uint32_t type_token_id
		i32 137; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x0200021d, ; uint32_t type_token_id
		i32 268; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x0200021f, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x02000221, ; uint32_t type_token_id
		i32 544; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x02000226, ; uint32_t type_token_id
		i32 527; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x02000228, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x0200022b, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x0200022d, ; uint32_t type_token_id
		i32 474; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x0200022f, ; uint32_t type_token_id
		i32 504; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x02000234, ; uint32_t type_token_id
		i32 510; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x02000236, ; uint32_t type_token_id
		i32 291; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x0200023a, ; uint32_t type_token_id
		i32 208; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x0200023c, ; uint32_t type_token_id
		i32 355; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x0200023f, ; uint32_t type_token_id
		i32 150; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000242, ; uint32_t type_token_id
		i32 426; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x02000243, ; uint32_t type_token_id
		i32 426; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x02000245, ; uint32_t type_token_id
		i32 207; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000247, ; uint32_t type_token_id
		i32 506; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x02000249, ; uint32_t type_token_id
		i32 234; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x0200024a, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x0200024c, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x0200024e, ; uint32_t type_token_id
		i32 239; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x02000250, ; uint32_t type_token_id
		i32 418; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x02000255, ; uint32_t type_token_id
		i32 468; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x02000257, ; uint32_t type_token_id
		i32 297; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x02000259, ; uint32_t type_token_id
		i32 481; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x0200025b, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x0200025d, ; uint32_t type_token_id
		i32 331; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x0200025f, ; uint32_t type_token_id
		i32 311; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x02000261, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x02000263, ; uint32_t type_token_id
		i32 524; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x02000265, ; uint32_t type_token_id
		i32 451; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x02000267, ; uint32_t type_token_id
		i32 417; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x02000269, ; uint32_t type_token_id
		i32 480; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x0200026b, ; uint32_t type_token_id
		i32 518; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x0200026e, ; uint32_t type_token_id
		i32 136; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x02000287, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x02000289, ; uint32_t type_token_id
		i32 411; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x0200028c, ; uint32_t type_token_id
		i32 415; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x0200028e, ; uint32_t type_token_id
		i32 282; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x02000291, ; uint32_t type_token_id
		i32 212; uint32_t java_map_index
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 u0x02000296, ; uint32_t type_token_id
		i32 542; uint32_t java_map_index
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 u0x0200029c, ; uint32_t type_token_id
		i32 178; uint32_t java_map_index
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 u0x020002a2, ; uint32_t type_token_id
		i32 514; uint32_t java_map_index
	} ; 123
], align 16

@module12_managed_to_java = internal dso_local constant [41 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 256; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 126; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 199; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 152; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 485; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 429; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 221; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 498; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 215; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 76; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 447; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 300; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 528; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 399; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 283; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 66; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 328; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 424; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 445; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 374; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 394; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 327; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 275; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 187; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 497; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 546; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 146; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 536; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 423; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 396; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 333; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 459; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 496; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 149; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 443; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 530; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	} ; 40
], align 16

@module12_managed_to_java_duplicates = internal dso_local constant [8 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 528; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200003d, ; uint32_t type_token_id
		i32 374; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 394; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 327; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 275; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 187; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 497; uint32_t java_map_index
	} ; 7
], align 16

@module13_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 240; uint32_t java_map_index
	} ; 0
], align 4

@module13_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 240; uint32_t java_map_index
	} ; 0
], align 4

@module14_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 387; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 274; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 350; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 361; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 296; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 298; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 198; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 310; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 440; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 161; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 119; uint32_t java_map_index
	} ; 13
], align 16

@module15_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 466; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 308; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 398; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 206; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 386; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 179; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 364; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 260; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 366; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 442; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 170; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 484; uint32_t java_map_index
	} ; 13
], align 16

@module15_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 466; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 466; uint32_t java_map_index
	} ; 1
], align 16

@module16_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 492; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 254; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 230; uint32_t java_map_index
	} ; 4
], align 16

@module16_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 492; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 254; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 230; uint32_t java_map_index
	} ; 4
], align 16

@module17_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 90; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 329; uint32_t java_map_index
	} ; 1
], align 16

@module17_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 329; uint32_t java_map_index
	} ; 0
], align 4

@module18_managed_to_java = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 379; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 200; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 384; uint32_t java_map_index
	} ; 2
], align 16

@module18_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 200; uint32_t java_map_index
	} ; 0
], align 4

@module19_managed_to_java = internal dso_local constant [12 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 117; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 191; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 345; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 430; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 253; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 127; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 419; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 5; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 148; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 401; uint32_t java_map_index
	} ; 11
], align 16

@module19_managed_to_java_duplicates = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 430; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 127; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 419; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 148; uint32_t java_map_index
	} ; 5
], align 16

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [547 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000077, ; uint32_t type_token_id
		i32 339; uint32_t java_name_index
	}, ; 0
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 11; uint32_t java_name_index
	}, ; 1
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 232; uint32_t java_name_index
	}, ; 2
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000272, ; uint32_t type_token_id
		i32 254; uint32_t java_name_index
	}, ; 3
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200015a, ; uint32_t type_token_id
		i32 108; uint32_t java_name_index
	}, ; 4
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 544; uint32_t java_name_index
	}, ; 5
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 12; uint32_t java_name_index
	}, ; 6
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 38; uint32_t java_name_index
	}, ; 7
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 473; uint32_t java_name_index
	}, ; 8
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 67; uint32_t java_name_index
	}, ; 9
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 351; uint32_t java_name_index
	}, ; 10
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 394; uint32_t java_name_index
	}, ; 11
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f9, ; uint32_t type_token_id
		i32 184; uint32_t java_name_index
	}, ; 12
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000210, ; uint32_t type_token_id
		i32 194; uint32_t java_name_index
	}, ; 13
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 385; uint32_t java_name_index
	}, ; 14
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000252, ; uint32_t type_token_id
		i32 236; uint32_t java_name_index
	}, ; 15
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 320; uint32_t java_name_index
	}, ; 16
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 486; uint32_t java_name_index
	}, ; 17
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 240; uint32_t java_name_index
	}, ; 18
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000db, ; uint32_t type_token_id
		i32 45; uint32_t java_name_index
	}, ; 19
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 30; uint32_t java_name_index
	}, ; 20
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 41; uint32_t java_name_index
	}, ; 21
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 456; uint32_t java_name_index
	}, ; 22
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 28; uint32_t java_name_index
	}, ; 23
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001b0, ; uint32_t type_token_id
		i32 141; uint32_t java_name_index
	}, ; 24
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 139; uint32_t java_name_index
	}, ; 25
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000078, ; uint32_t type_token_id
		i32 340; uint32_t java_name_index
	}, ; 26
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 527; uint32_t java_name_index
	}, ; 27
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 155; uint32_t java_name_index
	}, ; 28
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 314; uint32_t java_name_index
	}, ; 29
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 508; uint32_t java_name_index
	}, ; 30
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000213, ; uint32_t type_token_id
		i32 197; uint32_t java_name_index
	}, ; 31
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ea, ; uint32_t type_token_id
		i32 174; uint32_t java_name_index
	}, ; 32
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200022a, ; uint32_t type_token_id
		i32 213; uint32_t java_name_index
	}, ; 33
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 97; uint32_t java_name_index
	}, ; 34
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 211; uint32_t java_name_index
	}, ; 35
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 369; uint32_t java_name_index
	}, ; 36
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000035, ; uint32_t type_token_id
		i32 298; uint32_t java_name_index
	}, ; 37
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000118, ; uint32_t type_token_id
		i32 80; uint32_t java_name_index
	}, ; 38
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 427; uint32_t java_name_index
	}, ; 39
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 14; uint32_t java_name_index
	}, ; 40
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 431; uint32_t java_name_index
	}, ; 41
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 227; uint32_t java_name_index
	}, ; 42
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 301; uint32_t java_name_index
	}, ; 43
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 98; uint32_t java_name_index
	}, ; 44
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200016c, ; uint32_t type_token_id
		i32 118; uint32_t java_name_index
	}, ; 45
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000168, ; uint32_t type_token_id
		i32 116; uint32_t java_name_index
	}, ; 46
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001fe, ; uint32_t type_token_id
		i32 187; uint32_t java_name_index
	}, ; 47
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 356; uint32_t java_name_index
	}, ; 48
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 450; uint32_t java_name_index
	}, ; 49
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000185, ; uint32_t type_token_id
		i32 133; uint32_t java_name_index
	}, ; 50
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 382; uint32_t java_name_index
	}, ; 51
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 522; uint32_t java_name_index
	}, ; 52
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000270, ; uint32_t type_token_id
		i32 252; uint32_t java_name_index
	}, ; 53
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 96; uint32_t java_name_index
	}, ; 54
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 350; uint32_t java_name_index
	}, ; 55
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 52; uint32_t java_name_index
	}, ; 56
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 33; uint32_t java_name_index
	}, ; 57
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000237, ; uint32_t type_token_id
		i32 221; uint32_t java_name_index
	}, ; 58
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 40; uint32_t java_name_index
	}, ; 59
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000072, ; uint32_t type_token_id
		i32 337; uint32_t java_name_index
	}, ; 60
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f4, ; uint32_t type_token_id
		i32 180; uint32_t java_name_index
	}, ; 61
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 49; uint32_t java_name_index
	}, ; 62
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 58; uint32_t java_name_index
	}, ; 63
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001da, ; uint32_t type_token_id
		i32 161; uint32_t java_name_index
	}, ; 64
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 332; uint32_t java_name_index
	}, ; 65
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000036, ; uint32_t type_token_id
		i32 472; uint32_t java_name_index
	}, ; 66
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 243; uint32_t java_name_index
	}, ; 67
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x02000008, ; uint32_t type_token_id
		i32 390; uint32_t java_name_index
	}, ; 68
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 446; uint32_t java_name_index
	}, ; 69
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000098, ; uint32_t type_token_id
		i32 4; uint32_t java_name_index
	}, ; 70
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f0, ; uint32_t type_token_id
		i32 177; uint32_t java_name_index
	}, ; 71
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 392; uint32_t java_name_index
	}, ; 72
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200028a, ; uint32_t type_token_id
		i32 275; uint32_t java_name_index
	}, ; 73
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000129, ; uint32_t type_token_id
		i32 89; uint32_t java_name_index
	}, ; 74
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 373; uint32_t java_name_index
	}, ; 75
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 466; uint32_t java_name_index
	}, ; 76
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 388; uint32_t java_name_index
	}, ; 77
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 334; uint32_t java_name_index
	}, ; 78
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 422; uint32_t java_name_index
	}, ; 79
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 499; uint32_t java_name_index
	}, ; 80
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 421; uint32_t java_name_index
	}, ; 81
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 542; uint32_t java_name_index
	}, ; 82
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200014f, ; uint32_t type_token_id
		i32 102; uint32_t java_name_index
	}, ; 83
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 18; uint32_t java_name_index
	}, ; 84
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 482; uint32_t java_name_index
	}, ; 85
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 526; uint32_t java_name_index
	}, ; 86
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000170, ; uint32_t type_token_id
		i32 122; uint32_t java_name_index
	}, ; 87
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000095, ; uint32_t type_token_id
		i32 2; uint32_t java_name_index
	}, ; 88
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ce, ; uint32_t type_token_id
		i32 150; uint32_t java_name_index
	}, ; 89
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 530; uint32_t java_name_index
	}, ; 90
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 455; uint32_t java_name_index
	}, ; 91
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 26; uint32_t java_name_index
	}, ; 92
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 55; uint32_t java_name_index
	}, ; 93
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b6, ; uint32_t type_token_id
		i32 23; uint32_t java_name_index
	}, ; 94
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200029e, ; uint32_t type_token_id
		i32 288; uint32_t java_name_index
	}, ; 95
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 83; uint32_t java_name_index
	}, ; 96
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 426; uint32_t java_name_index
	}, ; 97
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f1, ; uint32_t type_token_id
		i32 178; uint32_t java_name_index
	}, ; 98
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 182; uint32_t java_name_index
	}, ; 99
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e1, ; uint32_t type_token_id
		i32 167; uint32_t java_name_index
	}, ; 100
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e9, ; uint32_t type_token_id
		i32 173; uint32_t java_name_index
	}, ; 101
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 477; uint32_t java_name_index
	}, ; 102
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000271, ; uint32_t type_token_id
		i32 253; uint32_t java_name_index
	}, ; 103
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 85; uint32_t java_name_index
	}, ; 104
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 360; uint32_t java_name_index
	}, ; 105
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 297; uint32_t java_name_index
	}, ; 106
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 205; uint32_t java_name_index
	}, ; 107
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 345; uint32_t java_name_index
	}, ; 108
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x02000013, ; uint32_t type_token_id
		i32 540; uint32_t java_name_index
	}, ; 109
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 335; uint32_t java_name_index
	}, ; 110
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000005, ; uint32_t type_token_id
		i32 386; uint32_t java_name_index
	}, ; 111
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000293, ; uint32_t type_token_id
		i32 279; uint32_t java_name_index
	}, ; 112
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000056, ; uint32_t type_token_id
		i32 497; uint32_t java_name_index
	}, ; 113
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ca, ; uint32_t type_token_id
		i32 34; uint32_t java_name_index
	}, ; 114
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000286, ; uint32_t type_token_id
		i32 273; uint32_t java_name_index
	}, ; 115
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000108, ; uint32_t type_token_id
		i32 71; uint32_t java_name_index
	}, ; 116
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 535; uint32_t java_name_index
	}, ; 117
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000f5, ; uint32_t type_token_id
		i32 60; uint32_t java_name_index
	}, ; 118
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 512; uint32_t java_name_index
	}, ; 119
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 407; uint32_t java_name_index
	}, ; 120
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 65; uint32_t java_name_index
	}, ; 121
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 520; uint32_t java_name_index
	}, ; 122
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d2, ; uint32_t type_token_id
		i32 153; uint32_t java_name_index
	}, ; 123
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 125; uint32_t java_name_index
	}, ; 124
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000184, ; uint32_t type_token_id
		i32 132; uint32_t java_name_index
	}, ; 125
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 458; uint32_t java_name_index
	}, ; 126
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x02000015, ; uint32_t type_token_id
		i32 541; uint32_t java_name_index
	}, ; 127
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 423; uint32_t java_name_index
	}, ; 128
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000165, ; uint32_t type_token_id
		i32 114; uint32_t java_name_index
	}, ; 129
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 94; uint32_t java_name_index
	}, ; 130
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 510; uint32_t java_name_index
	}, ; 131
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001b1, ; uint32_t type_token_id
		i32 142; uint32_t java_name_index
	}, ; 132
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000158, ; uint32_t type_token_id
		i32 106; uint32_t java_name_index
	}, ; 133
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 413; uint32_t java_name_index
	}, ; 134
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 86; uint32_t java_name_index
	}, ; 135
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 249; uint32_t java_name_index
	}, ; 136
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200021a, ; uint32_t type_token_id
		i32 203; uint32_t java_name_index
	}, ; 137
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000211, ; uint32_t type_token_id
		i32 195; uint32_t java_name_index
	}, ; 138
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 24; uint32_t java_name_index
	}, ; 139
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 443; uint32_t java_name_index
	}, ; 140
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 378; uint32_t java_name_index
	}, ; 141
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 396; uint32_t java_name_index
	}, ; 142
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 408; uint32_t java_name_index
	}, ; 143
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 92; uint32_t java_name_index
	}, ; 144
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000241, ; uint32_t type_token_id
		i32 228; uint32_t java_name_index
	}, ; 145
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 487; uint32_t java_name_index
	}, ; 146
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 384; uint32_t java_name_index
	}, ; 147
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 545; uint32_t java_name_index
	}, ; 148
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000053, ; uint32_t type_token_id
		i32 494; uint32_t java_name_index
	}, ; 149
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200023e, ; uint32_t type_token_id
		i32 226; uint32_t java_name_index
	}, ; 150
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 395; uint32_t java_name_index
	}, ; 151
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 460; uint32_t java_name_index
	}, ; 152
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 342; uint32_t java_name_index
	}, ; 153
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 303; uint32_t java_name_index
	}, ; 154
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200020c, ; uint32_t type_token_id
		i32 192; uint32_t java_name_index
	}, ; 155
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 381; uint32_t java_name_index
	}, ; 156
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 318; uint32_t java_name_index
	}, ; 157
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000023, ; uint32_t type_token_id
		i32 402; uint32_t java_name_index
	}, ; 158
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000025, ; uint32_t type_token_id
		i32 436; uint32_t java_name_index
	}, ; 159
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 91; uint32_t java_name_index
	}, ; 160
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 511; uint32_t java_name_index
	}, ; 161
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 414; uint32_t java_name_index
	}, ; 162
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 59; uint32_t java_name_index
	}, ; 163
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 47; uint32_t java_name_index
	}, ; 164
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000151, ; uint32_t type_token_id
		i32 103; uint32_t java_name_index
	}, ; 165
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000091, ; uint32_t type_token_id
		i32 0; uint32_t java_name_index
	}, ; 166
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c5, ; uint32_t type_token_id
		i32 145; uint32_t java_name_index
	}, ; 167
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000274, ; uint32_t type_token_id
		i32 256; uint32_t java_name_index
	}, ; 168
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000285, ; uint32_t type_token_id
		i32 272; uint32_t java_name_index
	}, ; 169
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 523; uint32_t java_name_index
	}, ; 170
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 5; uint32_t java_name_index
	}, ; 171
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 21; uint32_t java_name_index
	}, ; 172
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 48; uint32_t java_name_index
	}, ; 173
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f8, ; uint32_t type_token_id
		i32 183; uint32_t java_name_index
	}, ; 174
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200016f, ; uint32_t type_token_id
		i32 121; uint32_t java_name_index
	}, ; 175
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 409; uint32_t java_name_index
	}, ; 176
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 305; uint32_t java_name_index
	}, ; 177
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200029b, ; uint32_t type_token_id
		i32 286; uint32_t java_name_index
	}, ; 178
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000034, ; uint32_t type_token_id
		i32 516; uint32_t java_name_index
	}, ; 179
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000297, ; uint32_t type_token_id
		i32 282; uint32_t java_name_index
	}, ; 180
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200016d, ; uint32_t type_token_id
		i32 119; uint32_t java_name_index
	}, ; 181
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 156; uint32_t java_name_index
	}, ; 182
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 418; uint32_t java_name_index
	}, ; 183
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000186, ; uint32_t type_token_id
		i32 134; uint32_t java_name_index
	}, ; 184
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 151; uint32_t java_name_index
	}, ; 185
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 43; uint32_t java_name_index
	}, ; 186
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 483; uint32_t java_name_index
	}, ; 187
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000041, ; uint32_t type_token_id
		i32 370; uint32_t java_name_index
	}, ; 188
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 398; uint32_t java_name_index
	}, ; 189
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 363; uint32_t java_name_index
	}, ; 190
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 536; uint32_t java_name_index
	}, ; 191
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000da, ; uint32_t type_token_id
		i32 44; uint32_t java_name_index
	}, ; 192
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000204, ; uint32_t type_token_id
		i32 188; uint32_t java_name_index
	}, ; 193
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 163; uint32_t java_name_index
	}, ; 194
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 324; uint32_t java_name_index
	}, ; 195
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000115, ; uint32_t type_token_id
		i32 79; uint32_t java_name_index
	}, ; 196
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 441; uint32_t java_name_index
	}, ; 197
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 506; uint32_t java_name_index
	}, ; 198
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 459; uint32_t java_name_index
	}, ; 199
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 533; uint32_t java_name_index
	}, ; 200
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000107, ; uint32_t type_token_id
		i32 70; uint32_t java_name_index
	}, ; 201
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d8, ; uint32_t type_token_id
		i32 159; uint32_t java_name_index
	}, ; 202
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ef, ; uint32_t type_token_id
		i32 176; uint32_t java_name_index
	}, ; 203
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027f, ; uint32_t type_token_id
		i32 267; uint32_t java_name_index
	}, ; 204
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000024, ; uint32_t type_token_id
		i32 403; uint32_t java_name_index
	}, ; 205
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 514; uint32_t java_name_index
	}, ; 206
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 229; uint32_t java_name_index
	}, ; 207
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 223; uint32_t java_name_index
	}, ; 208
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000064, ; uint32_t type_token_id
		i32 326; uint32_t java_name_index
	}, ; 209
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e4, ; uint32_t type_token_id
		i32 169; uint32_t java_name_index
	}, ; 210
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 309; uint32_t java_name_index
	}, ; 211
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 277; uint32_t java_name_index
	}, ; 212
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000238, ; uint32_t type_token_id
		i32 222; uint32_t java_name_index
	}, ; 213
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 346; uint32_t java_name_index
	}, ; 214
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 465; uint32_t java_name_index
	}, ; 215
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200026f, ; uint32_t type_token_id
		i32 251; uint32_t java_name_index
	}, ; 216
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 87; uint32_t java_name_index
	}, ; 217
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x02000007, ; uint32_t type_token_id
		i32 389; uint32_t java_name_index
	}, ; 218
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000217, ; uint32_t type_token_id
		i32 200; uint32_t java_name_index
	}, ; 219
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000140, ; uint32_t type_token_id
		i32 100; uint32_t java_name_index
	}, ; 220
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 463; uint32_t java_name_index
	}, ; 221
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 37; uint32_t java_name_index
	}, ; 222
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 405; uint32_t java_name_index
	}, ; 223
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 331; uint32_t java_name_index
	}, ; 224
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 366; uint32_t java_name_index
	}, ; 225
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200029f, ; uint32_t type_token_id
		i32 289; uint32_t java_name_index
	}, ; 226
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000109, ; uint32_t type_token_id
		i32 72; uint32_t java_name_index
	}, ; 227
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cb, ; uint32_t type_token_id
		i32 149; uint32_t java_name_index
	}, ; 228
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 311; uint32_t java_name_index
	}, ; 229
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 529; uint32_t java_name_index
	}, ; 230
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000222, ; uint32_t type_token_id
		i32 207; uint32_t java_name_index
	}, ; 231
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000106, ; uint32_t type_token_id
		i32 69; uint32_t java_name_index
	}, ; 232
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 158; uint32_t java_name_index
	}, ; 233
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 231; uint32_t java_name_index
	}, ; 234
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 300; uint32_t java_name_index
	}, ; 235
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 333; uint32_t java_name_index
	}, ; 236
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000035, ; uint32_t type_token_id
		i32 412; uint32_t java_name_index
	}, ; 237
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 315; uint32_t java_name_index
	}, ; 238
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 233; uint32_t java_name_index
	}, ; 239
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index
		i32 u0x02000008, ; uint32_t type_token_id
		i32 498; uint32_t java_name_index
	}, ; 240
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020002b2, ; uint32_t type_token_id
		i32 292; uint32_t java_name_index
	}, ; 241
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 321; uint32_t java_name_index
	}, ; 242
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 434; uint32_t java_name_index
	}, ; 243
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 78; uint32_t java_name_index
	}, ; 244
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 454; uint32_t java_name_index
	}, ; 245
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001db, ; uint32_t type_token_id
		i32 162; uint32_t java_name_index
	}, ; 246
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 447; uint32_t java_name_index
	}, ; 247
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 27; uint32_t java_name_index
	}, ; 248
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e0, ; uint32_t type_token_id
		i32 166; uint32_t java_name_index
	}, ; 249
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000067, ; uint32_t type_token_id
		i32 329; uint32_t java_name_index
	}, ; 250
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 364; uint32_t java_name_index
	}, ; 251
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 355; uint32_t java_name_index
	}, ; 252
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 539; uint32_t java_name_index
	}, ; 253
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 528; uint32_t java_name_index
	}, ; 254
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 304; uint32_t java_name_index
	}, ; 255
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000019, ; uint32_t type_token_id
		i32 457; uint32_t java_name_index
	}, ; 256
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000229, ; uint32_t type_token_id
		i32 212; uint32_t java_name_index
	}, ; 257
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 367; uint32_t java_name_index
	}, ; 258
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000066, ; uint32_t type_token_id
		i32 328; uint32_t java_name_index
	}, ; 259
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 518; uint32_t java_name_index
	}, ; 260
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ae, ; uint32_t type_token_id
		i32 140; uint32_t java_name_index
	}, ; 261
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 82; uint32_t java_name_index
	}, ; 262
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000097, ; uint32_t type_token_id
		i32 3; uint32_t java_name_index
	}, ; 263
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 375; uint32_t java_name_index
	}, ; 264
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001de, ; uint32_t type_token_id
		i32 164; uint32_t java_name_index
	}, ; 265
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 56; uint32_t java_name_index
	}, ; 266
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000251, ; uint32_t type_token_id
		i32 235; uint32_t java_name_index
	}, ; 267
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 204; uint32_t java_name_index
	}, ; 268
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000219, ; uint32_t type_token_id
		i32 202; uint32_t java_name_index
	}, ; 269
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 336; uint32_t java_name_index
	}, ; 270
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000039, ; uint32_t type_token_id
		i32 302; uint32_t java_name_index
	}, ; 271
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 73; uint32_t java_name_index
	}, ; 272
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 397; uint32_t java_name_index
	}, ; 273
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000015, ; uint32_t type_token_id
		i32 501; uint32_t java_name_index
	}, ; 274
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 481; uint32_t java_name_index
	}, ; 275
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 313; uint32_t java_name_index
	}, ; 276
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 36; uint32_t java_name_index
	}, ; 277
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d3, ; uint32_t type_token_id
		i32 39; uint32_t java_name_index
	}, ; 278
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 440; uint32_t java_name_index
	}, ; 279
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000076, ; uint32_t type_token_id
		i32 338; uint32_t java_name_index
	}, ; 280
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000163, ; uint32_t type_token_id
		i32 113; uint32_t java_name_index
	}, ; 281
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 261; uint32_t java_name_index
	}, ; 282
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000035, ; uint32_t type_token_id
		i32 471; uint32_t java_name_index
	}, ; 283
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001df, ; uint32_t type_token_id
		i32 165; uint32_t java_name_index
	}, ; 284
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000159, ; uint32_t type_token_id
		i32 107; uint32_t java_name_index
	}, ; 285
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000298, ; uint32_t type_token_id
		i32 283; uint32_t java_name_index
	}, ; 286
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 393; uint32_t java_name_index
	}, ; 287
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000049, ; uint32_t type_token_id
		i32 312; uint32_t java_name_index
	}, ; 288
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000049, ; uint32_t type_token_id
		i32 415; uint32_t java_name_index
	}, ; 289
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027e, ; uint32_t type_token_id
		i32 266; uint32_t java_name_index
	}, ; 290
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000235, ; uint32_t type_token_id
		i32 220; uint32_t java_name_index
	}, ; 291
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 7; uint32_t java_name_index
	}, ; 292
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000273, ; uint32_t type_token_id
		i32 255; uint32_t java_name_index
	}, ; 293
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000049, ; uint32_t type_token_id
		i32 372; uint32_t java_name_index
	}, ; 294
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000031, ; uint32_t type_token_id
		i32 295; uint32_t java_name_index
	}, ; 295
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000019, ; uint32_t type_token_id
		i32 504; uint32_t java_name_index
	}, ; 296
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 238; uint32_t java_name_index
	}, ; 297
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 505; uint32_t java_name_index
	}, ; 298
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001fc, ; uint32_t type_token_id
		i32 186; uint32_t java_name_index
	}, ; 299
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000031, ; uint32_t type_token_id
		i32 468; uint32_t java_name_index
	}, ; 300
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 448; uint32_t java_name_index
	}, ; 301
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 380; uint32_t java_name_index
	}, ; 302
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000032, ; uint32_t type_token_id
		i32 296; uint32_t java_name_index
	}, ; 303
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000110, ; uint32_t type_token_id
		i32 77; uint32_t java_name_index
	}, ; 304
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000148, ; uint32_t type_token_id
		i32 101; uint32_t java_name_index
	}, ; 305
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 316; uint32_t java_name_index
	}, ; 306
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001be, ; uint32_t type_token_id
		i32 144; uint32_t java_name_index
	}, ; 307
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000284, ; uint32_t type_token_id
		i32 271; uint32_t java_name_index
	}, ; 308
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000282, ; uint32_t type_token_id
		i32 269; uint32_t java_name_index
	}, ; 309
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000025, ; uint32_t type_token_id
		i32 507; uint32_t java_name_index
	}, ; 310
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 242; uint32_t java_name_index
	}, ; 311
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000206, ; uint32_t type_token_id
		i32 190; uint32_t java_name_index
	}, ; 312
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200029d, ; uint32_t type_token_id
		i32 287; uint32_t java_name_index
	}, ; 313
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 147; uint32_t java_name_index
	}, ; 314
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200017d, ; uint32_t type_token_id
		i32 127; uint32_t java_name_index
	}, ; 315
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000028, ; uint32_t type_token_id
		i32 439; uint32_t java_name_index
	}, ; 316
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000040, ; uint32_t type_token_id
		i32 307; uint32_t java_name_index
	}, ; 317
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000278, ; uint32_t type_token_id
		i32 260; uint32_t java_name_index
	}, ; 318
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 352; uint32_t java_name_index
	}, ; 319
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e7, ; uint32_t type_token_id
		i32 171; uint32_t java_name_index
	}, ; 320
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200016e, ; uint32_t type_token_id
		i32 120; uint32_t java_name_index
	}, ; 321
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001fb, ; uint32_t type_token_id
		i32 185; uint32_t java_name_index
	}, ; 322
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200019e, ; uint32_t type_token_id
		i32 136; uint32_t java_name_index
	}, ; 323
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000230, ; uint32_t type_token_id
		i32 216; uint32_t java_name_index
	}, ; 324
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 50; uint32_t java_name_index
	}, ; 325
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000231, ; uint32_t type_token_id
		i32 217; uint32_t java_name_index
	}, ; 326
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 480; uint32_t java_name_index
	}, ; 327
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 474; uint32_t java_name_index
	}, ; 328
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 531; uint32_t java_name_index
	}, ; 329
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000006, ; uint32_t type_token_id
		i32 387; uint32_t java_name_index
	}, ; 330
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 241; uint32_t java_name_index
	}, ; 331
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 430; uint32_t java_name_index
	}, ; 332
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 491; uint32_t java_name_index
	}, ; 333
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000119, ; uint32_t type_token_id
		i32 81; uint32_t java_name_index
	}, ; 334
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000216, ; uint32_t type_token_id
		i32 199; uint32_t java_name_index
	}, ; 335
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d6, ; uint32_t type_token_id
		i32 157; uint32_t java_name_index
	}, ; 336
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000025, ; uint32_t type_token_id
		i32 404; uint32_t java_name_index
	}, ; 337
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000063, ; uint32_t type_token_id
		i32 325; uint32_t java_name_index
	}, ; 338
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200029a, ; uint32_t type_token_id
		i32 285; uint32_t java_name_index
	}, ; 339
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 453; uint32_t java_name_index
	}, ; 340
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000212, ; uint32_t type_token_id
		i32 196; uint32_t java_name_index
	}, ; 341
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 411; uint32_t java_name_index
	}, ; 342
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000060, ; uint32_t type_token_id
		i32 323; uint32_t java_name_index
	}, ; 343
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 61; uint32_t java_name_index
	}, ; 344
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 537; uint32_t java_name_index
	}, ; 345
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 425; uint32_t java_name_index
	}, ; 346
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 383; uint32_t java_name_index
	}, ; 347
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 452; uint32_t java_name_index
	}, ; 348
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 294; uint32_t java_name_index
	}, ; 349
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000016, ; uint32_t type_token_id
		i32 502; uint32_t java_name_index
	}, ; 350
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000154, ; uint32_t type_token_id
		i32 104; uint32_t java_name_index
	}, ; 351
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 8; uint32_t java_name_index
	}, ; 352
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 438; uint32_t java_name_index
	}, ; 353
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 371; uint32_t java_name_index
	}, ; 354
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200023b, ; uint32_t type_token_id
		i32 224; uint32_t java_name_index
	}, ; 355
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000214, ; uint32_t type_token_id
		i32 198; uint32_t java_name_index
	}, ; 356
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 451; uint32_t java_name_index
	}, ; 357
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 13; uint32_t java_name_index
	}, ; 358
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 19; uint32_t java_name_index
	}, ; 359
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000280, ; uint32_t type_token_id
		i32 268; uint32_t java_name_index
	}, ; 360
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 503; uint32_t java_name_index
	}, ; 361
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000039, ; uint32_t type_token_id
		i32 365; uint32_t java_name_index
	}, ; 362
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000292, ; uint32_t type_token_id
		i32 278; uint32_t java_name_index
	}, ; 363
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 517; uint32_t java_name_index
	}, ; 364
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200020e, ; uint32_t type_token_id
		i32 193; uint32_t java_name_index
	}, ; 365
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000040, ; uint32_t type_token_id
		i32 519; uint32_t java_name_index
	}, ; 366
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 358; uint32_t java_name_index
	}, ; 367
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 99; uint32_t java_name_index
	}, ; 368
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027a, ; uint32_t type_token_id
		i32 262; uint32_t java_name_index
	}, ; 369
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000172, ; uint32_t type_token_id
		i32 123; uint32_t java_name_index
	}, ; 370
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000277, ; uint32_t type_token_id
		i32 259; uint32_t java_name_index
	}, ; 371
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 117; uint32_t java_name_index
	}, ; 372
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000045, ; uint32_t type_token_id
		i32 310; uint32_t java_name_index
	}, ; 373
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 478; uint32_t java_name_index
	}, ; 374
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 374; uint32_t java_name_index
	}, ; 375
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 349; uint32_t java_name_index
	}, ; 376
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 62; uint32_t java_name_index
	}, ; 377
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d9, ; uint32_t type_token_id
		i32 160; uint32_t java_name_index
	}, ; 378
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000016, ; uint32_t type_token_id
		i32 532; uint32_t java_name_index
	}, ; 379
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 154; uint32_t java_name_index
	}, ; 380
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 400; uint32_t java_name_index
	}, ; 381
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000161, ; uint32_t type_token_id
		i32 111; uint32_t java_name_index
	}, ; 382
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 16; uint32_t java_name_index
	}, ; 383
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 534; uint32_t java_name_index
	}, ; 384
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f5, ; uint32_t type_token_id
		i32 181; uint32_t java_name_index
	}, ; 385
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 515; uint32_t java_name_index
	}, ; 386
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 500; uint32_t java_name_index
	}, ; 387
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 75; uint32_t java_name_index
	}, ; 388
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 63; uint32_t java_name_index
	}, ; 389
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 10; uint32_t java_name_index
	}, ; 390
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 432; uint32_t java_name_index
	}, ; 391
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e3, ; uint32_t type_token_id
		i32 168; uint32_t java_name_index
	}, ; 392
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 53; uint32_t java_name_index
	}, ; 393
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 479; uint32_t java_name_index
	}, ; 394
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 343; uint32_t java_name_index
	}, ; 395
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 490; uint32_t java_name_index
	}, ; 396
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 306; uint32_t java_name_index
	}, ; 397
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027c, ; uint32_t type_token_id
		i32 264; uint32_t java_name_index
	}, ; 398
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000034, ; uint32_t type_token_id
		i32 470; uint32_t java_name_index
	}, ; 399
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d1, ; uint32_t type_token_id
		i32 152; uint32_t java_name_index
	}, ; 400
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 546; uint32_t java_name_index
	}, ; 401
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 31; uint32_t java_name_index
	}, ; 402
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000275, ; uint32_t type_token_id
		i32 257; uint32_t java_name_index
	}, ; 403
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 347; uint32_t java_name_index
	}, ; 404
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e8, ; uint32_t type_token_id
		i32 172; uint32_t java_name_index
	}, ; 405
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ca, ; uint32_t type_token_id
		i32 148; uint32_t java_name_index
	}, ; 406
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 90; uint32_t java_name_index
	}, ; 407
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000283, ; uint32_t type_token_id
		i32 270; uint32_t java_name_index
	}, ; 408
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 95; uint32_t java_name_index
	}, ; 409
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 419; uint32_t java_name_index
	}, ; 410
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000288, ; uint32_t type_token_id
		i32 274; uint32_t java_name_index
	}, ; 411
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 429; uint32_t java_name_index
	}, ; 412
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 433; uint32_t java_name_index
	}, ; 413
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 25; uint32_t java_name_index
	}, ; 414
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 276; uint32_t java_name_index
	}, ; 415
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e6, ; uint32_t type_token_id
		i32 170; uint32_t java_name_index
	}, ; 416
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 246; uint32_t java_name_index
	}, ; 417
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 234; uint32_t java_name_index
	}, ; 418
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x02000019, ; uint32_t type_token_id
		i32 543; uint32_t java_name_index
	}, ; 419
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000181, ; uint32_t type_token_id
		i32 129; uint32_t java_name_index
	}, ; 420
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000187, ; uint32_t type_token_id
		i32 135; uint32_t java_name_index
	}, ; 421
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 424; uint32_t java_name_index
	}, ; 422
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 489; uint32_t java_name_index
	}, ; 423
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000039, ; uint32_t type_token_id
		i32 475; uint32_t java_name_index
	}, ; 424
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200026d, ; uint32_t type_token_id
		i32 250; uint32_t java_name_index
	}, ; 425
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001a3, ; uint32_t type_token_id
		i32 138; uint32_t java_name_index
	}, ; 426
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 66; uint32_t java_name_index
	}, ; 427
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 93; uint32_t java_name_index
	}, ; 428
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000021, ; uint32_t type_token_id
		i32 462; uint32_t java_name_index
	}, ; 429
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 538; uint32_t java_name_index
	}, ; 430
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000205, ; uint32_t type_token_id
		i32 189; uint32_t java_name_index
	}, ; 431
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200015c, ; uint32_t type_token_id
		i32 109; uint32_t java_name_index
	}, ; 432
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c7, ; uint32_t type_token_id
		i32 146; uint32_t java_name_index
	}, ; 433
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 88; uint32_t java_name_index
	}, ; 434
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 410; uint32_t java_name_index
	}, ; 435
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200017c, ; uint32_t type_token_id
		i32 126; uint32_t java_name_index
	}, ; 436
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 15; uint32_t java_name_index
	}, ; 437
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000276, ; uint32_t type_token_id
		i32 258; uint32_t java_name_index
	}, ; 438
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200020a, ; uint32_t type_token_id
		i32 191; uint32_t java_name_index
	}, ; 439
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000033, ; uint32_t type_token_id
		i32 509; uint32_t java_name_index
	}, ; 440
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 293; uint32_t java_name_index
	}, ; 441
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 521; uint32_t java_name_index
	}, ; 442
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000054, ; uint32_t type_token_id
		i32 495; uint32_t java_name_index
	}, ; 443
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 379; uint32_t java_name_index
	}, ; 444
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 476; uint32_t java_name_index
	}, ; 445
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 42; uint32_t java_name_index
	}, ; 446
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 467; uint32_t java_name_index
	}, ; 447
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 391; uint32_t java_name_index
	}, ; 448
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 32; uint32_t java_name_index
	}, ; 449
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000162, ; uint32_t type_token_id
		i32 112; uint32_t java_name_index
	}, ; 450
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 245; uint32_t java_name_index
	}, ; 451
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 344; uint32_t java_name_index
	}, ; 452
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 64; uint32_t java_name_index
	}, ; 453
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000031, ; uint32_t type_token_id
		i32 361; uint32_t java_name_index
	}, ; 454
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 416; uint32_t java_name_index
	}, ; 455
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 435; uint32_t java_name_index
	}, ; 456
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 420; uint32_t java_name_index
	}, ; 457
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ec, ; uint32_t type_token_id
		i32 175; uint32_t java_name_index
	}, ; 458
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 492; uint32_t java_name_index
	}, ; 459
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000182, ; uint32_t type_token_id
		i32 130; uint32_t java_name_index
	}, ; 460
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 399; uint32_t java_name_index
	}, ; 461
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020002a0, ; uint32_t type_token_id
		i32 290; uint32_t java_name_index
	}, ; 462
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 9; uint32_t java_name_index
	}, ; 463
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 357; uint32_t java_name_index
	}, ; 464
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 57; uint32_t java_name_index
	}, ; 465
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 513; uint32_t java_name_index
	}, ; 466
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 84; uint32_t java_name_index
	}, ; 467
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 237; uint32_t java_name_index
	}, ; 468
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000299, ; uint32_t type_token_id
		i32 284; uint32_t java_name_index
	}, ; 469
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 51; uint32_t java_name_index
	}, ; 470
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000028, ; uint32_t type_token_id
		i32 406; uint32_t java_name_index
	}, ; 471
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200015e, ; uint32_t type_token_id
		i32 110; uint32_t java_name_index
	}, ; 472
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 322; uint32_t java_name_index
	}, ; 473
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200022c, ; uint32_t type_token_id
		i32 214; uint32_t java_name_index
	}, ; 474
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 376; uint32_t java_name_index
	}, ; 475
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 17; uint32_t java_name_index
	}, ; 476
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000223, ; uint32_t type_token_id
		i32 208; uint32_t java_name_index
	}, ; 477
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 449; uint32_t java_name_index
	}, ; 478
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 35; uint32_t java_name_index
	}, ; 479
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 247; uint32_t java_name_index
	}, ; 480
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 239; uint32_t java_name_index
	}, ; 481
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000026, ; uint32_t type_token_id
		i32 437; uint32_t java_name_index
	}, ; 482
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000224, ; uint32_t type_token_id
		i32 209; uint32_t java_name_index
	}, ; 483
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x02000094, ; uint32_t type_token_id
		i32 524; uint32_t java_name_index
	}, ; 484
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 461; uint32_t java_name_index
	}, ; 485
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000174, ; uint32_t type_token_id
		i32 124; uint32_t java_name_index
	}, ; 486
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 22; uint32_t java_name_index
	}, ; 487
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 445; uint32_t java_name_index
	}, ; 488
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 76; uint32_t java_name_index
	}, ; 489
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 377; uint32_t java_name_index
	}, ; 490
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f3, ; uint32_t type_token_id
		i32 179; uint32_t java_name_index
	}, ; 491
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 525; uint32_t java_name_index
	}, ; 492
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000065, ; uint32_t type_token_id
		i32 327; uint32_t java_name_index
	}, ; 493
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 428; uint32_t java_name_index
	}, ; 494
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 74; uint32_t java_name_index
	}, ; 495
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000052, ; uint32_t type_token_id
		i32 493; uint32_t java_name_index
	}, ; 496
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 484; uint32_t java_name_index
	}, ; 497
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 464; uint32_t java_name_index
	}, ; 498
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027b, ; uint32_t type_token_id
		i32 263; uint32_t java_name_index
	}, ; 499
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000005, ; uint32_t type_token_id
		i32 353; uint32_t java_name_index
	}, ; 500
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 29; uint32_t java_name_index
	}, ; 501
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000022, ; uint32_t type_token_id
		i32 401; uint32_t java_name_index
	}, ; 502
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 54; uint32_t java_name_index
	}, ; 503
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200022e, ; uint32_t type_token_id
		i32 215; uint32_t java_name_index
	}, ; 504
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 6; uint32_t java_name_index
	}, ; 505
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 230; uint32_t java_name_index
	}, ; 506
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000232, ; uint32_t type_token_id
		i32 218; uint32_t java_name_index
	}, ; 507
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000102, ; uint32_t type_token_id
		i32 68; uint32_t java_name_index
	}, ; 508
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200023d, ; uint32_t type_token_id
		i32 225; uint32_t java_name_index
	}, ; 509
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 219; uint32_t java_name_index
	}, ; 510
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000294, ; uint32_t type_token_id
		i32 280; uint32_t java_name_index
	}, ; 511
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000006, ; uint32_t type_token_id
		i32 354; uint32_t java_name_index
	}, ; 512
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 20; uint32_t java_name_index
	}, ; 513
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 291; uint32_t java_name_index
	}, ; 514
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 442; uint32_t java_name_index
	}, ; 515
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 137; uint32_t java_name_index
	}, ; 516
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000218, ; uint32_t type_token_id
		i32 201; uint32_t java_name_index
	}, ; 517
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 248; uint32_t java_name_index
	}, ; 518
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000157, ; uint32_t type_token_id
		i32 105; uint32_t java_name_index
	}, ; 519
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000183, ; uint32_t type_token_id
		i32 131; uint32_t java_name_index
	}, ; 520
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 417; uint32_t java_name_index
	}, ; 521
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000068, ; uint32_t type_token_id
		i32 330; uint32_t java_name_index
	}, ; 522
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 359; uint32_t java_name_index
	}, ; 523
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 244; uint32_t java_name_index
	}, ; 524
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 368; uint32_t java_name_index
	}, ; 525
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000080, ; uint32_t type_token_id
		i32 348; uint32_t java_name_index
	}, ; 526
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000225, ; uint32_t type_token_id
		i32 210; uint32_t java_name_index
	}, ; 527
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000032, ; uint32_t type_token_id
		i32 469; uint32_t java_name_index
	}, ; 528
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000041, ; uint32_t type_token_id
		i32 308; uint32_t java_name_index
	}, ; 529
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 496; uint32_t java_name_index
	}, ; 530
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 341; uint32_t java_name_index
	}, ; 531
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000180, ; uint32_t type_token_id
		i32 128; uint32_t java_name_index
	}, ; 532
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200027d, ; uint32_t type_token_id
		i32 265; uint32_t java_name_index
	}, ; 533
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 319; uint32_t java_name_index
	}, ; 534
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000167, ; uint32_t type_token_id
		i32 115; uint32_t java_name_index
	}, ; 535
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 488; uint32_t java_name_index
	}, ; 536
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 317; uint32_t java_name_index
	}, ; 537
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000093, ; uint32_t type_token_id
		i32 1; uint32_t java_name_index
	}, ; 538
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001b2, ; uint32_t type_token_id
		i32 143; uint32_t java_name_index
	}, ; 539
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 444; uint32_t java_name_index
	}, ; 540
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 362; uint32_t java_name_index
	}, ; 541
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 281; uint32_t java_name_index
	}, ; 542
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 46; uint32_t java_name_index
	}, ; 543
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 206; uint32_t java_name_index
	}, ; 544
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000036, ; uint32_t type_token_id
		i32 299; uint32_t java_name_index
	}, ; 545
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 485; uint32_t java_name_index
	} ; 546
], align 16

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [547 x ptr] [
	ptr @.tmr.0, ; 0 ('org/json/JSONObject')
	ptr @.tmr.1, ; 1 ('javax/security/cert/Certificate')
	ptr @.tmr.2, ; 2 ('javax/security/cert/X509Certificate')
	ptr @.tmr.3, ; 3 ('javax/security/auth/Subject')
	ptr @.tmr.4, ; 4 ('javax/net/SocketFactory')
	ptr @.tmr.5, ; 5 ('javax/net/ssl/HttpsURLConnection')
	ptr @.tmr.6, ; 6 ('javax/net/ssl/HostnameVerifier')
	ptr @.tmr.7, ; 7 ('javax/net/ssl/KeyManager')
	ptr @.tmr.8, ; 8 ('javax/net/ssl/SSLSession')
	ptr @.tmr.9, ; 9 ('javax/net/ssl/SSLSessionContext')
	ptr @.tmr.10, ; 10 ('javax/net/ssl/TrustManager')
	ptr @.tmr.11, ; 11 ('javax/net/ssl/KeyManagerFactory')
	ptr @.tmr.12, ; 12 ('javax/net/ssl/SSLContext')
	ptr @.tmr.13, ; 13 ('javax/net/ssl/SSLSocketFactory')
	ptr @.tmr.14, ; 14 ('javax/net/ssl/TrustManagerFactory')
	ptr @.tmr.15, ; 15 ('android/window/BackEvent')
	ptr @.tmr.16, ; 16 ('android/window/OnBackInvokedCallback')
	ptr @.tmr.17, ; 17 ('android/window/OnBackInvokedDispatcher')
	ptr @.tmr.18, ; 18 ('android/provider/DocumentsContract')
	ptr @.tmr.19, ; 19 ('android/provider/Settings')
	ptr @.tmr.20, ; 20 ('android/provider/Settings$NameValueTable')
	ptr @.tmr.21, ; 21 ('android/provider/Settings$Secure')
	ptr @.tmr.22, ; 22 ('android/database/CharArrayBuffer')
	ptr @.tmr.23, ; 23 ('android/database/ContentObserver')
	ptr @.tmr.24, ; 24 ('android/database/DataSetObserver')
	ptr @.tmr.25, ; 25 ('android/database/Cursor')
	ptr @.tmr.26, ; 26 ('android/widget/AdapterView')
	ptr @.tmr.27, ; 27 ('android/widget/AdapterView$OnItemSelectedListener')
	ptr @.tmr.28, ; 28 ('android/widget/FrameLayout')
	ptr @.tmr.29, ; 29 ('android/widget/HorizontalScrollView')
	ptr @.tmr.30, ; 30 ('android/widget/Adapter')
	ptr @.tmr.31, ; 31 ('android/widget/SpinnerAdapter')
	ptr @.tmr.32, ; 32 ('android/util/DisplayMetrics')
	ptr @.tmr.33, ; 33 ('android/util/AttributeSet')
	ptr @.tmr.34, ; 34 ('android/util/Pair')
	ptr @.tmr.35, ; 35 ('android/util/SparseArray')
	ptr @.tmr.36, ; 36 ('android/text/ClipboardManager')
	ptr @.tmr.37, ; 37 ('android/text/TextUtils')
	ptr @.tmr.38, ; 38 ('android/text/style/CharacterStyle')
	ptr @.tmr.39, ; 39 ('android/text/style/ClickableSpan')
	ptr @.tmr.40, ; 40 ('android/os/Handler')
	ptr @.tmr.41, ; 41 ('android/os/BaseBundle')
	ptr @.tmr.42, ; 42 ('android/os/Build')
	ptr @.tmr.43, ; 43 ('android/os/Build$VERSION')
	ptr @.tmr.44, ; 44 ('android/os/Bundle')
	ptr @.tmr.45, ; 45 ('android/os/CancellationSignal')
	ptr @.tmr.46, ; 46 ('android/os/IBinder$DeathRecipient')
	ptr @.tmr.47, ; 47 ('android/os/IBinder')
	ptr @.tmr.48, ; 48 ('android/os/IBinder$FrozenStateChangeCallback')
	ptr @.tmr.49, ; 49 ('android/os/IInterface')
	ptr @.tmr.50, ; 50 ('android/os/Parcelable$Creator')
	ptr @.tmr.51, ; 51 ('android/os/Parcelable')
	ptr @.tmr.52, ; 52 ('android/os/LocaleList')
	ptr @.tmr.53, ; 53 ('android/os/Looper')
	ptr @.tmr.54, ; 54 ('android/os/MessageQueue')
	ptr @.tmr.55, ; 55 ('android/os/MessageQueue$IdleHandler')
	ptr @.tmr.56, ; 56 ('android/os/Parcel')
	ptr @.tmr.57, ; 57 ('android/os/SystemClock')
	ptr @.tmr.58, ; 58 ('android/media/AudioManager')
	ptr @.tmr.59, ; 59 ('android/animation/Animator')
	ptr @.tmr.60, ; 60 ('android/animation/AnimatorListenerAdapter')
	ptr @.tmr.61, ; 61 ('android/animation/TimeInterpolator')
	ptr @.tmr.62, ; 62 ('android/view/WindowManager$LayoutParams')
	ptr @.tmr.63, ; 63 ('android/view/View')
	ptr @.tmr.64, ; 64 ('android/view/View$AccessibilityDelegate')
	ptr @.tmr.65, ; 65 ('android/view/View$DragShadowBuilder')
	ptr @.tmr.66, ; 66 ('android/view/View$OnClickListener')
	ptr @.tmr.67, ; 67 ('android/view/View$OnFocusChangeListener')
	ptr @.tmr.68, ; 68 ('mono/android/view/View_OnFocusChangeListenerImplementor')
	ptr @.tmr.69, ; 69 ('android/view/InputDevice')
	ptr @.tmr.70, ; 70 ('android/view/KeyEvent')
	ptr @.tmr.71, ; 71 ('android/view/LayoutInflater')
	ptr @.tmr.72, ; 72 ('android/view/MotionEvent')
	ptr @.tmr.73, ; 73 ('android/view/ViewTreeObserver')
	ptr @.tmr.74, ; 74 ('android/view/ViewTreeObserver$OnGlobalLayoutListener')
	ptr @.tmr.75, ; 75 ('android/view/Window')
	ptr @.tmr.76, ; 76 ('android/view/Window$Callback')
	ptr @.tmr.77, ; 77 ('android/view/ActionMode')
	ptr @.tmr.78, ; 78 ('android/view/ActionMode$Callback')
	ptr @.tmr.79, ; 79 ('android/view/ActionProvider')
	ptr @.tmr.80, ; 80 ('android/view/ContentInfo')
	ptr @.tmr.81, ; 81 ('android/view/ContextThemeWrapper')
	ptr @.tmr.82, ; 82 ('android/view/Display')
	ptr @.tmr.83, ; 83 ('android/view/ContextMenu$ContextMenuInfo')
	ptr @.tmr.84, ; 84 ('android/view/ContextMenu')
	ptr @.tmr.85, ; 85 ('android/view/Menu')
	ptr @.tmr.86, ; 86 ('android/view/MenuItem$OnActionExpandListener')
	ptr @.tmr.87, ; 87 ('android/view/MenuItem$OnMenuItemClickListener')
	ptr @.tmr.88, ; 88 ('android/view/MenuItem')
	ptr @.tmr.89, ; 89 ('android/view/InputEvent')
	ptr @.tmr.90, ; 90 ('android/view/SubMenu')
	ptr @.tmr.91, ; 91 ('android/view/SurfaceHolder$Callback')
	ptr @.tmr.92, ; 92 ('android/view/SurfaceHolder$Callback2')
	ptr @.tmr.93, ; 93 ('android/view/SurfaceHolder')
	ptr @.tmr.94, ; 94 ('android/view/ViewParent')
	ptr @.tmr.95, ; 95 ('android/view/WindowInsetsAnimationController')
	ptr @.tmr.96, ; 96 ('android/view/WindowInsetsAnimationControlListener')
	ptr @.tmr.97, ; 97 ('android/view/WindowInsetsController')
	ptr @.tmr.98, ; 98 ('android/view/WindowInsetsController$OnControllableInsetsChangedListener')
	ptr @.tmr.99, ; 99 ('android/view/KeyboardShortcutGroup')
	ptr @.tmr.100, ; 100 ('android/view/KeyboardShortcutInfo')
	ptr @.tmr.101, ; 101 ('android/view/MenuInflater')
	ptr @.tmr.102, ; 102 ('android/view/SearchEvent')
	ptr @.tmr.103, ; 103 ('android/view/Surface')
	ptr @.tmr.104, ; 104 ('android/view/SurfaceView')
	ptr @.tmr.105, ; 105 ('android/view/ViewConfiguration')
	ptr @.tmr.106, ; 106 ('android/view/ViewGroup')
	ptr @.tmr.107, ; 107 ('android/view/ViewGroup$LayoutParams')
	ptr @.tmr.108, ; 108 ('android/view/ViewGroup$MarginLayoutParams')
	ptr @.tmr.109, ; 109 ('android/view/ViewPropertyAnimator')
	ptr @.tmr.110, ; 110 ('android/view/ViewStructure')
	ptr @.tmr.111, ; 111 ('android/view/WindowInsets')
	ptr @.tmr.112, ; 112 ('android/view/WindowInsetsAnimation')
	ptr @.tmr.113, ; 113 ('android/view/WindowInsetsAnimation$Bounds')
	ptr @.tmr.114, ; 114 ('android/view/contentcapture/ContentCaptureSession')
	ptr @.tmr.115, ; 115 ('android/view/autofill/AutofillId')
	ptr @.tmr.116, ; 116 ('android/view/animation/Animation')
	ptr @.tmr.117, ; 117 ('android/view/animation/Interpolator')
	ptr @.tmr.118, ; 118 ('android/view/inputmethod/InputMethodManager')
	ptr @.tmr.119, ; 119 ('android/view/inputmethod/CompletionInfo')
	ptr @.tmr.120, ; 120 ('android/view/inputmethod/CorrectionInfo')
	ptr @.tmr.121, ; 121 ('android/view/inputmethod/EditorInfo')
	ptr @.tmr.122, ; 122 ('android/view/inputmethod/ExtractedText')
	ptr @.tmr.123, ; 123 ('android/view/inputmethod/ExtractedTextRequest')
	ptr @.tmr.124, ; 124 ('android/view/inputmethod/HandwritingGesture')
	ptr @.tmr.125, ; 125 ('android/view/inputmethod/InputConnection')
	ptr @.tmr.126, ; 126 ('android/view/inputmethod/InputContentInfo')
	ptr @.tmr.127, ; 127 ('android/view/inputmethod/PreviewableHandwritingGesture')
	ptr @.tmr.128, ; 128 ('android/view/inputmethod/SurroundingText')
	ptr @.tmr.129, ; 129 ('android/view/inputmethod/TextAttribute')
	ptr @.tmr.130, ; 130 ('android/view/inputmethod/TextSnapshot')
	ptr @.tmr.131, ; 131 ('android/view/accessibility/AccessibilityEvent')
	ptr @.tmr.132, ; 132 ('android/view/accessibility/AccessibilityNodeInfo')
	ptr @.tmr.133, ; 133 ('android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo')
	ptr @.tmr.134, ; 134 ('android/view/accessibility/AccessibilityRecord')
	ptr @.tmr.135, ; 135 ('android/view/accessibility/AccessibilityWindowInfo')
	ptr @.tmr.136, ; 136 ('mono/android/runtime/InputStreamAdapter')
	ptr @.tmr.137, ; 137 ('mono/android/runtime/JavaArray')
	ptr @.tmr.138, ; 138 ('java/util/Collection')
	ptr @.tmr.139, ; 139 ('java/util/HashMap')
	ptr @.tmr.140, ; 140 ('java/util/ArrayList')
	ptr @.tmr.141, ; 141 ('mono/android/runtime/JavaObject')
	ptr @.tmr.142, ; 142 ('android/runtime/JavaProxyThrowable')
	ptr @.tmr.143, ; 143 ('java/util/HashSet')
	ptr @.tmr.144, ; 144 ('mono/android/runtime/OutputStreamAdapter')
	ptr @.tmr.145, ; 145 ('android/net/Uri')
	ptr @.tmr.146, ; 146 ('android/hardware/display/DisplayManager')
	ptr @.tmr.147, ; 147 ('android/hardware/display/DisplayManager$DisplayListener')
	ptr @.tmr.148, ; 148 ('android/graphics/Bitmap')
	ptr @.tmr.149, ; 149 ('android/graphics/Canvas')
	ptr @.tmr.150, ; 150 ('android/graphics/BlendMode')
	ptr @.tmr.151, ; 151 ('android/graphics/ColorFilter')
	ptr @.tmr.152, ; 152 ('android/graphics/Insets')
	ptr @.tmr.153, ; 153 ('android/graphics/Matrix')
	ptr @.tmr.154, ; 154 ('android/graphics/Paint')
	ptr @.tmr.155, ; 155 ('android/graphics/Path')
	ptr @.tmr.156, ; 156 ('android/graphics/Point')
	ptr @.tmr.157, ; 157 ('android/graphics/PorterDuff')
	ptr @.tmr.158, ; 158 ('android/graphics/PorterDuff$Mode')
	ptr @.tmr.159, ; 159 ('android/graphics/Rect')
	ptr @.tmr.160, ; 160 ('android/graphics/RectF')
	ptr @.tmr.161, ; 161 ('android/graphics/Region')
	ptr @.tmr.162, ; 162 ('android/graphics/drawable/Drawable')
	ptr @.tmr.163, ; 163 ('android/graphics/drawable/ColorDrawable')
	ptr @.tmr.164, ; 164 ('android/content/ContentProvider')
	ptr @.tmr.165, ; 165 ('android/content/ContentValues')
	ptr @.tmr.166, ; 166 ('android/content/Context')
	ptr @.tmr.167, ; 167 ('android/content/Intent')
	ptr @.tmr.168, ; 168 ('android/content/ActivityNotFoundException')
	ptr @.tmr.169, ; 169 ('android/content/BroadcastReceiver')
	ptr @.tmr.170, ; 170 ('android/content/ClipboardManager')
	ptr @.tmr.171, ; 171 ('android/content/ClipData')
	ptr @.tmr.172, ; 172 ('android/content/ClipData$Item')
	ptr @.tmr.173, ; 173 ('android/content/ClipDescription')
	ptr @.tmr.174, ; 174 ('android/content/ComponentName')
	ptr @.tmr.175, ; 175 ('android/content/ContentResolver')
	ptr @.tmr.176, ; 176 ('android/content/ContextWrapper')
	ptr @.tmr.177, ; 177 ('android/content/IntentFilter')
	ptr @.tmr.178, ; 178 ('android/content/IntentSender')
	ptr @.tmr.179, ; 179 ('android/content/res/AssetFileDescriptor')
	ptr @.tmr.180, ; 180 ('android/content/res/ColorStateList')
	ptr @.tmr.181, ; 181 ('android/content/res/Configuration')
	ptr @.tmr.182, ; 182 ('android/content/res/Resources')
	ptr @.tmr.183, ; 183 ('android/content/res/Resources$Theme')
	ptr @.tmr.184, ; 184 ('android/content/res/TypedArray')
	ptr @.tmr.185, ; 185 ('android/content/pm/PackageManager')
	ptr @.tmr.186, ; 186 ('android/content/pm/ApplicationInfo')
	ptr @.tmr.187, ; 187 ('android/content/pm/PackageItemInfo')
	ptr @.tmr.188, ; 188 ('android/app/Activity')
	ptr @.tmr.189, ; 189 ('android/app/Application')
	ptr @.tmr.190, ; 190 ('android/app/Dialog')
	ptr @.tmr.191, ; 191 ('android/app/PendingIntent')
	ptr @.tmr.192, ; 192 ('java/net/ConnectException')
	ptr @.tmr.193, ; 193 ('java/net/HttpURLConnection')
	ptr @.tmr.194, ; 194 ('java/net/InetSocketAddress')
	ptr @.tmr.195, ; 195 ('java/net/ProtocolException')
	ptr @.tmr.196, ; 196 ('java/net/Proxy')
	ptr @.tmr.197, ; 197 ('java/net/Proxy$Type')
	ptr @.tmr.198, ; 198 ('java/net/SocketAddress')
	ptr @.tmr.199, ; 199 ('java/net/SocketException')
	ptr @.tmr.200, ; 200 ('java/net/SocketTimeoutException')
	ptr @.tmr.201, ; 201 ('java/net/UnknownServiceException')
	ptr @.tmr.202, ; 202 ('java/net/URL')
	ptr @.tmr.203, ; 203 ('java/net/URLConnection')
	ptr @.tmr.204, ; 204 ('java/security/Key')
	ptr @.tmr.205, ; 205 ('java/security/Principal')
	ptr @.tmr.206, ; 206 ('java/security/PrivateKey')
	ptr @.tmr.207, ; 207 ('java/security/KeyFactory')
	ptr @.tmr.208, ; 208 ('java/security/KeyStore')
	ptr @.tmr.209, ; 209 ('java/security/SecureRandom')
	ptr @.tmr.210, ; 210 ('java/security/spec/EncodedKeySpec')
	ptr @.tmr.211, ; 211 ('java/security/spec/KeySpec')
	ptr @.tmr.212, ; 212 ('java/security/spec/PKCS8EncodedKeySpec')
	ptr @.tmr.213, ; 213 ('java/security/cert/Certificate')
	ptr @.tmr.214, ; 214 ('java/nio/channels/FileChannel')
	ptr @.tmr.215, ; 215 ('java/nio/channels/spi/AbstractInterruptibleChannel')
	ptr @.tmr.216, ; 216 ('java/io/File')
	ptr @.tmr.217, ; 217 ('java/io/FileDescriptor')
	ptr @.tmr.218, ; 218 ('java/io/FileInputStream')
	ptr @.tmr.219, ; 219 ('java/io/Closeable')
	ptr @.tmr.220, ; 220 ('java/io/InputStream')
	ptr @.tmr.221, ; 221 ('java/io/InterruptedIOException')
	ptr @.tmr.222, ; 222 ('java/io/IOException')
	ptr @.tmr.223, ; 223 ('java/io/Serializable')
	ptr @.tmr.224, ; 224 ('java/io/OutputStream')
	ptr @.tmr.225, ; 225 ('java/io/PrintWriter')
	ptr @.tmr.226, ; 226 ('java/io/Writer')
	ptr @.tmr.227, ; 227 ('java/util/List')
	ptr @.tmr.228, ; 228 ('java/util/Date')
	ptr @.tmr.229, ; 229 ('java/util/Comparator')
	ptr @.tmr.230, ; 230 ('java/util/Enumeration')
	ptr @.tmr.231, ; 231 ('java/util/Iterator')
	ptr @.tmr.232, ; 232 ('java/util/ListIterator')
	ptr @.tmr.233, ; 233 ('java/util/SequencedCollection')
	ptr @.tmr.234, ; 234 ('java/util/Spliterator')
	ptr @.tmr.235, ; 235 ('java/util/Locale')
	ptr @.tmr.236, ; 236 ('java/util/Random')
	ptr @.tmr.237, ; 237 ('java/util/function/Consumer')
	ptr @.tmr.238, ; 238 ('java/util/function/Function')
	ptr @.tmr.239, ; 239 ('java/util/function/IntConsumer')
	ptr @.tmr.240, ; 240 ('java/util/function/IntFunction')
	ptr @.tmr.241, ; 241 ('java/util/function/Predicate')
	ptr @.tmr.242, ; 242 ('java/util/function/ToDoubleFunction')
	ptr @.tmr.243, ; 243 ('java/util/function/ToIntFunction')
	ptr @.tmr.244, ; 244 ('java/util/function/ToLongFunction')
	ptr @.tmr.245, ; 245 ('java/util/function/UnaryOperator')
	ptr @.tmr.246, ; 246 ('java/util/concurrent/Callable')
	ptr @.tmr.247, ; 247 ('java/util/concurrent/Executor')
	ptr @.tmr.248, ; 248 ('java/util/concurrent/ExecutorService')
	ptr @.tmr.249, ; 249 ('java/util/concurrent/Future')
	ptr @.tmr.250, ; 250 ('java/util/concurrent/Future$State')
	ptr @.tmr.251, ; 251 ('java/util/concurrent/TimeUnit')
	ptr @.tmr.252, ; 252 ('java/util/concurrent/atomic/AtomicLong')
	ptr @.tmr.253, ; 253 ('java/lang/Boolean')
	ptr @.tmr.254, ; 254 ('java/lang/Byte')
	ptr @.tmr.255, ; 255 ('java/lang/Character')
	ptr @.tmr.256, ; 256 ('java/lang/Class')
	ptr @.tmr.257, ; 257 ('java/lang/ClassNotFoundException')
	ptr @.tmr.258, ; 258 ('java/lang/Double')
	ptr @.tmr.259, ; 259 ('java/lang/Exception')
	ptr @.tmr.260, ; 260 ('java/lang/Float')
	ptr @.tmr.261, ; 261 ('java/lang/CharSequence')
	ptr @.tmr.262, ; 262 ('java/lang/Integer')
	ptr @.tmr.263, ; 263 ('java/lang/Long')
	ptr @.tmr.264, ; 264 ('java/lang/Object')
	ptr @.tmr.265, ; 265 ('mono/java/lang/Runnable')
	ptr @.tmr.266, ; 266 ('java/lang/RuntimeException')
	ptr @.tmr.267, ; 267 ('java/lang/Short')
	ptr @.tmr.268, ; 268 ('java/lang/String')
	ptr @.tmr.269, ; 269 ('java/lang/Thread')
	ptr @.tmr.270, ; 270 ('mono/java/lang/RunnableImplementor')
	ptr @.tmr.271, ; 271 ('java/lang/Throwable')
	ptr @.tmr.272, ; 272 ('java/lang/ClassCastException')
	ptr @.tmr.273, ; 273 ('java/lang/ClassLoader')
	ptr @.tmr.274, ; 274 ('java/lang/Enum')
	ptr @.tmr.275, ; 275 ('java/lang/Error')
	ptr @.tmr.276, ; 276 ('java/lang/AutoCloseable')
	ptr @.tmr.277, ; 277 ('java/lang/Iterable')
	ptr @.tmr.278, ; 278 ('java/lang/IllegalArgumentException')
	ptr @.tmr.279, ; 279 ('java/lang/IllegalStateException')
	ptr @.tmr.280, ; 280 ('java/lang/IndexOutOfBoundsException')
	ptr @.tmr.281, ; 281 ('java/lang/Runnable')
	ptr @.tmr.282, ; 282 ('java/lang/LinkageError')
	ptr @.tmr.283, ; 283 ('java/lang/Math')
	ptr @.tmr.284, ; 284 ('java/lang/NoClassDefFoundError')
	ptr @.tmr.285, ; 285 ('java/lang/NullPointerException')
	ptr @.tmr.286, ; 286 ('java/lang/Number')
	ptr @.tmr.287, ; 287 ('java/lang/ReflectiveOperationException')
	ptr @.tmr.288, ; 288 ('java/lang/SecurityException')
	ptr @.tmr.289, ; 289 ('java/lang/StackTraceElement')
	ptr @.tmr.290, ; 290 ('java/lang/UnsupportedOperationException')
	ptr @.tmr.291, ; 291 ('java/lang/annotation/Annotation')
	ptr @.tmr.292, ; 292 ('mono/android/TypeManager')
	ptr @.tmr.293, ; 293 ('androidx/core/util/Consumer')
	ptr @.tmr.294, ; 294 ('androidx/core/util/Predicate')
	ptr @.tmr.295, ; 295 ('androidx/core/util/Pair')
	ptr @.tmr.296, ; 296 ('androidx/core/os/LocaleListCompat')
	ptr @.tmr.297, ; 297 ('androidx/core/internal/view/SupportMenuItem')
	ptr @.tmr.298, ; 298 ('androidx/core/graphics/Insets')
	ptr @.tmr.299, ; 299 ('androidx/core/content/ContextCompat')
	ptr @.tmr.300, ; 300 ('androidx/core/content/FileProvider')
	ptr @.tmr.301, ; 301 ('androidx/core/app/ActivityOptionsCompat')
	ptr @.tmr.302, ; 302 ('androidx/core/app/ComponentActivity')
	ptr @.tmr.303, ; 303 ('androidx/core/app/ComponentActivity$ExtraData')
	ptr @.tmr.304, ; 304 ('androidx/core/app/SharedElementCallback')
	ptr @.tmr.305, ; 305 ('androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener')
	ptr @.tmr.306, ; 306 ('androidx/core/app/TaskStackBuilder')
	ptr @.tmr.307, ; 307 ('androidx/core/view/AccessibilityDelegateCompat')
	ptr @.tmr.308, ; 308 ('androidx/core/view/ActionProvider')
	ptr @.tmr.309, ; 309 ('androidx/core/view/ActionProvider$SubUiVisibilityListener')
	ptr @.tmr.310, ; 310 ('mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor')
	ptr @.tmr.311, ; 311 ('androidx/core/view/ActionProvider$VisibilityListener')
	ptr @.tmr.312, ; 312 ('mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor')
	ptr @.tmr.313, ; 313 ('androidx/core/view/ContentInfoCompat')
	ptr @.tmr.314, ; 314 ('androidx/core/view/DisplayCutoutCompat')
	ptr @.tmr.315, ; 315 ('androidx/core/view/MenuProvider')
	ptr @.tmr.316, ; 316 ('androidx/core/view/OnApplyWindowInsetsListener')
	ptr @.tmr.317, ; 317 ('androidx/core/view/OnReceiveContentListener')
	ptr @.tmr.318, ; 318 ('androidx/core/view/ViewPropertyAnimatorListener')
	ptr @.tmr.319, ; 319 ('androidx/core/view/ViewPropertyAnimatorUpdateListener')
	ptr @.tmr.320, ; 320 ('androidx/core/view/WindowInsetsAnimationControlListenerCompat')
	ptr @.tmr.321, ; 321 ('androidx/core/view/PointerIconCompat')
	ptr @.tmr.322, ; 322 ('androidx/core/view/RoundedCornerCompat')
	ptr @.tmr.323, ; 323 ('androidx/core/view/ViewCompat')
	ptr @.tmr.324, ; 324 ('androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat')
	ptr @.tmr.325, ; 325 ('androidx/core/view/ViewPropertyAnimatorCompat')
	ptr @.tmr.326, ; 326 ('androidx/core/view/ViewStructureCompat')
	ptr @.tmr.327, ; 327 ('androidx/core/view/WindowCompat')
	ptr @.tmr.328, ; 328 ('androidx/core/view/WindowInsetsAnimationCompat')
	ptr @.tmr.329, ; 329 ('androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat')
	ptr @.tmr.330, ; 330 ('androidx/core/view/WindowInsetsAnimationCompat$Callback')
	ptr @.tmr.331, ; 331 ('androidx/core/view/WindowInsetsAnimationControllerCompat')
	ptr @.tmr.332, ; 332 ('androidx/core/view/WindowInsetsCompat')
	ptr @.tmr.333, ; 333 ('androidx/core/view/WindowInsetsCompat$Builder')
	ptr @.tmr.334, ; 334 ('androidx/core/view/WindowInsetsCompat$Type')
	ptr @.tmr.335, ; 335 ('androidx/core/view/WindowInsetsControllerCompat')
	ptr @.tmr.336, ; 336 ('androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener')
	ptr @.tmr.337, ; 337 ('mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor')
	ptr @.tmr.338, ; 338 ('androidx/core/view/contentcapture/ContentCaptureSessionCompat')
	ptr @.tmr.339, ; 339 ('androidx/core/view/autofill/AutofillIdCompat')
	ptr @.tmr.340, ; 340 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat')
	ptr @.tmr.341, ; 341 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat')
	ptr @.tmr.342, ; 342 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat')
	ptr @.tmr.343, ; 343 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat')
	ptr @.tmr.344, ; 344 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat')
	ptr @.tmr.345, ; 345 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat')
	ptr @.tmr.346, ; 346 ('androidx/core/view/accessibility/AccessibilityNodeProviderCompat')
	ptr @.tmr.347, ; 347 ('androidx/core/view/accessibility/AccessibilityWindowInfoCompat')
	ptr @.tmr.348, ; 348 ('androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments')
	ptr @.tmr.349, ; 349 ('androidx/core/view/accessibility/AccessibilityViewCommand')
	ptr @.tmr.350, ; 350 ('androidx/lifecycle/Observer')
	ptr @.tmr.351, ; 351 ('androidx/lifecycle/LiveData')
	ptr @.tmr.352, ; 352 ('androidx/lifecycle/Lifecycle')
	ptr @.tmr.353, ; 353 ('androidx/lifecycle/Lifecycle$State')
	ptr @.tmr.354, ; 354 ('androidx/lifecycle/AtomicReference')
	ptr @.tmr.355, ; 355 ('androidx/lifecycle/LifecycleObserver')
	ptr @.tmr.356, ; 356 ('androidx/lifecycle/LifecycleOwner')
	ptr @.tmr.357, ; 357 ('androidx/appcompat/graphics/drawable/DrawerArrowDrawable')
	ptr @.tmr.358, ; 358 ('androidx/appcompat/widget/Toolbar')
	ptr @.tmr.359, ; 359 ('androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher')
	ptr @.tmr.360, ; 360 ('androidx/appcompat/widget/Toolbar$OnMenuItemClickListener')
	ptr @.tmr.361, ; 361 ('mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor')
	ptr @.tmr.362, ; 362 ('androidx/appcompat/widget/DecorToolbar')
	ptr @.tmr.363, ; 363 ('androidx/appcompat/widget/ScrollingTabContainerView')
	ptr @.tmr.364, ; 364 ('androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener')
	ptr @.tmr.365, ; 365 ('androidx/appcompat/app/ActionBar')
	ptr @.tmr.366, ; 366 ('androidx/appcompat/app/ActionBar$LayoutParams')
	ptr @.tmr.367, ; 367 ('androidx/appcompat/app/ActionBar$OnMenuVisibilityListener')
	ptr @.tmr.368, ; 368 ('mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor')
	ptr @.tmr.369, ; 369 ('androidx/appcompat/app/ActionBar$OnNavigationListener')
	ptr @.tmr.370, ; 370 ('androidx/appcompat/app/ActionBar$Tab')
	ptr @.tmr.371, ; 371 ('androidx/appcompat/app/ActionBar$TabListener')
	ptr @.tmr.372, ; 372 ('androidx/appcompat/app/ActionBarDrawerToggle')
	ptr @.tmr.373, ; 373 ('androidx/appcompat/app/ActionBarDrawerToggle$Delegate')
	ptr @.tmr.374, ; 374 ('androidx/appcompat/app/AppCompatActivity')
	ptr @.tmr.375, ; 375 ('androidx/appcompat/app/AppCompatDelegate')
	ptr @.tmr.376, ; 376 ('androidx/appcompat/app/AppCompatCallback')
	ptr @.tmr.377, ; 377 ('androidx/appcompat/view/ActionMode')
	ptr @.tmr.378, ; 378 ('androidx/appcompat/view/ActionMode$Callback')
	ptr @.tmr.379, ; 379 ('androidx/appcompat/view/menu/MenuBuilder')
	ptr @.tmr.380, ; 380 ('androidx/appcompat/view/menu/MenuBuilder$Callback')
	ptr @.tmr.381, ; 381 ('androidx/appcompat/view/menu/MenuPresenter$Callback')
	ptr @.tmr.382, ; 382 ('androidx/appcompat/view/menu/MenuPresenter')
	ptr @.tmr.383, ; 383 ('androidx/appcompat/view/menu/MenuView')
	ptr @.tmr.384, ; 384 ('androidx/appcompat/view/menu/MenuItemImpl')
	ptr @.tmr.385, ; 385 ('androidx/appcompat/view/menu/SubMenuBuilder')
	ptr @.tmr.386, ; 386 ('crc646f32ce3c20719675/MainActivity')
	ptr @.tmr.387, ; 387 ('crc646f32ce3c20719675/MainApplication')
	ptr @.tmr.388, ; 388 ('androidx/navigationevent/OnBackCompletedFallback')
	ptr @.tmr.389, ; 389 ('androidx/navigationevent/NavigationEvent')
	ptr @.tmr.390, ; 390 ('androidx/navigationevent/NavigationEventDispatcher')
	ptr @.tmr.391, ; 391 ('androidx/navigationevent/NavigationEventHandler')
	ptr @.tmr.392, ; 392 ('androidx/navigationevent/NavigationEventHistory')
	ptr @.tmr.393, ; 393 ('androidx/navigationevent/NavigationEventInfo')
	ptr @.tmr.394, ; 394 ('androidx/navigationevent/NavigationEventInput')
	ptr @.tmr.395, ; 395 ('androidx/navigationevent/NavigationEventTransitionState')
	ptr @.tmr.396, ; 396 ('androidx/loader/content/Loader')
	ptr @.tmr.397, ; 397 ('androidx/loader/content/Loader$OnLoadCanceledListener')
	ptr @.tmr.398, ; 398 ('androidx/loader/content/Loader$OnLoadCompleteListener')
	ptr @.tmr.399, ; 399 ('androidx/loader/app/LoaderManager')
	ptr @.tmr.400, ; 400 ('androidx/loader/app/LoaderManager$LoaderCallbacks')
	ptr @.tmr.401, ; 401 ('androidx/fragment/app/FragmentActivity')
	ptr @.tmr.402, ; 402 ('androidx/fragment/app/Fragment')
	ptr @.tmr.403, ; 403 ('androidx/fragment/app/Fragment$SavedState')
	ptr @.tmr.404, ; 404 ('androidx/fragment/app/FragmentContainer')
	ptr @.tmr.405, ; 405 ('androidx/fragment/app/FragmentContainerView')
	ptr @.tmr.406, ; 406 ('androidx/fragment/app/FragmentFactory')
	ptr @.tmr.407, ; 407 ('androidx/fragment/app/FragmentHostCallback')
	ptr @.tmr.408, ; 408 ('androidx/fragment/app/FragmentManager')
	ptr @.tmr.409, ; 409 ('androidx/fragment/app/FragmentManager$BackStackEntry')
	ptr @.tmr.410, ; 410 ('androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks')
	ptr @.tmr.411, ; 411 ('androidx/fragment/app/FragmentManager$OnBackStackChangedListener')
	ptr @.tmr.412, ; 412 ('mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor')
	ptr @.tmr.413, ; 413 ('androidx/fragment/app/FragmentTransaction')
	ptr @.tmr.414, ; 414 ('androidx/fragment/app/FragmentOnAttachListener')
	ptr @.tmr.415, ; 415 ('mono/androidx/fragment/app/FragmentOnAttachListenerImplementor')
	ptr @.tmr.416, ; 416 ('androidx/fragment/app/FragmentResultListener')
	ptr @.tmr.417, ; 417 ('androidx/fragment/app/strictmode/FragmentStrictMode')
	ptr @.tmr.418, ; 418 ('androidx/fragment/app/strictmode/FragmentStrictMode$Policy')
	ptr @.tmr.419, ; 419 ('androidx/fragment/app/strictmode/Violation')
	ptr @.tmr.420, ; 420 ('androidx/window/layout/WindowMetricsCalculator$Companion')
	ptr @.tmr.421, ; 421 ('mono/internal/androidx/window/layout/WindowMetricsCalculator')
	ptr @.tmr.422, ; 422 ('androidx/window/layout/WindowMetricsCalculator')
	ptr @.tmr.423, ; 423 ('androidx/window/layout/WindowMetricsCalculatorDecorator')
	ptr @.tmr.424, ; 424 ('androidx/window/layout/WindowMetrics')
	ptr @.tmr.425, ; 425 ('kotlin/Function')
	ptr @.tmr.426, ; 426 ('kotlin/reflect/KAnnotatedElement')
	ptr @.tmr.427, ; 427 ('kotlin/reflect/KCallable')
	ptr @.tmr.428, ; 428 ('kotlin/reflect/KClass')
	ptr @.tmr.429, ; 429 ('kotlin/reflect/KClassifier')
	ptr @.tmr.430, ; 430 ('kotlin/reflect/KDeclarationContainer')
	ptr @.tmr.431, ; 431 ('kotlin/reflect/KFunction')
	ptr @.tmr.432, ; 432 ('kotlin/reflect/KParameter$Kind')
	ptr @.tmr.433, ; 433 ('kotlin/reflect/KParameter')
	ptr @.tmr.434, ; 434 ('kotlin/reflect/KType')
	ptr @.tmr.435, ; 435 ('kotlin/reflect/KTypeParameter')
	ptr @.tmr.436, ; 436 ('kotlin/reflect/KTypeProjection')
	ptr @.tmr.437, ; 437 ('kotlin/reflect/KTypeProjection$Companion')
	ptr @.tmr.438, ; 438 ('kotlin/reflect/KVariance')
	ptr @.tmr.439, ; 439 ('kotlin/reflect/KVisibility')
	ptr @.tmr.440, ; 440 ('kotlin/jvm/internal/markers/KMappedMarker')
	ptr @.tmr.441, ; 441 ('kotlin/jvm/functions/Function0')
	ptr @.tmr.442, ; 442 ('kotlin/jvm/functions/Function1')
	ptr @.tmr.443, ; 443 ('kotlin/jvm/functions/Function2')
	ptr @.tmr.444, ; 444 ('kotlin/enums/EnumEntries')
	ptr @.tmr.445, ; 445 ('kotlin/coroutines/Continuation')
	ptr @.tmr.446, ; 446 ('kotlin/coroutines/CoroutineContext$Key')
	ptr @.tmr.447, ; 447 ('kotlin/coroutines/CoroutineContext')
	ptr @.tmr.448, ; 448 ('androidx/lifecycle/ViewModelStoreOwner')
	ptr @.tmr.449, ; 449 ('androidx/lifecycle/ViewModel')
	ptr @.tmr.450, ; 450 ('androidx/lifecycle/ViewModelProvider')
	ptr @.tmr.451, ; 451 ('androidx/lifecycle/ViewModelProvider$Factory$Companion')
	ptr @.tmr.452, ; 452 ('androidx/lifecycle/ViewModelProvider$Factory')
	ptr @.tmr.453, ; 453 ('androidx/lifecycle/ViewModelStore')
	ptr @.tmr.454, ; 454 ('androidx/lifecycle/viewmodel/CreationExtras')
	ptr @.tmr.455, ; 455 ('androidx/lifecycle/viewmodel/CreationExtras$Key')
	ptr @.tmr.456, ; 456 ('androidx/lifecycle/viewmodel/ViewModelInitializer')
	ptr @.tmr.457, ; 457 ('crc6414fb8ed825ee5337/ActionFFmpegSessionCompleteCallback')
	ptr @.tmr.458, ; 458 ('crc6414fb8ed825ee5337/ActionFFprobeSessionCompleteCallback')
	ptr @.tmr.459, ; 459 ('crc6414fb8ed825ee5337/ActionMediaInformationSessionCompleteCallback')
	ptr @.tmr.460, ; 460 ('crc6414fb8ed825ee5337/ActionLogCallback')
	ptr @.tmr.461, ; 461 ('crc6414fb8ed825ee5337/ActionStatisticsCallback')
	ptr @.tmr.462, ; 462 ('com/arthenica/ffmpegkit/FFmpegKit')
	ptr @.tmr.463, ; 463 ('com/arthenica/ffmpegkit/FFmpegKitConfig')
	ptr @.tmr.464, ; 464 ('com/arthenica/ffmpegkit/FFprobeKit')
	ptr @.tmr.465, ; 465 ('com/arthenica/ffmpegkit/MediaInformation')
	ptr @.tmr.466, ; 466 ('com/arthenica/ffmpegkit/StreamInformation')
	ptr @.tmr.467, ; 467 ('com/arthenica/ffmpegkit/Abi')
	ptr @.tmr.468, ; 468 ('com/arthenica/ffmpegkit/AbiDetect')
	ptr @.tmr.469, ; 469 ('com/arthenica/ffmpegkit/AbstractSession')
	ptr @.tmr.470, ; 470 ('com/arthenica/ffmpegkit/AsyncFFmpegExecuteTask')
	ptr @.tmr.471, ; 471 ('com/arthenica/ffmpegkit/AsyncFFprobeExecuteTask')
	ptr @.tmr.472, ; 472 ('com/arthenica/ffmpegkit/AsyncGetMediaInformationTask')
	ptr @.tmr.473, ; 473 ('com/arthenica/ffmpegkit/Chapter')
	ptr @.tmr.474, ; 474 ('com/arthenica/ffmpegkit/DeepLTranslationProvider')
	ptr @.tmr.475, ; 475 ('com/arthenica/ffmpegkit/FFmpegSession')
	ptr @.tmr.476, ; 476 ('com/arthenica/ffmpegkit/FFprobeSession')
	ptr @.tmr.477, ; 477 ('com/arthenica/ffmpegkit/GoogleTranslateProvider')
	ptr @.tmr.478, ; 478 ('com/arthenica/ffmpegkit/FFmpegSessionCompleteCallback')
	ptr @.tmr.479, ; 479 ('com/arthenica/ffmpegkit/FFprobeSessionCompleteCallback')
	ptr @.tmr.480, ; 480 ('com/arthenica/ffmpegkit/LogCallback')
	ptr @.tmr.481, ; 481 ('com/arthenica/ffmpegkit/MediaInformationSessionCompleteCallback')
	ptr @.tmr.482, ; 482 ('com/arthenica/ffmpegkit/Session')
	ptr @.tmr.483, ; 483 ('com/arthenica/ffmpegkit/StatisticsCallback')
	ptr @.tmr.484, ; 484 ('com/arthenica/ffmpegkit/TranslationProvider')
	ptr @.tmr.485, ; 485 ('com/arthenica/ffmpegkit/Level')
	ptr @.tmr.486, ; 486 ('com/arthenica/ffmpegkit/LibreTranslateProvider')
	ptr @.tmr.487, ; 487 ('com/arthenica/ffmpegkit/Log')
	ptr @.tmr.488, ; 488 ('com/arthenica/ffmpegkit/LogRedirectionStrategy')
	ptr @.tmr.489, ; 489 ('com/arthenica/ffmpegkit/MediaInformationJsonParser')
	ptr @.tmr.490, ; 490 ('com/arthenica/ffmpegkit/MediaInformationSession')
	ptr @.tmr.491, ; 491 ('com/arthenica/ffmpegkit/NativeLoader')
	ptr @.tmr.492, ; 492 ('com/arthenica/ffmpegkit/Packages')
	ptr @.tmr.493, ; 493 ('com/arthenica/ffmpegkit/ReturnCode')
	ptr @.tmr.494, ; 494 ('com/arthenica/ffmpegkit/SessionState')
	ptr @.tmr.495, ; 495 ('com/arthenica/ffmpegkit/Signal')
	ptr @.tmr.496, ; 496 ('com/arthenica/ffmpegkit/Statistics')
	ptr @.tmr.497, ; 497 ('com/arthenica/ffmpegkit/WhisperKit')
	ptr @.tmr.498, ; 498 ('androidx/customview/widget/ExploreByTouchHelper')
	ptr @.tmr.499, ; 499 ('crc6431345fe65afe8d98/AndroidDispatcherImpl_IdleHandler')
	ptr @.tmr.500, ; 500 ('crc6431345fe65afe8d98/AvaloniaAccessHelper')
	ptr @.tmr.501, ; 501 ('crc6431345fe65afe8d98/AvaloniaActivity')
	ptr @.tmr.502, ; 502 ('crc6431345fe65afe8d98/AvaloniaActivity_GlobalLayoutListener')
	ptr @.tmr.503, ; 503 ('crc6431345fe65afe8d98/AvaloniaAndroidApplication_1')
	ptr @.tmr.504, ; 504 ('crc6431345fe65afe8d98/AvaloniaMainActivity')
	ptr @.tmr.505, ; 505 ('crc6431345fe65afe8d98/AvaloniaView')
	ptr @.tmr.506, ; 506 ('crc6431345fe65afe8d98/BackPressedCallback')
	ptr @.tmr.507, ; 507 ('crc6431345fe65afe8d98/InvalidationAwareSurfaceView')
	ptr @.tmr.508, ; 508 ('crc641fe58d40b3a958ab/AndroidInsetsManager')
	ptr @.tmr.509, ; 509 ('crc641fe58d40b3a958ab/AndroidPlatformSettings_ConfigurationChangedReceiver')
	ptr @.tmr.510, ; 510 ('crc641fe58d40b3a958ab/AndroidScreens_DisplayListener')
	ptr @.tmr.511, ; 511 ('crc64bd239b21961e24ab/TopLevelImpl_SurfaceViewImpl')
	ptr @.tmr.512, ; 512 ('crc643ec2256bd5ff4bdb/AvaloniaInputConnection')
	ptr @.tmr.513, ; 513 ('[Ljava/lang/Object;')
	ptr @.tmr.514, ; 514 ('[Z')
	ptr @.tmr.515, ; 515 ('[B')
	ptr @.tmr.516, ; 516 ('[C')
	ptr @.tmr.517, ; 517 ('[S')
	ptr @.tmr.518, ; 518 ('[I')
	ptr @.tmr.519, ; 519 ('[J')
	ptr @.tmr.520, ; 520 ('[F')
	ptr @.tmr.521, ; 521 ('[D')
	ptr @.tmr.522, ; 522 ('net/dot/jni/internal/JavaProxyObject')
	ptr @.tmr.523, ; 523 ('net/dot/jni/internal/JavaProxyThrowable')
	ptr @.tmr.524, ; 524 ('net/dot/jni/ManagedPeer')
	ptr @.tmr.525, ; 525 ('kotlinx/coroutines/CoroutineScope')
	ptr @.tmr.526, ; 526 ('kotlinx/coroutines/flow/Flow')
	ptr @.tmr.527, ; 527 ('kotlinx/coroutines/flow/FlowCollector')
	ptr @.tmr.528, ; 528 ('kotlinx/coroutines/flow/SharedFlow')
	ptr @.tmr.529, ; 529 ('kotlinx/coroutines/flow/StateFlow')
	ptr @.tmr.530, ; 530 ('androidx/savedstate/SavedStateRegistry')
	ptr @.tmr.531, ; 531 ('androidx/savedstate/SavedStateRegistry$SavedStateProvider')
	ptr @.tmr.532, ; 532 ('androidx/drawerlayout/widget/DrawerLayout')
	ptr @.tmr.533, ; 533 ('androidx/drawerlayout/widget/DrawerLayout$DrawerListener')
	ptr @.tmr.534, ; 534 ('mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor')
	ptr @.tmr.535, ; 535 ('androidx/activity/BackEventCompat')
	ptr @.tmr.536, ; 536 ('androidx/activity/ComponentActivity')
	ptr @.tmr.537, ; 537 ('androidx/activity/FullyDrawnReporter')
	ptr @.tmr.538, ; 538 ('androidx/activity/OnBackPressedCallback')
	ptr @.tmr.539, ; 539 ('androidx/activity/OnBackPressedDispatcher')
	ptr @.tmr.540, ; 540 ('androidx/activity/result/ActivityResultLauncher')
	ptr @.tmr.541, ; 541 ('androidx/activity/result/ActivityResultRegistry')
	ptr @.tmr.542, ; 542 ('androidx/activity/result/ActivityResultCallback')
	ptr @.tmr.543, ; 543 ('androidx/activity/result/contract/ActivityResultContract')
	ptr @.tmr.544, ; 544 ('androidx/activity/result/contract/ActivityResultContract$SynchronousResult')
	ptr @.tmr.545, ; 545 ('androidx/activity/contextaware/OnContextAvailableListener')
	ptr @.tmr.546 ; 546 ('mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor')
], align 16

; Strings
@.tmr.0 = private unnamed_addr constant [20 x i8] c"org/json/JSONObject\00", align 16
@.tmr.1 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 16
@.tmr.2 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 16
@.tmr.3 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 16
@.tmr.4 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 16
@.tmr.5 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 16
@.tmr.6 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 16
@.tmr.7 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 16
@.tmr.8 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 16
@.tmr.9 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 16
@.tmr.10 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 16
@.tmr.11 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 16
@.tmr.12 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 16
@.tmr.13 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 16
@.tmr.14 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 16
@.tmr.15 = private unnamed_addr constant [25 x i8] c"android/window/BackEvent\00", align 16
@.tmr.16 = private unnamed_addr constant [37 x i8] c"android/window/OnBackInvokedCallback\00", align 16
@.tmr.17 = private unnamed_addr constant [39 x i8] c"android/window/OnBackInvokedDispatcher\00", align 16
@.tmr.18 = private unnamed_addr constant [35 x i8] c"android/provider/DocumentsContract\00", align 16
@.tmr.19 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 16
@.tmr.20 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 16
@.tmr.21 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$Secure\00", align 16
@.tmr.22 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 16
@.tmr.23 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 16
@.tmr.24 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 16
@.tmr.25 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 16
@.tmr.26 = private unnamed_addr constant [27 x i8] c"android/widget/AdapterView\00", align 16
@.tmr.27 = private unnamed_addr constant [50 x i8] c"android/widget/AdapterView$OnItemSelectedListener\00", align 16
@.tmr.28 = private unnamed_addr constant [27 x i8] c"android/widget/FrameLayout\00", align 16
@.tmr.29 = private unnamed_addr constant [36 x i8] c"android/widget/HorizontalScrollView\00", align 16
@.tmr.30 = private unnamed_addr constant [23 x i8] c"android/widget/Adapter\00", align 16
@.tmr.31 = private unnamed_addr constant [30 x i8] c"android/widget/SpinnerAdapter\00", align 16
@.tmr.32 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 16
@.tmr.33 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 16
@.tmr.34 = private unnamed_addr constant [18 x i8] c"android/util/Pair\00", align 16
@.tmr.35 = private unnamed_addr constant [25 x i8] c"android/util/SparseArray\00", align 16
@.tmr.36 = private unnamed_addr constant [30 x i8] c"android/text/ClipboardManager\00", align 16
@.tmr.37 = private unnamed_addr constant [23 x i8] c"android/text/TextUtils\00", align 16
@.tmr.38 = private unnamed_addr constant [34 x i8] c"android/text/style/CharacterStyle\00", align 16
@.tmr.39 = private unnamed_addr constant [33 x i8] c"android/text/style/ClickableSpan\00", align 16
@.tmr.40 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 16
@.tmr.41 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 16
@.tmr.42 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 16
@.tmr.43 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 16
@.tmr.44 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 16
@.tmr.45 = private unnamed_addr constant [30 x i8] c"android/os/CancellationSignal\00", align 16
@.tmr.46 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 16
@.tmr.47 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 16
@.tmr.48 = private unnamed_addr constant [45 x i8] c"android/os/IBinder$FrozenStateChangeCallback\00", align 16
@.tmr.49 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 16
@.tmr.50 = private unnamed_addr constant [30 x i8] c"android/os/Parcelable$Creator\00", align 16
@.tmr.51 = private unnamed_addr constant [22 x i8] c"android/os/Parcelable\00", align 16
@.tmr.52 = private unnamed_addr constant [22 x i8] c"android/os/LocaleList\00", align 16
@.tmr.53 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 16
@.tmr.54 = private unnamed_addr constant [24 x i8] c"android/os/MessageQueue\00", align 16
@.tmr.55 = private unnamed_addr constant [36 x i8] c"android/os/MessageQueue$IdleHandler\00", align 16
@.tmr.56 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 16
@.tmr.57 = private unnamed_addr constant [23 x i8] c"android/os/SystemClock\00", align 16
@.tmr.58 = private unnamed_addr constant [27 x i8] c"android/media/AudioManager\00", align 16
@.tmr.59 = private unnamed_addr constant [27 x i8] c"android/animation/Animator\00", align 16
@.tmr.60 = private unnamed_addr constant [42 x i8] c"android/animation/AnimatorListenerAdapter\00", align 16
@.tmr.61 = private unnamed_addr constant [35 x i8] c"android/animation/TimeInterpolator\00", align 16
@.tmr.62 = private unnamed_addr constant [40 x i8] c"android/view/WindowManager$LayoutParams\00", align 16
@.tmr.63 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 16
@.tmr.64 = private unnamed_addr constant [40 x i8] c"android/view/View$AccessibilityDelegate\00", align 16
@.tmr.65 = private unnamed_addr constant [36 x i8] c"android/view/View$DragShadowBuilder\00", align 16
@.tmr.66 = private unnamed_addr constant [34 x i8] c"android/view/View$OnClickListener\00", align 16
@.tmr.67 = private unnamed_addr constant [40 x i8] c"android/view/View$OnFocusChangeListener\00", align 16
@.tmr.68 = private unnamed_addr constant [56 x i8] c"mono/android/view/View_OnFocusChangeListenerImplementor\00", align 16
@.tmr.69 = private unnamed_addr constant [25 x i8] c"android/view/InputDevice\00", align 16
@.tmr.70 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 16
@.tmr.71 = private unnamed_addr constant [28 x i8] c"android/view/LayoutInflater\00", align 16
@.tmr.72 = private unnamed_addr constant [25 x i8] c"android/view/MotionEvent\00", align 16
@.tmr.73 = private unnamed_addr constant [30 x i8] c"android/view/ViewTreeObserver\00", align 16
@.tmr.74 = private unnamed_addr constant [53 x i8] c"android/view/ViewTreeObserver$OnGlobalLayoutListener\00", align 16
@.tmr.75 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 16
@.tmr.76 = private unnamed_addr constant [29 x i8] c"android/view/Window$Callback\00", align 16
@.tmr.77 = private unnamed_addr constant [24 x i8] c"android/view/ActionMode\00", align 16
@.tmr.78 = private unnamed_addr constant [33 x i8] c"android/view/ActionMode$Callback\00", align 16
@.tmr.79 = private unnamed_addr constant [28 x i8] c"android/view/ActionProvider\00", align 16
@.tmr.80 = private unnamed_addr constant [25 x i8] c"android/view/ContentInfo\00", align 16
@.tmr.81 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 16
@.tmr.82 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 16
@.tmr.83 = private unnamed_addr constant [41 x i8] c"android/view/ContextMenu$ContextMenuInfo\00", align 16
@.tmr.84 = private unnamed_addr constant [25 x i8] c"android/view/ContextMenu\00", align 16
@.tmr.85 = private unnamed_addr constant [18 x i8] c"android/view/Menu\00", align 16
@.tmr.86 = private unnamed_addr constant [45 x i8] c"android/view/MenuItem$OnActionExpandListener\00", align 16
@.tmr.87 = private unnamed_addr constant [46 x i8] c"android/view/MenuItem$OnMenuItemClickListener\00", align 16
@.tmr.88 = private unnamed_addr constant [22 x i8] c"android/view/MenuItem\00", align 16
@.tmr.89 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 16
@.tmr.90 = private unnamed_addr constant [21 x i8] c"android/view/SubMenu\00", align 16
@.tmr.91 = private unnamed_addr constant [36 x i8] c"android/view/SurfaceHolder$Callback\00", align 16
@.tmr.92 = private unnamed_addr constant [37 x i8] c"android/view/SurfaceHolder$Callback2\00", align 16
@.tmr.93 = private unnamed_addr constant [27 x i8] c"android/view/SurfaceHolder\00", align 16
@.tmr.94 = private unnamed_addr constant [24 x i8] c"android/view/ViewParent\00", align 16
@.tmr.95 = private unnamed_addr constant [45 x i8] c"android/view/WindowInsetsAnimationController\00", align 16
@.tmr.96 = private unnamed_addr constant [50 x i8] c"android/view/WindowInsetsAnimationControlListener\00", align 16
@.tmr.97 = private unnamed_addr constant [36 x i8] c"android/view/WindowInsetsController\00", align 16
@.tmr.98 = private unnamed_addr constant [72 x i8] c"android/view/WindowInsetsController$OnControllableInsetsChangedListener\00", align 16
@.tmr.99 = private unnamed_addr constant [35 x i8] c"android/view/KeyboardShortcutGroup\00", align 16
@.tmr.100 = private unnamed_addr constant [34 x i8] c"android/view/KeyboardShortcutInfo\00", align 16
@.tmr.101 = private unnamed_addr constant [26 x i8] c"android/view/MenuInflater\00", align 16
@.tmr.102 = private unnamed_addr constant [25 x i8] c"android/view/SearchEvent\00", align 16
@.tmr.103 = private unnamed_addr constant [21 x i8] c"android/view/Surface\00", align 16
@.tmr.104 = private unnamed_addr constant [25 x i8] c"android/view/SurfaceView\00", align 16
@.tmr.105 = private unnamed_addr constant [31 x i8] c"android/view/ViewConfiguration\00", align 16
@.tmr.106 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 16
@.tmr.107 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 16
@.tmr.108 = private unnamed_addr constant [42 x i8] c"android/view/ViewGroup$MarginLayoutParams\00", align 16
@.tmr.109 = private unnamed_addr constant [34 x i8] c"android/view/ViewPropertyAnimator\00", align 16
@.tmr.110 = private unnamed_addr constant [27 x i8] c"android/view/ViewStructure\00", align 16
@.tmr.111 = private unnamed_addr constant [26 x i8] c"android/view/WindowInsets\00", align 16
@.tmr.112 = private unnamed_addr constant [35 x i8] c"android/view/WindowInsetsAnimation\00", align 16
@.tmr.113 = private unnamed_addr constant [42 x i8] c"android/view/WindowInsetsAnimation$Bounds\00", align 16
@.tmr.114 = private unnamed_addr constant [50 x i8] c"android/view/contentcapture/ContentCaptureSession\00", align 16
@.tmr.115 = private unnamed_addr constant [33 x i8] c"android/view/autofill/AutofillId\00", align 16
@.tmr.116 = private unnamed_addr constant [33 x i8] c"android/view/animation/Animation\00", align 16
@.tmr.117 = private unnamed_addr constant [36 x i8] c"android/view/animation/Interpolator\00", align 16
@.tmr.118 = private unnamed_addr constant [44 x i8] c"android/view/inputmethod/InputMethodManager\00", align 16
@.tmr.119 = private unnamed_addr constant [40 x i8] c"android/view/inputmethod/CompletionInfo\00", align 16
@.tmr.120 = private unnamed_addr constant [40 x i8] c"android/view/inputmethod/CorrectionInfo\00", align 16
@.tmr.121 = private unnamed_addr constant [36 x i8] c"android/view/inputmethod/EditorInfo\00", align 16
@.tmr.122 = private unnamed_addr constant [39 x i8] c"android/view/inputmethod/ExtractedText\00", align 16
@.tmr.123 = private unnamed_addr constant [46 x i8] c"android/view/inputmethod/ExtractedTextRequest\00", align 16
@.tmr.124 = private unnamed_addr constant [44 x i8] c"android/view/inputmethod/HandwritingGesture\00", align 16
@.tmr.125 = private unnamed_addr constant [41 x i8] c"android/view/inputmethod/InputConnection\00", align 16
@.tmr.126 = private unnamed_addr constant [42 x i8] c"android/view/inputmethod/InputContentInfo\00", align 16
@.tmr.127 = private unnamed_addr constant [55 x i8] c"android/view/inputmethod/PreviewableHandwritingGesture\00", align 16
@.tmr.128 = private unnamed_addr constant [41 x i8] c"android/view/inputmethod/SurroundingText\00", align 16
@.tmr.129 = private unnamed_addr constant [39 x i8] c"android/view/inputmethod/TextAttribute\00", align 16
@.tmr.130 = private unnamed_addr constant [38 x i8] c"android/view/inputmethod/TextSnapshot\00", align 16
@.tmr.131 = private unnamed_addr constant [46 x i8] c"android/view/accessibility/AccessibilityEvent\00", align 16
@.tmr.132 = private unnamed_addr constant [49 x i8] c"android/view/accessibility/AccessibilityNodeInfo\00", align 16
@.tmr.133 = private unnamed_addr constant [68 x i8] c"android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo\00", align 16
@.tmr.134 = private unnamed_addr constant [47 x i8] c"android/view/accessibility/AccessibilityRecord\00", align 16
@.tmr.135 = private unnamed_addr constant [51 x i8] c"android/view/accessibility/AccessibilityWindowInfo\00", align 16
@.tmr.136 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 16
@.tmr.137 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 16
@.tmr.138 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 16
@.tmr.139 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 16
@.tmr.140 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 16
@.tmr.141 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 16
@.tmr.142 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 16
@.tmr.143 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 16
@.tmr.144 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 16
@.tmr.145 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 16
@.tmr.146 = private unnamed_addr constant [40 x i8] c"android/hardware/display/DisplayManager\00", align 16
@.tmr.147 = private unnamed_addr constant [56 x i8] c"android/hardware/display/DisplayManager$DisplayListener\00", align 16
@.tmr.148 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 16
@.tmr.149 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 16
@.tmr.150 = private unnamed_addr constant [27 x i8] c"android/graphics/BlendMode\00", align 16
@.tmr.151 = private unnamed_addr constant [29 x i8] c"android/graphics/ColorFilter\00", align 16
@.tmr.152 = private unnamed_addr constant [24 x i8] c"android/graphics/Insets\00", align 16
@.tmr.153 = private unnamed_addr constant [24 x i8] c"android/graphics/Matrix\00", align 16
@.tmr.154 = private unnamed_addr constant [23 x i8] c"android/graphics/Paint\00", align 16
@.tmr.155 = private unnamed_addr constant [22 x i8] c"android/graphics/Path\00", align 16
@.tmr.156 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 16
@.tmr.157 = private unnamed_addr constant [28 x i8] c"android/graphics/PorterDuff\00", align 16
@.tmr.158 = private unnamed_addr constant [33 x i8] c"android/graphics/PorterDuff$Mode\00", align 16
@.tmr.159 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 16
@.tmr.160 = private unnamed_addr constant [23 x i8] c"android/graphics/RectF\00", align 16
@.tmr.161 = private unnamed_addr constant [24 x i8] c"android/graphics/Region\00", align 16
@.tmr.162 = private unnamed_addr constant [35 x i8] c"android/graphics/drawable/Drawable\00", align 16
@.tmr.163 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/ColorDrawable\00", align 16
@.tmr.164 = private unnamed_addr constant [32 x i8] c"android/content/ContentProvider\00", align 16
@.tmr.165 = private unnamed_addr constant [30 x i8] c"android/content/ContentValues\00", align 16
@.tmr.166 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 16
@.tmr.167 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 16
@.tmr.168 = private unnamed_addr constant [42 x i8] c"android/content/ActivityNotFoundException\00", align 16
@.tmr.169 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 16
@.tmr.170 = private unnamed_addr constant [33 x i8] c"android/content/ClipboardManager\00", align 16
@.tmr.171 = private unnamed_addr constant [25 x i8] c"android/content/ClipData\00", align 16
@.tmr.172 = private unnamed_addr constant [30 x i8] c"android/content/ClipData$Item\00", align 16
@.tmr.173 = private unnamed_addr constant [32 x i8] c"android/content/ClipDescription\00", align 16
@.tmr.174 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 16
@.tmr.175 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 16
@.tmr.176 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 16
@.tmr.177 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 16
@.tmr.178 = private unnamed_addr constant [29 x i8] c"android/content/IntentSender\00", align 16
@.tmr.179 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 16
@.tmr.180 = private unnamed_addr constant [35 x i8] c"android/content/res/ColorStateList\00", align 16
@.tmr.181 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 16
@.tmr.182 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 16
@.tmr.183 = private unnamed_addr constant [36 x i8] c"android/content/res/Resources$Theme\00", align 16
@.tmr.184 = private unnamed_addr constant [31 x i8] c"android/content/res/TypedArray\00", align 16
@.tmr.185 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 16
@.tmr.186 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 16
@.tmr.187 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 16
@.tmr.188 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 16
@.tmr.189 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 16
@.tmr.190 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 16
@.tmr.191 = private unnamed_addr constant [26 x i8] c"android/app/PendingIntent\00", align 16
@.tmr.192 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 16
@.tmr.193 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 16
@.tmr.194 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 16
@.tmr.195 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 16
@.tmr.196 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.tmr.197 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 16
@.tmr.198 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 16
@.tmr.199 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 16
@.tmr.200 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 16
@.tmr.201 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 16
@.tmr.202 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.tmr.203 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 16
@.tmr.204 = private unnamed_addr constant [18 x i8] c"java/security/Key\00", align 16
@.tmr.205 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 16
@.tmr.206 = private unnamed_addr constant [25 x i8] c"java/security/PrivateKey\00", align 16
@.tmr.207 = private unnamed_addr constant [25 x i8] c"java/security/KeyFactory\00", align 16
@.tmr.208 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 16
@.tmr.209 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 16
@.tmr.210 = private unnamed_addr constant [34 x i8] c"java/security/spec/EncodedKeySpec\00", align 16
@.tmr.211 = private unnamed_addr constant [27 x i8] c"java/security/spec/KeySpec\00", align 16
@.tmr.212 = private unnamed_addr constant [39 x i8] c"java/security/spec/PKCS8EncodedKeySpec\00", align 16
@.tmr.213 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 16
@.tmr.214 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 16
@.tmr.215 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 16
@.tmr.216 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.tmr.217 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 16
@.tmr.218 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 16
@.tmr.219 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 16
@.tmr.220 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 16
@.tmr.221 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 16
@.tmr.222 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 16
@.tmr.223 = private unnamed_addr constant [21 x i8] c"java/io/Serializable\00", align 16
@.tmr.224 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 16
@.tmr.225 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 16
@.tmr.226 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.tmr.227 = private unnamed_addr constant [15 x i8] c"java/util/List\00", align 1
@.tmr.228 = private unnamed_addr constant [15 x i8] c"java/util/Date\00", align 1
@.tmr.229 = private unnamed_addr constant [21 x i8] c"java/util/Comparator\00", align 16
@.tmr.230 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 16
@.tmr.231 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 16
@.tmr.232 = private unnamed_addr constant [23 x i8] c"java/util/ListIterator\00", align 16
@.tmr.233 = private unnamed_addr constant [30 x i8] c"java/util/SequencedCollection\00", align 16
@.tmr.234 = private unnamed_addr constant [22 x i8] c"java/util/Spliterator\00", align 16
@.tmr.235 = private unnamed_addr constant [17 x i8] c"java/util/Locale\00", align 16
@.tmr.236 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 16
@.tmr.237 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 16
@.tmr.238 = private unnamed_addr constant [28 x i8] c"java/util/function/Function\00", align 16
@.tmr.239 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 16
@.tmr.240 = private unnamed_addr constant [31 x i8] c"java/util/function/IntFunction\00", align 16
@.tmr.241 = private unnamed_addr constant [29 x i8] c"java/util/function/Predicate\00", align 16
@.tmr.242 = private unnamed_addr constant [36 x i8] c"java/util/function/ToDoubleFunction\00", align 16
@.tmr.243 = private unnamed_addr constant [33 x i8] c"java/util/function/ToIntFunction\00", align 16
@.tmr.244 = private unnamed_addr constant [34 x i8] c"java/util/function/ToLongFunction\00", align 16
@.tmr.245 = private unnamed_addr constant [33 x i8] c"java/util/function/UnaryOperator\00", align 16
@.tmr.246 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Callable\00", align 16
@.tmr.247 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 16
@.tmr.248 = private unnamed_addr constant [37 x i8] c"java/util/concurrent/ExecutorService\00", align 16
@.tmr.249 = private unnamed_addr constant [28 x i8] c"java/util/concurrent/Future\00", align 16
@.tmr.250 = private unnamed_addr constant [34 x i8] c"java/util/concurrent/Future$State\00", align 16
@.tmr.251 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/TimeUnit\00", align 16
@.tmr.252 = private unnamed_addr constant [39 x i8] c"java/util/concurrent/atomic/AtomicLong\00", align 16
@.tmr.253 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 16
@.tmr.254 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.tmr.255 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 16
@.tmr.256 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 16
@.tmr.257 = private unnamed_addr constant [33 x i8] c"java/lang/ClassNotFoundException\00", align 16
@.tmr.258 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 16
@.tmr.259 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 16
@.tmr.260 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 16
@.tmr.261 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 16
@.tmr.262 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 16
@.tmr.263 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.tmr.264 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 16
@.tmr.265 = private unnamed_addr constant [24 x i8] c"mono/java/lang/Runnable\00", align 16
@.tmr.266 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 16
@.tmr.267 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 16
@.tmr.268 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 16
@.tmr.269 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 16
@.tmr.270 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 16
@.tmr.271 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 16
@.tmr.272 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 16
@.tmr.273 = private unnamed_addr constant [22 x i8] c"java/lang/ClassLoader\00", align 16
@.tmr.274 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.tmr.275 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 16
@.tmr.276 = private unnamed_addr constant [24 x i8] c"java/lang/AutoCloseable\00", align 16
@.tmr.277 = private unnamed_addr constant [19 x i8] c"java/lang/Iterable\00", align 16
@.tmr.278 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 16
@.tmr.279 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 16
@.tmr.280 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 16
@.tmr.281 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 16
@.tmr.282 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 16
@.tmr.283 = private unnamed_addr constant [15 x i8] c"java/lang/Math\00", align 1
@.tmr.284 = private unnamed_addr constant [31 x i8] c"java/lang/NoClassDefFoundError\00", align 16
@.tmr.285 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 16
@.tmr.286 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 16
@.tmr.287 = private unnamed_addr constant [39 x i8] c"java/lang/ReflectiveOperationException\00", align 16
@.tmr.288 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 16
@.tmr.289 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 16
@.tmr.290 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 16
@.tmr.291 = private unnamed_addr constant [32 x i8] c"java/lang/annotation/Annotation\00", align 16
@.tmr.292 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 16
@.tmr.293 = private unnamed_addr constant [28 x i8] c"androidx/core/util/Consumer\00", align 16
@.tmr.294 = private unnamed_addr constant [29 x i8] c"androidx/core/util/Predicate\00", align 16
@.tmr.295 = private unnamed_addr constant [24 x i8] c"androidx/core/util/Pair\00", align 16
@.tmr.296 = private unnamed_addr constant [34 x i8] c"androidx/core/os/LocaleListCompat\00", align 16
@.tmr.297 = private unnamed_addr constant [44 x i8] c"androidx/core/internal/view/SupportMenuItem\00", align 16
@.tmr.298 = private unnamed_addr constant [30 x i8] c"androidx/core/graphics/Insets\00", align 16
@.tmr.299 = private unnamed_addr constant [36 x i8] c"androidx/core/content/ContextCompat\00", align 16
@.tmr.300 = private unnamed_addr constant [35 x i8] c"androidx/core/content/FileProvider\00", align 16
@.tmr.301 = private unnamed_addr constant [40 x i8] c"androidx/core/app/ActivityOptionsCompat\00", align 16
@.tmr.302 = private unnamed_addr constant [36 x i8] c"androidx/core/app/ComponentActivity\00", align 16
@.tmr.303 = private unnamed_addr constant [46 x i8] c"androidx/core/app/ComponentActivity$ExtraData\00", align 16
@.tmr.304 = private unnamed_addr constant [40 x i8] c"androidx/core/app/SharedElementCallback\00", align 16
@.tmr.305 = private unnamed_addr constant [70 x i8] c"androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener\00", align 16
@.tmr.306 = private unnamed_addr constant [35 x i8] c"androidx/core/app/TaskStackBuilder\00", align 16
@.tmr.307 = private unnamed_addr constant [47 x i8] c"androidx/core/view/AccessibilityDelegateCompat\00", align 16
@.tmr.308 = private unnamed_addr constant [34 x i8] c"androidx/core/view/ActionProvider\00", align 16
@.tmr.309 = private unnamed_addr constant [58 x i8] c"androidx/core/view/ActionProvider$SubUiVisibilityListener\00", align 16
@.tmr.310 = private unnamed_addr constant [74 x i8] c"mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor\00", align 16
@.tmr.311 = private unnamed_addr constant [53 x i8] c"androidx/core/view/ActionProvider$VisibilityListener\00", align 16
@.tmr.312 = private unnamed_addr constant [69 x i8] c"mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor\00", align 16
@.tmr.313 = private unnamed_addr constant [37 x i8] c"androidx/core/view/ContentInfoCompat\00", align 16
@.tmr.314 = private unnamed_addr constant [39 x i8] c"androidx/core/view/DisplayCutoutCompat\00", align 16
@.tmr.315 = private unnamed_addr constant [32 x i8] c"androidx/core/view/MenuProvider\00", align 16
@.tmr.316 = private unnamed_addr constant [47 x i8] c"androidx/core/view/OnApplyWindowInsetsListener\00", align 16
@.tmr.317 = private unnamed_addr constant [44 x i8] c"androidx/core/view/OnReceiveContentListener\00", align 16
@.tmr.318 = private unnamed_addr constant [48 x i8] c"androidx/core/view/ViewPropertyAnimatorListener\00", align 16
@.tmr.319 = private unnamed_addr constant [54 x i8] c"androidx/core/view/ViewPropertyAnimatorUpdateListener\00", align 16
@.tmr.320 = private unnamed_addr constant [62 x i8] c"androidx/core/view/WindowInsetsAnimationControlListenerCompat\00", align 16
@.tmr.321 = private unnamed_addr constant [37 x i8] c"androidx/core/view/PointerIconCompat\00", align 16
@.tmr.322 = private unnamed_addr constant [39 x i8] c"androidx/core/view/RoundedCornerCompat\00", align 16
@.tmr.323 = private unnamed_addr constant [30 x i8] c"androidx/core/view/ViewCompat\00", align 16
@.tmr.324 = private unnamed_addr constant [64 x i8] c"androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat\00", align 16
@.tmr.325 = private unnamed_addr constant [46 x i8] c"androidx/core/view/ViewPropertyAnimatorCompat\00", align 16
@.tmr.326 = private unnamed_addr constant [39 x i8] c"androidx/core/view/ViewStructureCompat\00", align 16
@.tmr.327 = private unnamed_addr constant [32 x i8] c"androidx/core/view/WindowCompat\00", align 16
@.tmr.328 = private unnamed_addr constant [47 x i8] c"androidx/core/view/WindowInsetsAnimationCompat\00", align 16
@.tmr.329 = private unnamed_addr constant [60 x i8] c"androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat\00", align 16
@.tmr.330 = private unnamed_addr constant [56 x i8] c"androidx/core/view/WindowInsetsAnimationCompat$Callback\00", align 16
@.tmr.331 = private unnamed_addr constant [57 x i8] c"androidx/core/view/WindowInsetsAnimationControllerCompat\00", align 16
@.tmr.332 = private unnamed_addr constant [38 x i8] c"androidx/core/view/WindowInsetsCompat\00", align 16
@.tmr.333 = private unnamed_addr constant [46 x i8] c"androidx/core/view/WindowInsetsCompat$Builder\00", align 16
@.tmr.334 = private unnamed_addr constant [43 x i8] c"androidx/core/view/WindowInsetsCompat$Type\00", align 16
@.tmr.335 = private unnamed_addr constant [48 x i8] c"androidx/core/view/WindowInsetsControllerCompat\00", align 16
@.tmr.336 = private unnamed_addr constant [84 x i8] c"androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener\00", align 16
@.tmr.337 = private unnamed_addr constant [100 x i8] c"mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor\00", align 16
@.tmr.338 = private unnamed_addr constant [62 x i8] c"androidx/core/view/contentcapture/ContentCaptureSessionCompat\00", align 16
@.tmr.339 = private unnamed_addr constant [45 x i8] c"androidx/core/view/autofill/AutofillIdCompat\00", align 16
@.tmr.340 = private unnamed_addr constant [61 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat\00", align 16
@.tmr.341 = private unnamed_addr constant [87 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat\00", align 16
@.tmr.342 = private unnamed_addr constant [82 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat\00", align 16
@.tmr.343 = private unnamed_addr constant [86 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat\00", align 16
@.tmr.344 = private unnamed_addr constant [77 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat\00", align 16
@.tmr.345 = private unnamed_addr constant [85 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat\00", align 16
@.tmr.346 = private unnamed_addr constant [65 x i8] c"androidx/core/view/accessibility/AccessibilityNodeProviderCompat\00", align 16
@.tmr.347 = private unnamed_addr constant [63 x i8] c"androidx/core/view/accessibility/AccessibilityWindowInfoCompat\00", align 16
@.tmr.348 = private unnamed_addr constant [75 x i8] c"androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments\00", align 16
@.tmr.349 = private unnamed_addr constant [58 x i8] c"androidx/core/view/accessibility/AccessibilityViewCommand\00", align 16
@.tmr.350 = private unnamed_addr constant [28 x i8] c"androidx/lifecycle/Observer\00", align 16
@.tmr.351 = private unnamed_addr constant [28 x i8] c"androidx/lifecycle/LiveData\00", align 16
@.tmr.352 = private unnamed_addr constant [29 x i8] c"androidx/lifecycle/Lifecycle\00", align 16
@.tmr.353 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/Lifecycle$State\00", align 16
@.tmr.354 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/AtomicReference\00", align 16
@.tmr.355 = private unnamed_addr constant [37 x i8] c"androidx/lifecycle/LifecycleObserver\00", align 16
@.tmr.356 = private unnamed_addr constant [34 x i8] c"androidx/lifecycle/LifecycleOwner\00", align 16
@.tmr.357 = private unnamed_addr constant [57 x i8] c"androidx/appcompat/graphics/drawable/DrawerArrowDrawable\00", align 16
@.tmr.358 = private unnamed_addr constant [34 x i8] c"androidx/appcompat/widget/Toolbar\00", align 16
@.tmr.359 = private unnamed_addr constant [67 x i8] c"androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher\00", align 16
@.tmr.360 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/widget/Toolbar$OnMenuItemClickListener\00", align 16
@.tmr.361 = private unnamed_addr constant [74 x i8] c"mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor\00", align 16
@.tmr.362 = private unnamed_addr constant [39 x i8] c"androidx/appcompat/widget/DecorToolbar\00", align 16
@.tmr.363 = private unnamed_addr constant [52 x i8] c"androidx/appcompat/widget/ScrollingTabContainerView\00", align 16
@.tmr.364 = private unnamed_addr constant [75 x i8] c"androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener\00", align 16
@.tmr.365 = private unnamed_addr constant [33 x i8] c"androidx/appcompat/app/ActionBar\00", align 16
@.tmr.366 = private unnamed_addr constant [46 x i8] c"androidx/appcompat/app/ActionBar$LayoutParams\00", align 16
@.tmr.367 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/app/ActionBar$OnMenuVisibilityListener\00", align 16
@.tmr.368 = private unnamed_addr constant [74 x i8] c"mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor\00", align 16
@.tmr.369 = private unnamed_addr constant [54 x i8] c"androidx/appcompat/app/ActionBar$OnNavigationListener\00", align 16
@.tmr.370 = private unnamed_addr constant [37 x i8] c"androidx/appcompat/app/ActionBar$Tab\00", align 16
@.tmr.371 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/app/ActionBar$TabListener\00", align 16
@.tmr.372 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/app/ActionBarDrawerToggle\00", align 16
@.tmr.373 = private unnamed_addr constant [54 x i8] c"androidx/appcompat/app/ActionBarDrawerToggle$Delegate\00", align 16
@.tmr.374 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatActivity\00", align 16
@.tmr.375 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatDelegate\00", align 16
@.tmr.376 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatCallback\00", align 16
@.tmr.377 = private unnamed_addr constant [35 x i8] c"androidx/appcompat/view/ActionMode\00", align 16
@.tmr.378 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/view/ActionMode$Callback\00", align 16
@.tmr.379 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/view/menu/MenuBuilder\00", align 16
@.tmr.380 = private unnamed_addr constant [50 x i8] c"androidx/appcompat/view/menu/MenuBuilder$Callback\00", align 16
@.tmr.381 = private unnamed_addr constant [52 x i8] c"androidx/appcompat/view/menu/MenuPresenter$Callback\00", align 16
@.tmr.382 = private unnamed_addr constant [43 x i8] c"androidx/appcompat/view/menu/MenuPresenter\00", align 16
@.tmr.383 = private unnamed_addr constant [38 x i8] c"androidx/appcompat/view/menu/MenuView\00", align 16
@.tmr.384 = private unnamed_addr constant [42 x i8] c"androidx/appcompat/view/menu/MenuItemImpl\00", align 16
@.tmr.385 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/view/menu/SubMenuBuilder\00", align 16
@.tmr.386 = private unnamed_addr constant [35 x i8] c"crc646f32ce3c20719675/MainActivity\00", align 16
@.tmr.387 = private unnamed_addr constant [38 x i8] c"crc646f32ce3c20719675/MainApplication\00", align 16
@.tmr.388 = private unnamed_addr constant [49 x i8] c"androidx/navigationevent/OnBackCompletedFallback\00", align 16
@.tmr.389 = private unnamed_addr constant [41 x i8] c"androidx/navigationevent/NavigationEvent\00", align 16
@.tmr.390 = private unnamed_addr constant [51 x i8] c"androidx/navigationevent/NavigationEventDispatcher\00", align 16
@.tmr.391 = private unnamed_addr constant [48 x i8] c"androidx/navigationevent/NavigationEventHandler\00", align 16
@.tmr.392 = private unnamed_addr constant [48 x i8] c"androidx/navigationevent/NavigationEventHistory\00", align 16
@.tmr.393 = private unnamed_addr constant [45 x i8] c"androidx/navigationevent/NavigationEventInfo\00", align 16
@.tmr.394 = private unnamed_addr constant [46 x i8] c"androidx/navigationevent/NavigationEventInput\00", align 16
@.tmr.395 = private unnamed_addr constant [56 x i8] c"androidx/navigationevent/NavigationEventTransitionState\00", align 16
@.tmr.396 = private unnamed_addr constant [31 x i8] c"androidx/loader/content/Loader\00", align 16
@.tmr.397 = private unnamed_addr constant [54 x i8] c"androidx/loader/content/Loader$OnLoadCanceledListener\00", align 16
@.tmr.398 = private unnamed_addr constant [54 x i8] c"androidx/loader/content/Loader$OnLoadCompleteListener\00", align 16
@.tmr.399 = private unnamed_addr constant [34 x i8] c"androidx/loader/app/LoaderManager\00", align 16
@.tmr.400 = private unnamed_addr constant [50 x i8] c"androidx/loader/app/LoaderManager$LoaderCallbacks\00", align 16
@.tmr.401 = private unnamed_addr constant [39 x i8] c"androidx/fragment/app/FragmentActivity\00", align 16
@.tmr.402 = private unnamed_addr constant [31 x i8] c"androidx/fragment/app/Fragment\00", align 16
@.tmr.403 = private unnamed_addr constant [42 x i8] c"androidx/fragment/app/Fragment$SavedState\00", align 16
@.tmr.404 = private unnamed_addr constant [40 x i8] c"androidx/fragment/app/FragmentContainer\00", align 16
@.tmr.405 = private unnamed_addr constant [44 x i8] c"androidx/fragment/app/FragmentContainerView\00", align 16
@.tmr.406 = private unnamed_addr constant [38 x i8] c"androidx/fragment/app/FragmentFactory\00", align 16
@.tmr.407 = private unnamed_addr constant [43 x i8] c"androidx/fragment/app/FragmentHostCallback\00", align 16
@.tmr.408 = private unnamed_addr constant [38 x i8] c"androidx/fragment/app/FragmentManager\00", align 16
@.tmr.409 = private unnamed_addr constant [53 x i8] c"androidx/fragment/app/FragmentManager$BackStackEntry\00", align 16
@.tmr.410 = private unnamed_addr constant [65 x i8] c"androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks\00", align 16
@.tmr.411 = private unnamed_addr constant [65 x i8] c"androidx/fragment/app/FragmentManager$OnBackStackChangedListener\00", align 16
@.tmr.412 = private unnamed_addr constant [81 x i8] c"mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor\00", align 16
@.tmr.413 = private unnamed_addr constant [42 x i8] c"androidx/fragment/app/FragmentTransaction\00", align 16
@.tmr.414 = private unnamed_addr constant [47 x i8] c"androidx/fragment/app/FragmentOnAttachListener\00", align 16
@.tmr.415 = private unnamed_addr constant [63 x i8] c"mono/androidx/fragment/app/FragmentOnAttachListenerImplementor\00", align 16
@.tmr.416 = private unnamed_addr constant [45 x i8] c"androidx/fragment/app/FragmentResultListener\00", align 16
@.tmr.417 = private unnamed_addr constant [52 x i8] c"androidx/fragment/app/strictmode/FragmentStrictMode\00", align 16
@.tmr.418 = private unnamed_addr constant [59 x i8] c"androidx/fragment/app/strictmode/FragmentStrictMode$Policy\00", align 16
@.tmr.419 = private unnamed_addr constant [43 x i8] c"androidx/fragment/app/strictmode/Violation\00", align 16
@.tmr.420 = private unnamed_addr constant [57 x i8] c"androidx/window/layout/WindowMetricsCalculator$Companion\00", align 16
@.tmr.421 = private unnamed_addr constant [61 x i8] c"mono/internal/androidx/window/layout/WindowMetricsCalculator\00", align 16
@.tmr.422 = private unnamed_addr constant [47 x i8] c"androidx/window/layout/WindowMetricsCalculator\00", align 16
@.tmr.423 = private unnamed_addr constant [56 x i8] c"androidx/window/layout/WindowMetricsCalculatorDecorator\00", align 16
@.tmr.424 = private unnamed_addr constant [37 x i8] c"androidx/window/layout/WindowMetrics\00", align 16
@.tmr.425 = private unnamed_addr constant [16 x i8] c"kotlin/Function\00", align 16
@.tmr.426 = private unnamed_addr constant [33 x i8] c"kotlin/reflect/KAnnotatedElement\00", align 16
@.tmr.427 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KCallable\00", align 16
@.tmr.428 = private unnamed_addr constant [22 x i8] c"kotlin/reflect/KClass\00", align 16
@.tmr.429 = private unnamed_addr constant [27 x i8] c"kotlin/reflect/KClassifier\00", align 16
@.tmr.430 = private unnamed_addr constant [37 x i8] c"kotlin/reflect/KDeclarationContainer\00", align 16
@.tmr.431 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KFunction\00", align 16
@.tmr.432 = private unnamed_addr constant [31 x i8] c"kotlin/reflect/KParameter$Kind\00", align 16
@.tmr.433 = private unnamed_addr constant [26 x i8] c"kotlin/reflect/KParameter\00", align 16
@.tmr.434 = private unnamed_addr constant [21 x i8] c"kotlin/reflect/KType\00", align 16
@.tmr.435 = private unnamed_addr constant [30 x i8] c"kotlin/reflect/KTypeParameter\00", align 16
@.tmr.436 = private unnamed_addr constant [31 x i8] c"kotlin/reflect/KTypeProjection\00", align 16
@.tmr.437 = private unnamed_addr constant [41 x i8] c"kotlin/reflect/KTypeProjection$Companion\00", align 16
@.tmr.438 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KVariance\00", align 16
@.tmr.439 = private unnamed_addr constant [27 x i8] c"kotlin/reflect/KVisibility\00", align 16
@.tmr.440 = private unnamed_addr constant [42 x i8] c"kotlin/jvm/internal/markers/KMappedMarker\00", align 16
@.tmr.441 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function0\00", align 16
@.tmr.442 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function1\00", align 16
@.tmr.443 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function2\00", align 16
@.tmr.444 = private unnamed_addr constant [25 x i8] c"kotlin/enums/EnumEntries\00", align 16
@.tmr.445 = private unnamed_addr constant [31 x i8] c"kotlin/coroutines/Continuation\00", align 16
@.tmr.446 = private unnamed_addr constant [39 x i8] c"kotlin/coroutines/CoroutineContext$Key\00", align 16
@.tmr.447 = private unnamed_addr constant [35 x i8] c"kotlin/coroutines/CoroutineContext\00", align 16
@.tmr.448 = private unnamed_addr constant [39 x i8] c"androidx/lifecycle/ViewModelStoreOwner\00", align 16
@.tmr.449 = private unnamed_addr constant [29 x i8] c"androidx/lifecycle/ViewModel\00", align 16
@.tmr.450 = private unnamed_addr constant [37 x i8] c"androidx/lifecycle/ViewModelProvider\00", align 16
@.tmr.451 = private unnamed_addr constant [55 x i8] c"androidx/lifecycle/ViewModelProvider$Factory$Companion\00", align 16
@.tmr.452 = private unnamed_addr constant [45 x i8] c"androidx/lifecycle/ViewModelProvider$Factory\00", align 16
@.tmr.453 = private unnamed_addr constant [34 x i8] c"androidx/lifecycle/ViewModelStore\00", align 16
@.tmr.454 = private unnamed_addr constant [44 x i8] c"androidx/lifecycle/viewmodel/CreationExtras\00", align 16
@.tmr.455 = private unnamed_addr constant [48 x i8] c"androidx/lifecycle/viewmodel/CreationExtras$Key\00", align 16
@.tmr.456 = private unnamed_addr constant [50 x i8] c"androidx/lifecycle/viewmodel/ViewModelInitializer\00", align 16
@.tmr.457 = private unnamed_addr constant [58 x i8] c"crc6414fb8ed825ee5337/ActionFFmpegSessionCompleteCallback\00", align 16
@.tmr.458 = private unnamed_addr constant [59 x i8] c"crc6414fb8ed825ee5337/ActionFFprobeSessionCompleteCallback\00", align 16
@.tmr.459 = private unnamed_addr constant [68 x i8] c"crc6414fb8ed825ee5337/ActionMediaInformationSessionCompleteCallback\00", align 16
@.tmr.460 = private unnamed_addr constant [40 x i8] c"crc6414fb8ed825ee5337/ActionLogCallback\00", align 16
@.tmr.461 = private unnamed_addr constant [47 x i8] c"crc6414fb8ed825ee5337/ActionStatisticsCallback\00", align 16
@.tmr.462 = private unnamed_addr constant [34 x i8] c"com/arthenica/ffmpegkit/FFmpegKit\00", align 16
@.tmr.463 = private unnamed_addr constant [40 x i8] c"com/arthenica/ffmpegkit/FFmpegKitConfig\00", align 16
@.tmr.464 = private unnamed_addr constant [35 x i8] c"com/arthenica/ffmpegkit/FFprobeKit\00", align 16
@.tmr.465 = private unnamed_addr constant [41 x i8] c"com/arthenica/ffmpegkit/MediaInformation\00", align 16
@.tmr.466 = private unnamed_addr constant [42 x i8] c"com/arthenica/ffmpegkit/StreamInformation\00", align 16
@.tmr.467 = private unnamed_addr constant [28 x i8] c"com/arthenica/ffmpegkit/Abi\00", align 16
@.tmr.468 = private unnamed_addr constant [34 x i8] c"com/arthenica/ffmpegkit/AbiDetect\00", align 16
@.tmr.469 = private unnamed_addr constant [40 x i8] c"com/arthenica/ffmpegkit/AbstractSession\00", align 16
@.tmr.470 = private unnamed_addr constant [47 x i8] c"com/arthenica/ffmpegkit/AsyncFFmpegExecuteTask\00", align 16
@.tmr.471 = private unnamed_addr constant [48 x i8] c"com/arthenica/ffmpegkit/AsyncFFprobeExecuteTask\00", align 16
@.tmr.472 = private unnamed_addr constant [53 x i8] c"com/arthenica/ffmpegkit/AsyncGetMediaInformationTask\00", align 16
@.tmr.473 = private unnamed_addr constant [32 x i8] c"com/arthenica/ffmpegkit/Chapter\00", align 16
@.tmr.474 = private unnamed_addr constant [49 x i8] c"com/arthenica/ffmpegkit/DeepLTranslationProvider\00", align 16
@.tmr.475 = private unnamed_addr constant [38 x i8] c"com/arthenica/ffmpegkit/FFmpegSession\00", align 16
@.tmr.476 = private unnamed_addr constant [39 x i8] c"com/arthenica/ffmpegkit/FFprobeSession\00", align 16
@.tmr.477 = private unnamed_addr constant [48 x i8] c"com/arthenica/ffmpegkit/GoogleTranslateProvider\00", align 16
@.tmr.478 = private unnamed_addr constant [54 x i8] c"com/arthenica/ffmpegkit/FFmpegSessionCompleteCallback\00", align 16
@.tmr.479 = private unnamed_addr constant [55 x i8] c"com/arthenica/ffmpegkit/FFprobeSessionCompleteCallback\00", align 16
@.tmr.480 = private unnamed_addr constant [36 x i8] c"com/arthenica/ffmpegkit/LogCallback\00", align 16
@.tmr.481 = private unnamed_addr constant [64 x i8] c"com/arthenica/ffmpegkit/MediaInformationSessionCompleteCallback\00", align 16
@.tmr.482 = private unnamed_addr constant [32 x i8] c"com/arthenica/ffmpegkit/Session\00", align 16
@.tmr.483 = private unnamed_addr constant [43 x i8] c"com/arthenica/ffmpegkit/StatisticsCallback\00", align 16
@.tmr.484 = private unnamed_addr constant [44 x i8] c"com/arthenica/ffmpegkit/TranslationProvider\00", align 16
@.tmr.485 = private unnamed_addr constant [30 x i8] c"com/arthenica/ffmpegkit/Level\00", align 16
@.tmr.486 = private unnamed_addr constant [47 x i8] c"com/arthenica/ffmpegkit/LibreTranslateProvider\00", align 16
@.tmr.487 = private unnamed_addr constant [28 x i8] c"com/arthenica/ffmpegkit/Log\00", align 16
@.tmr.488 = private unnamed_addr constant [47 x i8] c"com/arthenica/ffmpegkit/LogRedirectionStrategy\00", align 16
@.tmr.489 = private unnamed_addr constant [51 x i8] c"com/arthenica/ffmpegkit/MediaInformationJsonParser\00", align 16
@.tmr.490 = private unnamed_addr constant [48 x i8] c"com/arthenica/ffmpegkit/MediaInformationSession\00", align 16
@.tmr.491 = private unnamed_addr constant [37 x i8] c"com/arthenica/ffmpegkit/NativeLoader\00", align 16
@.tmr.492 = private unnamed_addr constant [33 x i8] c"com/arthenica/ffmpegkit/Packages\00", align 16
@.tmr.493 = private unnamed_addr constant [35 x i8] c"com/arthenica/ffmpegkit/ReturnCode\00", align 16
@.tmr.494 = private unnamed_addr constant [37 x i8] c"com/arthenica/ffmpegkit/SessionState\00", align 16
@.tmr.495 = private unnamed_addr constant [31 x i8] c"com/arthenica/ffmpegkit/Signal\00", align 16
@.tmr.496 = private unnamed_addr constant [35 x i8] c"com/arthenica/ffmpegkit/Statistics\00", align 16
@.tmr.497 = private unnamed_addr constant [35 x i8] c"com/arthenica/ffmpegkit/WhisperKit\00", align 16
@.tmr.498 = private unnamed_addr constant [48 x i8] c"androidx/customview/widget/ExploreByTouchHelper\00", align 16
@.tmr.499 = private unnamed_addr constant [56 x i8] c"crc6431345fe65afe8d98/AndroidDispatcherImpl_IdleHandler\00", align 16
@.tmr.500 = private unnamed_addr constant [43 x i8] c"crc6431345fe65afe8d98/AvaloniaAccessHelper\00", align 16
@.tmr.501 = private unnamed_addr constant [39 x i8] c"crc6431345fe65afe8d98/AvaloniaActivity\00", align 16
@.tmr.502 = private unnamed_addr constant [60 x i8] c"crc6431345fe65afe8d98/AvaloniaActivity_GlobalLayoutListener\00", align 16
@.tmr.503 = private unnamed_addr constant [51 x i8] c"crc6431345fe65afe8d98/AvaloniaAndroidApplication_1\00", align 16
@.tmr.504 = private unnamed_addr constant [43 x i8] c"crc6431345fe65afe8d98/AvaloniaMainActivity\00", align 16
@.tmr.505 = private unnamed_addr constant [35 x i8] c"crc6431345fe65afe8d98/AvaloniaView\00", align 16
@.tmr.506 = private unnamed_addr constant [42 x i8] c"crc6431345fe65afe8d98/BackPressedCallback\00", align 16
@.tmr.507 = private unnamed_addr constant [51 x i8] c"crc6431345fe65afe8d98/InvalidationAwareSurfaceView\00", align 16
@.tmr.508 = private unnamed_addr constant [43 x i8] c"crc641fe58d40b3a958ab/AndroidInsetsManager\00", align 16
@.tmr.509 = private unnamed_addr constant [75 x i8] c"crc641fe58d40b3a958ab/AndroidPlatformSettings_ConfigurationChangedReceiver\00", align 16
@.tmr.510 = private unnamed_addr constant [53 x i8] c"crc641fe58d40b3a958ab/AndroidScreens_DisplayListener\00", align 16
@.tmr.511 = private unnamed_addr constant [51 x i8] c"crc64bd239b21961e24ab/TopLevelImpl_SurfaceViewImpl\00", align 16
@.tmr.512 = private unnamed_addr constant [46 x i8] c"crc643ec2256bd5ff4bdb/AvaloniaInputConnection\00", align 16
@.tmr.513 = private unnamed_addr constant [20 x i8] c"[Ljava/lang/Object;\00", align 16
@.tmr.514 = private unnamed_addr constant [3 x i8] c"[Z\00", align 1
@.tmr.515 = private unnamed_addr constant [3 x i8] c"[B\00", align 1
@.tmr.516 = private unnamed_addr constant [3 x i8] c"[C\00", align 1
@.tmr.517 = private unnamed_addr constant [3 x i8] c"[S\00", align 1
@.tmr.518 = private unnamed_addr constant [3 x i8] c"[I\00", align 1
@.tmr.519 = private unnamed_addr constant [3 x i8] c"[J\00", align 1
@.tmr.520 = private unnamed_addr constant [3 x i8] c"[F\00", align 1
@.tmr.521 = private unnamed_addr constant [3 x i8] c"[D\00", align 1
@.tmr.522 = private unnamed_addr constant [37 x i8] c"net/dot/jni/internal/JavaProxyObject\00", align 16
@.tmr.523 = private unnamed_addr constant [40 x i8] c"net/dot/jni/internal/JavaProxyThrowable\00", align 16
@.tmr.524 = private unnamed_addr constant [24 x i8] c"net/dot/jni/ManagedPeer\00", align 16
@.tmr.525 = private unnamed_addr constant [34 x i8] c"kotlinx/coroutines/CoroutineScope\00", align 16
@.tmr.526 = private unnamed_addr constant [29 x i8] c"kotlinx/coroutines/flow/Flow\00", align 16
@.tmr.527 = private unnamed_addr constant [38 x i8] c"kotlinx/coroutines/flow/FlowCollector\00", align 16
@.tmr.528 = private unnamed_addr constant [35 x i8] c"kotlinx/coroutines/flow/SharedFlow\00", align 16
@.tmr.529 = private unnamed_addr constant [34 x i8] c"kotlinx/coroutines/flow/StateFlow\00", align 16
@.tmr.530 = private unnamed_addr constant [39 x i8] c"androidx/savedstate/SavedStateRegistry\00", align 16
@.tmr.531 = private unnamed_addr constant [58 x i8] c"androidx/savedstate/SavedStateRegistry$SavedStateProvider\00", align 16
@.tmr.532 = private unnamed_addr constant [42 x i8] c"androidx/drawerlayout/widget/DrawerLayout\00", align 16
@.tmr.533 = private unnamed_addr constant [57 x i8] c"androidx/drawerlayout/widget/DrawerLayout$DrawerListener\00", align 16
@.tmr.534 = private unnamed_addr constant [73 x i8] c"mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor\00", align 16
@.tmr.535 = private unnamed_addr constant [34 x i8] c"androidx/activity/BackEventCompat\00", align 16
@.tmr.536 = private unnamed_addr constant [36 x i8] c"androidx/activity/ComponentActivity\00", align 16
@.tmr.537 = private unnamed_addr constant [37 x i8] c"androidx/activity/FullyDrawnReporter\00", align 16
@.tmr.538 = private unnamed_addr constant [40 x i8] c"androidx/activity/OnBackPressedCallback\00", align 16
@.tmr.539 = private unnamed_addr constant [42 x i8] c"androidx/activity/OnBackPressedDispatcher\00", align 16
@.tmr.540 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultLauncher\00", align 16
@.tmr.541 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultRegistry\00", align 16
@.tmr.542 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultCallback\00", align 16
@.tmr.543 = private unnamed_addr constant [57 x i8] c"androidx/activity/result/contract/ActivityResultContract\00", align 16
@.tmr.544 = private unnamed_addr constant [75 x i8] c"androidx/activity/result/contract/ActivityResultContract$SynchronousResult\00", align 16
@.tmr.545 = private unnamed_addr constant [58 x i8] c"androidx/activity/contextaware/OnContextAvailableListener\00", align 16
@.tmr.546 = private unnamed_addr constant [74 x i8] c"mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor\00", align 16

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.AndroidX.Core\00", align 16
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [41 x i8] c"Xamarin.AndroidX.Lifecycle.LiveData.Core\00", align 16
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [38 x i8] c"Xamarin.AndroidX.Lifecycle.Common.Jvm\00", align 16
@.TypeMapModule.3_assembly_name = private unnamed_addr constant [27 x i8] c"Xamarin.AndroidX.AppCompat\00", align 16
@.TypeMapModule.4_assembly_name = private unnamed_addr constant [15 x i8] c"Bulkut.Android\00", align 1
@.TypeMapModule.5_assembly_name = private unnamed_addr constant [41 x i8] c"Xamarin.AndroidX.NavigationEvent.Android\00", align 16
@.TypeMapModule.6_assembly_name = private unnamed_addr constant [24 x i8] c"Xamarin.AndroidX.Loader\00", align 16
@.TypeMapModule.7_assembly_name = private unnamed_addr constant [26 x i8] c"Xamarin.AndroidX.Fragment\00", align 16
@.TypeMapModule.8_assembly_name = private unnamed_addr constant [24 x i8] c"Xamarin.AndroidX.Window\00", align 16
@.TypeMapModule.9_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.Kotlin.StdLib\00", align 16
@.TypeMapModule.10_assembly_name = private unnamed_addr constant [45 x i8] c"Xamarin.AndroidX.Lifecycle.ViewModel.Android\00", align 16
@.TypeMapModule.11_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.12_assembly_name = private unnamed_addr constant [30 x i8] c"FFmpegKit.Net.FullGpl.Android\00", align 16
@.TypeMapModule.13_assembly_name = private unnamed_addr constant [28 x i8] c"Xamarin.AndroidX.CustomView\00", align 16
@.TypeMapModule.14_assembly_name = private unnamed_addr constant [17 x i8] c"Avalonia.Android\00", align 16
@.TypeMapModule.15_assembly_name = private unnamed_addr constant [13 x i8] c"Java.Interop\00", align 1
@.TypeMapModule.16_assembly_name = private unnamed_addr constant [36 x i8] c"Xamarin.KotlinX.Coroutines.Core.Jvm\00", align 16
@.TypeMapModule.17_assembly_name = private unnamed_addr constant [47 x i8] c"Xamarin.AndroidX.SavedState.SavedState.Android\00", align 16
@.TypeMapModule.18_assembly_name = private unnamed_addr constant [30 x i8] c"Xamarin.AndroidX.DrawerLayout\00", align 16
@.TypeMapModule.19_assembly_name = private unnamed_addr constant [26 x i8] c"Xamarin.AndroidX.Activity\00", align 16

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
