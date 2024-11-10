; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [341 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [676 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 260
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 294
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 336
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 198
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 278
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 278
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 298
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 154081985, ; 20: Porcupine => 0x92f1ac1 => 210
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 234
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 280
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 333
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 334
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 232
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 254
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 237
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 256
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 253
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 305
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 333
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 223
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 318
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 255
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 317
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 56: _Microsoft.Android.Resource.Designer => 0x17969339 => 337
	i32 403441872, ; 57: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 58: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 329
	i32 441335492, ; 59: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 238
	i32 442565967, ; 60: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 61: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 251
	i32 451504562, ; 62: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 455991615, ; 63: MySql.EntityFrameworkCore => 0x1b2de13f => 200
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 67: System.dll => 0x1bff388e => 164
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 253
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 266
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 316
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 310
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 192
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 298
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 188
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 291
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 289
	i32 577335427, ; 84: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 85: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 324
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 618636221, ; 89: K4os.Compression.LZ4.Streams => 0x24dfa3bd => 177
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 243
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 322
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 249
	i32 643868501, ; 93: System.Net => 0x2660a755 => 81
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 285
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 230
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 99: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 304
	i32 690569205, ; 100: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 101: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 300
	i32 693804605, ; 102: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 103: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 104: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 295
	i32 700358131, ; 105: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 106: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 319
	i32 709557578, ; 107: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 307
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 299
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 729848943, ; 110: Vosk => 0x2b809c6f => 218
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 220
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 328
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 191
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 244
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 258
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 271
	i32 855710104, ; 127: Vosk.dll => 0x33011998 => 218
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 131: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 133: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 331
	i32 928116545, ; 134: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 294
	i32 952186615, ; 135: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 299
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 292
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 255
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 983077409, ; 141: MySql.Data.dll => 0x3a989221 => 199
	i32 986514023, ; 142: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 143: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 144: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 145: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 146: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 147: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 275
	i32 1019214401, ; 148: System.Drawing => 0x3cbffa41 => 36
	i32 1021492894, ; 149: OpenTK.Windowing.Common => 0x3ce2be9e => 207
	i32 1028951442, ; 150: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 187
	i32 1029334545, ; 151: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 306
	i32 1031528504, ; 152: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 293
	i32 1035644815, ; 153: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 228
	i32 1036536393, ; 154: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 155: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 262
	i32 1062299426, ; 157: OpenTK.Core => 0x3f516722 => 202
	i32 1067306892, ; 158: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 159: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 160: Xamarin.Kotlin.StdLib => 0x409e66d8 => 296
	i32 1089913930, ; 161: System.Diagnostics.EventLog.dll => 0x40f6c44a => 213
	i32 1098259244, ; 162: System => 0x41761b2c => 164
	i32 1118262833, ; 163: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 319
	i32 1121599056, ; 164: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 261
	i32 1127624469, ; 165: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 190
	i32 1145483052, ; 166: System.Windows.Extensions.dll => 0x4446af2c => 217
	i32 1149092582, ; 167: Xamarin.AndroidX.Window => 0x447dc2e6 => 288
	i32 1155567840, ; 168: Q.Dalek.Maui => 0x44e090e0 => 0
	i32 1157931901, ; 169: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 180
	i32 1168523401, ; 170: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 325
	i32 1170634674, ; 171: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 172: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 284
	i32 1178241025, ; 173: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 269
	i32 1187272848, ; 174: PortAudioSharp => 0x46c45890 => 211
	i32 1202000627, ; 175: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 180
	i32 1203215381, ; 176: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 323
	i32 1204270330, ; 177: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 230
	i32 1204575371, ; 178: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 183
	i32 1208641965, ; 179: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 180: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 181: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 321
	i32 1243150071, ; 182: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 289
	i32 1253011324, ; 183: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 184: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 305
	i32 1264511973, ; 185: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 279
	i32 1267360935, ; 186: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 283
	i32 1267887803, ; 187: Q.Dalek.Maui.dll => 0x4b926ebb => 0
	i32 1273260888, ; 188: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 235
	i32 1275534314, ; 189: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 300
	i32 1277345438, ; 190: MySql.EntityFrameworkCore.dll => 0x4c22be9e => 200
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 227
	i32 1289746278, ; 192: OpenTK.Input => 0x4cdff766 => 204
	i32 1293217323, ; 193: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 246
	i32 1309188875, ; 194: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 195: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 288
	i32 1324164729, ; 196: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 197: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 198: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 199: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 335
	i32 1376866003, ; 200: Xamarin.AndroidX.SavedState => 0x52114ed3 => 275
	i32 1379779777, ; 201: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1389744901, ; 202: OpenTK.Mathematics.dll => 0x52d5d305 => 205
	i32 1402170036, ; 203: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 204: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 239
	i32 1408764838, ; 205: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 206: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 207: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 208: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 303
	i32 1434145427, ; 209: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 210: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 292
	i32 1439761251, ; 211: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 212: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 213: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 214: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 215: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 216: es\Microsoft.Maui.Controls.resources => 0x57152abe => 309
	i32 1461234159, ; 217: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 218: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 219: System.IO.Compression.dll => 0x57261233 => 46
	i32 1463400699, ; 220: OpenTK.Windowing.Desktop => 0x5739b8fb => 208
	i32 1469204771, ; 221: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 229
	i32 1470490898, ; 222: Microsoft.Extensions.Primitives => 0x57a5e912 => 192
	i32 1479771757, ; 223: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 224: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 225: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1487250139, ; 226: K4os.Hash.xxHash => 0x58a5a2db => 178
	i32 1490025113, ; 227: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 276
	i32 1493001747, ; 228: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 313
	i32 1514721132, ; 229: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 308
	i32 1536373174, ; 230: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 231: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 232: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 233: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 234: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 328
	i32 1565862583, ; 235: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 236: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 237: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 238: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 239: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 245
	i32 1592978981, ; 240: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 241: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 293
	i32 1601112923, ; 242: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 243: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 244: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 245: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 265
	i32 1622358360, ; 246: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 247: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 287
	i32 1635184631, ; 248: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 249
	i32 1636350590, ; 249: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 242
	i32 1639515021, ; 250: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 251: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 252: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 253: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 254: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 281
	i32 1658251792, ; 255: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 290
	i32 1670060433, ; 256: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 237
	i32 1675553242, ; 257: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 258: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 259: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 260: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 261: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 179
	i32 1691477237, ; 262: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 263: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 264: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 297
	i32 1701541528, ; 265: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 266: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 258
	i32 1726116996, ; 267: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 268: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 269: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 233
	i32 1736233607, ; 270: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 326
	i32 1743415430, ; 271: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 304
	i32 1744735666, ; 272: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 273: System.IO.Pipelines.dll => 0x68139a0d => 214
	i32 1746316138, ; 274: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 275: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 276: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 277: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 278: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 279: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 280
	i32 1770582343, ; 280: Microsoft.Extensions.Logging.dll => 0x6988f147 => 188
	i32 1776026572, ; 281: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 282: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 283: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 284: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 320
	i32 1788241197, ; 285: Xamarin.AndroidX.Fragment => 0x6a96652d => 251
	i32 1793755602, ; 286: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 312
	i32 1807044528, ; 287: OpenTK.Compute => 0x6bb54fb0 => 201
	i32 1808609942, ; 288: Xamarin.AndroidX.Loader => 0x6bcd3296 => 265
	i32 1813058853, ; 289: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 296
	i32 1813201214, ; 290: Xamarin.Google.Android.Material => 0x6c13413e => 290
	i32 1816086859, ; 291: OpenTK.Core.dll => 0x6c3f494b => 202
	i32 1818569960, ; 292: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 270
	i32 1818787751, ; 293: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 294: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 295: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 296: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 189
	i32 1829150748, ; 297: System.Windows.Extensions => 0x6d06a01c => 217
	i32 1842015223, ; 298: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 332
	i32 1847515442, ; 299: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 220
	i32 1853025655, ; 300: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 329
	i32 1858542181, ; 301: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 302: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 303: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 311
	i32 1879696579, ; 304: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 305: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 231
	i32 1888955245, ; 306: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 307: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 308: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 309: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 310: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1925302748, ; 311: K4os.Compression.LZ4.dll => 0x72c1c9dc => 176
	i32 1939592360, ; 312: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 313: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 314: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 277
	i32 1968388702, ; 315: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 184
	i32 1983156543, ; 316: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 297
	i32 1985761444, ; 317: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 222
	i32 1985821037, ; 318: OpenTK.Windowing.GraphicsLibraryFramework.dll => 0x765d396d => 209
	i32 2003115576, ; 319: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 308
	i32 2011961780, ; 320: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 321: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 262
	i32 2025202353, ; 322: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 303
	i32 2031763787, ; 323: Xamarin.Android.Glide => 0x791a414b => 219
	i32 2045470958, ; 324: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 325: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 257
	i32 2060060697, ; 326: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 327: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 307
	i32 2070888862, ; 328: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 329: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 330: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 331: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 332: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 333: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 334: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 335: Microsoft.Maui => 0x80bd55ad => 196
	i32 2169148018, ; 336: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 315
	i32 2181898931, ; 337: Microsoft.Extensions.Options.dll => 0x820d22b3 => 191
	i32 2192057212, ; 338: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 189
	i32 2193016926, ; 339: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 340: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 301
	i32 2201231467, ; 341: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 342: it\Microsoft.Maui.Controls.resources => 0x839595db => 317
	i32 2217644978, ; 343: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 284
	i32 2222056684, ; 344: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 345: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 266
	i32 2252106437, ; 346: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 347: Microsoft.EntityFrameworkCore => 0x86487ec9 => 179
	i32 2256313426, ; 348: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 349: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 350: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 185
	i32 2267999099, ; 351: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 221
	i32 2270573516, ; 352: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 311
	i32 2279755925, ; 353: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 273
	i32 2293034957, ; 354: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 355: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 356: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 357: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 321
	i32 2305521784, ; 358: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 359: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 225
	i32 2320631194, ; 360: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 361: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 362: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 363: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 364: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 365: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 184
	i32 2378619854, ; 366: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 367: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 368: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 316
	i32 2401565422, ; 369: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 370: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 248
	i32 2405494339, ; 371: OpenTK.Input.dll => 0x8f60ee43 => 204
	i32 2421380589, ; 372: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 373: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 235
	i32 2427813419, ; 374: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 313
	i32 2434599532, ; 375: OpenTK.OpenAL.dll => 0x911d0a6c => 206
	i32 2435356389, ; 376: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 377: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2436523162, ; 378: OpenTK.Graphics => 0x913a649a => 203
	i32 2454642406, ; 379: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 380: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 381: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 382: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 238
	i32 2471841756, ; 383: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 384: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 385: Microsoft.Maui.Controls => 0x93dba8a1 => 194
	i32 2483903535, ; 386: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 387: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2486824558, ; 388: K4os.Hash.xxHash.dll => 0x9439ee6e => 178
	i32 2490993605, ; 389: System.AppContext.dll => 0x94798bc5 => 6
	i32 2498657740, ; 390: BouncyCastle.Cryptography.dll => 0x94ee7dcc => 173
	i32 2501346920, ; 391: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 260
	i32 2509217888, ; 393: System.Diagnostics.EventLog => 0x958fa060 => 213
	i32 2522472828, ; 394: Xamarin.Android.Glide.dll => 0x9659e17c => 219
	i32 2538310050, ; 395: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 396: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 314
	i32 2562349572, ; 397: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 398: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 399: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 261
	i32 2581819634, ; 400: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 283
	i32 2585220780, ; 401: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 402: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 403: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 404: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 323
	i32 2605712449, ; 405: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 301
	i32 2611359322, ; 406: ZstdSharp.dll => 0x9ba62e5a => 302
	i32 2615233544, ; 407: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 252
	i32 2616218305, ; 408: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 190
	i32 2617129537, ; 409: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 410: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 411: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 242
	i32 2624644809, ; 412: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 247
	i32 2626831493, ; 413: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 318
	i32 2627185994, ; 414: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 415: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 416: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 256
	i32 2634653062, ; 417: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 181
	i32 2660759594, ; 418: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 215
	i32 2663391936, ; 419: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 221
	i32 2663698177, ; 420: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 421: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 422: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 423: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 424: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2689060154, ; 425: OpenTK.Compute.dll => 0xa047cd3a => 201
	i32 2693849962, ; 426: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 427: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 281
	i32 2715334215, ; 428: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 429: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 430: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 431: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 432: Xamarin.AndroidX.Activity => 0xa2e0939b => 223
	i32 2735172069, ; 433: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 434: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 229
	i32 2740948882, ; 435: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 436: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 437: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 324
	i32 2758225723, ; 438: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 195
	i32 2764765095, ; 439: Microsoft.Maui.dll => 0xa4caf7a7 => 196
	i32 2765824710, ; 440: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 441: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 295
	i32 2778768386, ; 442: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 286
	i32 2779977773, ; 443: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 274
	i32 2785988530, ; 444: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 330
	i32 2788224221, ; 445: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 252
	i32 2801831435, ; 446: Microsoft.Maui.Graphics => 0xa7008e0b => 198
	i32 2803228030, ; 447: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 448: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 309
	i32 2810250172, ; 449: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 239
	i32 2819470561, ; 450: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 451: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 452: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 274
	i32 2824502124, ; 453: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 454: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 322
	i32 2838993487, ; 455: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 263
	i32 2841355853, ; 456: System.Security.Permissions => 0xa95ba64d => 216
	i32 2847789619, ; 457: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 181
	i32 2849599387, ; 458: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 459: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 286
	i32 2855708567, ; 460: Xamarin.AndroidX.Transition => 0xaa36a797 => 282
	i32 2861098320, ; 461: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 462: Microsoft.Maui.Essentials => 0xaa8a4878 => 197
	i32 2867946736, ; 463: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 215
	i32 2870099610, ; 464: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 224
	i32 2875164099, ; 465: Jsr305Binding.dll => 0xab5f85c3 => 291
	i32 2875220617, ; 466: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 467: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 250
	i32 2887636118, ; 468: System.Net.dll => 0xac1dd496 => 81
	i32 2891569352, ; 469: OpenTK.OpenAL => 0xac59d8c8 => 206
	i32 2899753641, ; 470: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 471: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 472: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 473: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 474: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 475: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 287
	i32 2919462931, ; 476: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 477: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 226
	i32 2926863534, ; 478: OpenTK.Windowing.GraphicsLibraryFramework => 0xae7464ae => 209
	i32 2936416060, ; 479: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 480: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 481: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 482: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 212
	i32 2959614098, ; 483: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 484: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 485: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 486: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 246
	i32 2987532451, ; 487: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 277
	i32 2996846495, ; 488: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 259
	i32 3012788804, ; 489: System.Configuration.ConfigurationManager => 0xb3938244 => 212
	i32 3016983068, ; 490: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 279
	i32 3023353419, ; 491: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 492: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 254
	i32 3025069135, ; 493: K4os.Compression.LZ4.Streams.dll => 0xb44ee44f => 177
	i32 3038032645, ; 494: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 337
	i32 3056245963, ; 495: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 276
	i32 3057625584, ; 496: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 267
	i32 3059408633, ; 497: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 498: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 499: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 182
	i32 3075834255, ; 500: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 501: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 315
	i32 3089219899, ; 502: ZstdSharp => 0xb821c13b => 302
	i32 3090735792, ; 503: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 504: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 505: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 506: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 507: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 508: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 509: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 510: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 511: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 512: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 513: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 514: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 268
	i32 3192346100, ; 515: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 516: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 517: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 182
	i32 3204380047, ; 518: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 519: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 520: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 245
	i32 3213246214, ; 521: System.Security.Permissions.dll => 0xbf863f06 => 216
	i32 3220365878, ; 522: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 523: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3236233999, ; 524: OpenTK.Windowing.Common.dll => 0xc0e5030f => 207
	i32 3251039220, ; 525: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 526: Xamarin.AndroidX.CardView => 0xc235e84d => 233
	i32 3265493905, ; 527: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 528: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3275193541, ; 529: PortAudioSharp.dll => 0xc3377cc5 => 211
	i32 3277815716, ; 530: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 531: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 532: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 533: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 534: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 535: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 536: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 310
	i32 3316684772, ; 537: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 538: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 243
	i32 3317144872, ; 539: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 540: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 231
	i32 3345110828, ; 541: Porcupine.dll => 0xc762572c => 210
	i32 3345895724, ; 542: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 272
	i32 3346324047, ; 543: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 269
	i32 3357674450, ; 544: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 327
	i32 3358260929, ; 545: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 546: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 224
	i32 3362522851, ; 547: Xamarin.AndroidX.Core => 0xc86c06e3 => 240
	i32 3366347497, ; 548: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 549: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 273
	i32 3381016424, ; 550: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 306
	i32 3381033598, ; 551: K4os.Compression.LZ4 => 0xc9867a7e => 176
	i32 3395150330, ; 552: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 553: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 554: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 244
	i32 3428513518, ; 555: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 186
	i32 3429136800, ; 556: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 557: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 558: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 247
	i32 3445260447, ; 559: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 560: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 193
	i32 3463511458, ; 561: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 314
	i32 3467345667, ; 562: MySql.Data => 0xceab7f03 => 199
	i32 3471940407, ; 563: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 564: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 565: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 327
	i32 3484440000, ; 566: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 326
	i32 3485117614, ; 567: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 568: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 569: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 236
	i32 3499097210, ; 570: Google.Protobuf.dll => 0xd08ffc7a => 174
	i32 3509114376, ; 571: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 572: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 573: System.Configuration => 0xd2757232 => 19
	i32 3538837832, ; 574: OpenTK.Windowing.Desktop.dll => 0xd2ee6148 => 208
	i32 3539954161, ; 575: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 576: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 577: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3576570031, ; 578: OpenTK.Graphics.dll => 0xd52e20af => 203
	i32 3580758918, ; 579: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 334
	i32 3597029428, ; 580: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 222
	i32 3598340787, ; 581: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3605570793, ; 582: BouncyCastle.Cryptography => 0xd6e8a4e9 => 173
	i32 3608519521, ; 583: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 584: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 585: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 271
	i32 3633644679, ; 586: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 226
	i32 3638274909, ; 587: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 588: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 257
	i32 3643446276, ; 589: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 331
	i32 3643854240, ; 590: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 268
	i32 3645089577, ; 591: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 592: Google.Protobuf => 0xd94bea07 => 174
	i32 3657292374, ; 593: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 185
	i32 3660523487, ; 594: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 595: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 596: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 232
	i32 3684561358, ; 597: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 236
	i32 3697841164, ; 598: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 336
	i32 3700866549, ; 599: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 600: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 241
	i32 3716563718, ; 601: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 602: Xamarin.AndroidX.Annotation => 0xdda814c6 => 225
	i32 3724971120, ; 603: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 267
	i32 3732100267, ; 604: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 605: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 606: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 607: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 608: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 234
	i32 3792276235, ; 609: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 610: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 193
	i32 3802395368, ; 611: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 612: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 613: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 614: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 615: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 187
	i32 3844307129, ; 616: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 617: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 618: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 619: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 620: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 621: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 622: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 282
	i32 3888767677, ; 623: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 272
	i32 3889960447, ; 624: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 335
	i32 3896106733, ; 625: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 626: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 240
	i32 3901907137, ; 627: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 628: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 629: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 285
	i32 3928044579, ; 630: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 631: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 632: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 270
	i32 3945713374, ; 633: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 634: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 635: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 228
	i32 3959773229, ; 636: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 259
	i32 3960268682, ; 637: OpenTK.Mathematics => 0xec0ce78a => 205
	i32 3980434154, ; 638: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 330
	i32 3987592930, ; 639: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 312
	i32 4003436829, ; 640: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 641: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 227
	i32 4023392905, ; 642: System.IO.Pipelines => 0xefd01a89 => 214
	i32 4025784931, ; 643: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 644: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 195
	i32 4054681211, ; 645: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 646: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 647: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 648: Microsoft.Maui.Essentials.dll => 0xf40add04 => 197
	i32 4099507663, ; 649: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 650: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 651: Xamarin.AndroidX.Emoji2 => 0xf479582c => 248
	i32 4101842092, ; 652: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 183
	i32 4102112229, ; 653: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 325
	i32 4125707920, ; 654: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 320
	i32 4126470640, ; 655: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 186
	i32 4127667938, ; 656: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 657: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 658: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 659: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 332
	i32 4151237749, ; 660: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 661: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 662: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 663: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 664: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 665: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 264
	i32 4185676441, ; 666: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 667: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 668: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 669: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 241
	i32 4258378803, ; 670: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 263
	i32 4260525087, ; 671: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 672: Microsoft.Maui.Controls.dll => 0xfea12dee => 194
	i32 4274976490, ; 673: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 674: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 264
	i32 4294763496 ; 675: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 250
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [676 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 260, ; 3
	i32 294, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 336, ; 9
	i32 124, ; 10
	i32 198, ; 11
	i32 102, ; 12
	i32 278, ; 13
	i32 107, ; 14
	i32 278, ; 15
	i32 139, ; 16
	i32 298, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 210, ; 20
	i32 13, ; 21
	i32 234, ; 22
	i32 132, ; 23
	i32 280, ; 24
	i32 151, ; 25
	i32 333, ; 26
	i32 334, ; 27
	i32 18, ; 28
	i32 232, ; 29
	i32 26, ; 30
	i32 254, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 237, ; 36
	i32 147, ; 37
	i32 256, ; 38
	i32 253, ; 39
	i32 305, ; 40
	i32 54, ; 41
	i32 69, ; 42
	i32 333, ; 43
	i32 223, ; 44
	i32 83, ; 45
	i32 318, ; 46
	i32 255, ; 47
	i32 317, ; 48
	i32 131, ; 49
	i32 55, ; 50
	i32 149, ; 51
	i32 74, ; 52
	i32 145, ; 53
	i32 62, ; 54
	i32 146, ; 55
	i32 337, ; 56
	i32 165, ; 57
	i32 329, ; 58
	i32 238, ; 59
	i32 12, ; 60
	i32 251, ; 61
	i32 125, ; 62
	i32 200, ; 63
	i32 152, ; 64
	i32 113, ; 65
	i32 166, ; 66
	i32 164, ; 67
	i32 253, ; 68
	i32 266, ; 69
	i32 84, ; 70
	i32 316, ; 71
	i32 310, ; 72
	i32 192, ; 73
	i32 150, ; 74
	i32 298, ; 75
	i32 60, ; 76
	i32 188, ; 77
	i32 51, ; 78
	i32 103, ; 79
	i32 114, ; 80
	i32 40, ; 81
	i32 291, ; 82
	i32 289, ; 83
	i32 120, ; 84
	i32 324, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 177, ; 89
	i32 243, ; 90
	i32 322, ; 91
	i32 249, ; 92
	i32 81, ; 93
	i32 136, ; 94
	i32 285, ; 95
	i32 230, ; 96
	i32 8, ; 97
	i32 73, ; 98
	i32 304, ; 99
	i32 155, ; 100
	i32 300, ; 101
	i32 154, ; 102
	i32 92, ; 103
	i32 295, ; 104
	i32 45, ; 105
	i32 319, ; 106
	i32 307, ; 107
	i32 299, ; 108
	i32 109, ; 109
	i32 218, ; 110
	i32 129, ; 111
	i32 25, ; 112
	i32 220, ; 113
	i32 72, ; 114
	i32 55, ; 115
	i32 46, ; 116
	i32 328, ; 117
	i32 191, ; 118
	i32 244, ; 119
	i32 22, ; 120
	i32 258, ; 121
	i32 86, ; 122
	i32 43, ; 123
	i32 160, ; 124
	i32 71, ; 125
	i32 271, ; 126
	i32 218, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 16, ; 131
	i32 53, ; 132
	i32 331, ; 133
	i32 294, ; 134
	i32 105, ; 135
	i32 299, ; 136
	i32 292, ; 137
	i32 255, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 199, ; 141
	i32 85, ; 142
	i32 32, ; 143
	i32 12, ; 144
	i32 51, ; 145
	i32 56, ; 146
	i32 275, ; 147
	i32 36, ; 148
	i32 207, ; 149
	i32 187, ; 150
	i32 306, ; 151
	i32 293, ; 152
	i32 228, ; 153
	i32 35, ; 154
	i32 58, ; 155
	i32 262, ; 156
	i32 202, ; 157
	i32 175, ; 158
	i32 17, ; 159
	i32 296, ; 160
	i32 213, ; 161
	i32 164, ; 162
	i32 319, ; 163
	i32 261, ; 164
	i32 190, ; 165
	i32 217, ; 166
	i32 288, ; 167
	i32 0, ; 168
	i32 180, ; 169
	i32 325, ; 170
	i32 153, ; 171
	i32 284, ; 172
	i32 269, ; 173
	i32 211, ; 174
	i32 180, ; 175
	i32 323, ; 176
	i32 230, ; 177
	i32 183, ; 178
	i32 29, ; 179
	i32 52, ; 180
	i32 321, ; 181
	i32 289, ; 182
	i32 5, ; 183
	i32 305, ; 184
	i32 279, ; 185
	i32 283, ; 186
	i32 0, ; 187
	i32 235, ; 188
	i32 300, ; 189
	i32 200, ; 190
	i32 227, ; 191
	i32 204, ; 192
	i32 246, ; 193
	i32 85, ; 194
	i32 288, ; 195
	i32 61, ; 196
	i32 112, ; 197
	i32 57, ; 198
	i32 335, ; 199
	i32 275, ; 200
	i32 99, ; 201
	i32 205, ; 202
	i32 19, ; 203
	i32 239, ; 204
	i32 111, ; 205
	i32 101, ; 206
	i32 102, ; 207
	i32 303, ; 208
	i32 104, ; 209
	i32 292, ; 210
	i32 71, ; 211
	i32 38, ; 212
	i32 32, ; 213
	i32 103, ; 214
	i32 73, ; 215
	i32 309, ; 216
	i32 9, ; 217
	i32 123, ; 218
	i32 46, ; 219
	i32 208, ; 220
	i32 229, ; 221
	i32 192, ; 222
	i32 9, ; 223
	i32 43, ; 224
	i32 4, ; 225
	i32 178, ; 226
	i32 276, ; 227
	i32 313, ; 228
	i32 308, ; 229
	i32 31, ; 230
	i32 138, ; 231
	i32 92, ; 232
	i32 93, ; 233
	i32 328, ; 234
	i32 49, ; 235
	i32 141, ; 236
	i32 112, ; 237
	i32 140, ; 238
	i32 245, ; 239
	i32 115, ; 240
	i32 293, ; 241
	i32 157, ; 242
	i32 76, ; 243
	i32 79, ; 244
	i32 265, ; 245
	i32 37, ; 246
	i32 287, ; 247
	i32 249, ; 248
	i32 242, ; 249
	i32 64, ; 250
	i32 138, ; 251
	i32 15, ; 252
	i32 116, ; 253
	i32 281, ; 254
	i32 290, ; 255
	i32 237, ; 256
	i32 48, ; 257
	i32 70, ; 258
	i32 80, ; 259
	i32 126, ; 260
	i32 179, ; 261
	i32 94, ; 262
	i32 121, ; 263
	i32 297, ; 264
	i32 26, ; 265
	i32 258, ; 266
	i32 97, ; 267
	i32 28, ; 268
	i32 233, ; 269
	i32 326, ; 270
	i32 304, ; 271
	i32 149, ; 272
	i32 214, ; 273
	i32 169, ; 274
	i32 4, ; 275
	i32 98, ; 276
	i32 33, ; 277
	i32 93, ; 278
	i32 280, ; 279
	i32 188, ; 280
	i32 21, ; 281
	i32 41, ; 282
	i32 170, ; 283
	i32 320, ; 284
	i32 251, ; 285
	i32 312, ; 286
	i32 201, ; 287
	i32 265, ; 288
	i32 296, ; 289
	i32 290, ; 290
	i32 202, ; 291
	i32 270, ; 292
	i32 2, ; 293
	i32 134, ; 294
	i32 111, ; 295
	i32 189, ; 296
	i32 217, ; 297
	i32 332, ; 298
	i32 220, ; 299
	i32 329, ; 300
	i32 58, ; 301
	i32 95, ; 302
	i32 311, ; 303
	i32 39, ; 304
	i32 231, ; 305
	i32 25, ; 306
	i32 94, ; 307
	i32 89, ; 308
	i32 99, ; 309
	i32 10, ; 310
	i32 176, ; 311
	i32 87, ; 312
	i32 100, ; 313
	i32 277, ; 314
	i32 184, ; 315
	i32 297, ; 316
	i32 222, ; 317
	i32 209, ; 318
	i32 308, ; 319
	i32 7, ; 320
	i32 262, ; 321
	i32 303, ; 322
	i32 219, ; 323
	i32 88, ; 324
	i32 257, ; 325
	i32 154, ; 326
	i32 307, ; 327
	i32 33, ; 328
	i32 116, ; 329
	i32 82, ; 330
	i32 20, ; 331
	i32 11, ; 332
	i32 162, ; 333
	i32 3, ; 334
	i32 196, ; 335
	i32 315, ; 336
	i32 191, ; 337
	i32 189, ; 338
	i32 84, ; 339
	i32 301, ; 340
	i32 64, ; 341
	i32 317, ; 342
	i32 284, ; 343
	i32 143, ; 344
	i32 266, ; 345
	i32 157, ; 346
	i32 179, ; 347
	i32 41, ; 348
	i32 117, ; 349
	i32 185, ; 350
	i32 221, ; 351
	i32 311, ; 352
	i32 273, ; 353
	i32 131, ; 354
	i32 75, ; 355
	i32 66, ; 356
	i32 321, ; 357
	i32 172, ; 358
	i32 225, ; 359
	i32 143, ; 360
	i32 106, ; 361
	i32 151, ; 362
	i32 70, ; 363
	i32 156, ; 364
	i32 184, ; 365
	i32 121, ; 366
	i32 127, ; 367
	i32 316, ; 368
	i32 152, ; 369
	i32 248, ; 370
	i32 204, ; 371
	i32 141, ; 372
	i32 235, ; 373
	i32 313, ; 374
	i32 206, ; 375
	i32 20, ; 376
	i32 14, ; 377
	i32 203, ; 378
	i32 135, ; 379
	i32 75, ; 380
	i32 59, ; 381
	i32 238, ; 382
	i32 167, ; 383
	i32 168, ; 384
	i32 194, ; 385
	i32 15, ; 386
	i32 74, ; 387
	i32 178, ; 388
	i32 6, ; 389
	i32 173, ; 390
	i32 23, ; 391
	i32 260, ; 392
	i32 213, ; 393
	i32 219, ; 394
	i32 91, ; 395
	i32 314, ; 396
	i32 1, ; 397
	i32 136, ; 398
	i32 261, ; 399
	i32 283, ; 400
	i32 134, ; 401
	i32 69, ; 402
	i32 146, ; 403
	i32 323, ; 404
	i32 301, ; 405
	i32 302, ; 406
	i32 252, ; 407
	i32 190, ; 408
	i32 88, ; 409
	i32 96, ; 410
	i32 242, ; 411
	i32 247, ; 412
	i32 318, ; 413
	i32 31, ; 414
	i32 45, ; 415
	i32 256, ; 416
	i32 181, ; 417
	i32 215, ; 418
	i32 221, ; 419
	i32 109, ; 420
	i32 158, ; 421
	i32 35, ; 422
	i32 22, ; 423
	i32 114, ; 424
	i32 201, ; 425
	i32 57, ; 426
	i32 281, ; 427
	i32 144, ; 428
	i32 118, ; 429
	i32 120, ; 430
	i32 110, ; 431
	i32 223, ; 432
	i32 139, ; 433
	i32 229, ; 434
	i32 54, ; 435
	i32 105, ; 436
	i32 324, ; 437
	i32 195, ; 438
	i32 196, ; 439
	i32 133, ; 440
	i32 295, ; 441
	i32 286, ; 442
	i32 274, ; 443
	i32 330, ; 444
	i32 252, ; 445
	i32 198, ; 446
	i32 159, ; 447
	i32 309, ; 448
	i32 239, ; 449
	i32 163, ; 450
	i32 132, ; 451
	i32 274, ; 452
	i32 161, ; 453
	i32 322, ; 454
	i32 263, ; 455
	i32 216, ; 456
	i32 181, ; 457
	i32 140, ; 458
	i32 286, ; 459
	i32 282, ; 460
	i32 169, ; 461
	i32 197, ; 462
	i32 215, ; 463
	i32 224, ; 464
	i32 291, ; 465
	i32 40, ; 466
	i32 250, ; 467
	i32 81, ; 468
	i32 206, ; 469
	i32 56, ; 470
	i32 37, ; 471
	i32 97, ; 472
	i32 166, ; 473
	i32 172, ; 474
	i32 287, ; 475
	i32 82, ; 476
	i32 226, ; 477
	i32 209, ; 478
	i32 98, ; 479
	i32 30, ; 480
	i32 159, ; 481
	i32 212, ; 482
	i32 18, ; 483
	i32 127, ; 484
	i32 119, ; 485
	i32 246, ; 486
	i32 277, ; 487
	i32 259, ; 488
	i32 212, ; 489
	i32 279, ; 490
	i32 165, ; 491
	i32 254, ; 492
	i32 177, ; 493
	i32 337, ; 494
	i32 276, ; 495
	i32 267, ; 496
	i32 170, ; 497
	i32 16, ; 498
	i32 182, ; 499
	i32 144, ; 500
	i32 315, ; 501
	i32 302, ; 502
	i32 125, ; 503
	i32 118, ; 504
	i32 38, ; 505
	i32 115, ; 506
	i32 47, ; 507
	i32 142, ; 508
	i32 117, ; 509
	i32 34, ; 510
	i32 175, ; 511
	i32 95, ; 512
	i32 53, ; 513
	i32 268, ; 514
	i32 129, ; 515
	i32 153, ; 516
	i32 182, ; 517
	i32 24, ; 518
	i32 161, ; 519
	i32 245, ; 520
	i32 216, ; 521
	i32 148, ; 522
	i32 104, ; 523
	i32 207, ; 524
	i32 89, ; 525
	i32 233, ; 526
	i32 60, ; 527
	i32 142, ; 528
	i32 211, ; 529
	i32 100, ; 530
	i32 5, ; 531
	i32 13, ; 532
	i32 122, ; 533
	i32 135, ; 534
	i32 28, ; 535
	i32 310, ; 536
	i32 72, ; 537
	i32 243, ; 538
	i32 24, ; 539
	i32 231, ; 540
	i32 210, ; 541
	i32 272, ; 542
	i32 269, ; 543
	i32 327, ; 544
	i32 137, ; 545
	i32 224, ; 546
	i32 240, ; 547
	i32 168, ; 548
	i32 273, ; 549
	i32 306, ; 550
	i32 176, ; 551
	i32 101, ; 552
	i32 123, ; 553
	i32 244, ; 554
	i32 186, ; 555
	i32 163, ; 556
	i32 167, ; 557
	i32 247, ; 558
	i32 39, ; 559
	i32 193, ; 560
	i32 314, ; 561
	i32 199, ; 562
	i32 17, ; 563
	i32 171, ; 564
	i32 327, ; 565
	i32 326, ; 566
	i32 137, ; 567
	i32 150, ; 568
	i32 236, ; 569
	i32 174, ; 570
	i32 155, ; 571
	i32 130, ; 572
	i32 19, ; 573
	i32 208, ; 574
	i32 65, ; 575
	i32 147, ; 576
	i32 47, ; 577
	i32 203, ; 578
	i32 334, ; 579
	i32 222, ; 580
	i32 79, ; 581
	i32 173, ; 582
	i32 61, ; 583
	i32 106, ; 584
	i32 271, ; 585
	i32 226, ; 586
	i32 49, ; 587
	i32 257, ; 588
	i32 331, ; 589
	i32 268, ; 590
	i32 14, ; 591
	i32 174, ; 592
	i32 185, ; 593
	i32 68, ; 594
	i32 171, ; 595
	i32 232, ; 596
	i32 236, ; 597
	i32 336, ; 598
	i32 78, ; 599
	i32 241, ; 600
	i32 108, ; 601
	i32 225, ; 602
	i32 267, ; 603
	i32 67, ; 604
	i32 63, ; 605
	i32 27, ; 606
	i32 160, ; 607
	i32 234, ; 608
	i32 10, ; 609
	i32 193, ; 610
	i32 11, ; 611
	i32 78, ; 612
	i32 126, ; 613
	i32 83, ; 614
	i32 187, ; 615
	i32 66, ; 616
	i32 107, ; 617
	i32 65, ; 618
	i32 128, ; 619
	i32 122, ; 620
	i32 77, ; 621
	i32 282, ; 622
	i32 272, ; 623
	i32 335, ; 624
	i32 8, ; 625
	i32 240, ; 626
	i32 2, ; 627
	i32 44, ; 628
	i32 285, ; 629
	i32 156, ; 630
	i32 128, ; 631
	i32 270, ; 632
	i32 23, ; 633
	i32 133, ; 634
	i32 228, ; 635
	i32 259, ; 636
	i32 205, ; 637
	i32 330, ; 638
	i32 312, ; 639
	i32 29, ; 640
	i32 227, ; 641
	i32 214, ; 642
	i32 62, ; 643
	i32 195, ; 644
	i32 90, ; 645
	i32 87, ; 646
	i32 148, ; 647
	i32 197, ; 648
	i32 36, ; 649
	i32 86, ; 650
	i32 248, ; 651
	i32 183, ; 652
	i32 325, ; 653
	i32 320, ; 654
	i32 186, ; 655
	i32 50, ; 656
	i32 6, ; 657
	i32 90, ; 658
	i32 332, ; 659
	i32 21, ; 660
	i32 162, ; 661
	i32 96, ; 662
	i32 50, ; 663
	i32 113, ; 664
	i32 264, ; 665
	i32 130, ; 666
	i32 76, ; 667
	i32 27, ; 668
	i32 241, ; 669
	i32 263, ; 670
	i32 7, ; 671
	i32 194, ; 672
	i32 110, ; 673
	i32 264, ; 674
	i32 250 ; 675
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
