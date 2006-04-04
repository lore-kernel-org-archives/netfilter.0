From: thierry itty <thierry.itty@besancon.org>
Subject: Re: iptables and patch-o-matic compilation errors with fedora core 4
Date: Tue, 04 Apr 2006 10:13:54 +0200
Message-ID: <44322AC2.7070503@besancon.org>
References: <44169348.7070408@besancon.org>
	<1142344100.2610.3.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1142344100.2610.3.camel@davila.nicaraguaopensource.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: netfilter@lists.netfilter.org

Hello Jorge and all

to make it short, we upgraded the system to the latest fc4 versions
the last fc4 kernel (2.6.15 1833) includes the pptp patch
we could recompile it for the h323 patch
we did not need to recompile iptables
so it's now working

Jorge Davila a =E9crit :

>uhm ... I was fighting with the same problem some weeks ago.
>
>My solution was a vanilla kernel and use gcc 3.3 with iptables 1.3.5.
>This for fc4.
>
>Hope this help.
>
>Jorge.
>
>El mar, 14-03-2006 a las 10:56 +0100, thierry itty escribi=F3:
> =20
>
>>Hello
>>I've an "out-of-the-box" fedora core 4 (standard i686 on either amd or=20
>>pentium)
>>I want to apply gre and pptp patches to netfilter
>>
>>I install the kernel sources and rebuild the binaries :
>>
>>rpm -Uvh kernel-2.6.11-1.1369_FC4.src.rpm
>>rpmbuild -bp --target=3Di686 /usr/src/redhat/SPECS/kernel-2.6.spec
>>cd /usr/src/redhat/BUILD/kernel-2.6.11-1/linux-2.6.11-1
>>cp configs/kernel-2.6.11-1.i686.config ./.config
>>make menuconfig (just to check)
>>make
>>
>>the kernel build ok (with some warnings here and there but nothing=20
>>unusual...)
>>I make it visible :
>>ln -s /usr/src/redhat/BUILD/kernel-2.6.11-1/linux-2.6.11-1 /usr/src/linux
>>
>>I install the iptables sources
>>rpm -Uvh iptables-1.3.0-2.src.rpm
>>rpmbuild -bp --target=3Di686 /usr/src/redhat/SPECS/iptables.spec
>>
>>when i compile
>>cd /usr/src/redhat/BUILD/iptables-1.3.0
>>make
>>
>>I get the following error several times
>>/usr/src/linuc/include/linux/config.h:6:2 error : #error including=20
>>kernel header in userspace; use the glibc headers instead!
>>
>>After googling a while, I see that some people have solved this by just=20
>>removing the test that triggers the error in=20
>>/usr/src/linux/include/linx/config.h (file which is brought by the=20
>>kernel source package installation + prep by the symlink made just=20
>>before, which should thus be "the right one"), this test reads
>>#if !defined (__KERNEL__) && !defined(__KERNGLUE__)
>>#error including kernel header in userspace; use the glibc headers instea=
d!
>>#endif
>>
>>I really don't see where's my error, and I wonder wether this is the=20
>>right way for recompiling FC4 packages...
>>
>>Actually, I do need to do this because we have to handle several pptp=20
>>vpns going throught this machine, and i have to apply pptp and h323=20
>>helpers patches from patch-o-matic
>>
>>If I do as I saw (modify the config.h source to remove the test),=20
>>iptables compiles but we are unable to handle pptp vpns (we were used to =

>>do that with 2.4 kernels and it works fine), modprobe and rmmod go in=20
>>endless loops, and so on...
>>
>>With a little more googling, I saw that userspace applications (iptables =

>>in this case) should not use kernel headers, but glibc ones instead,=20
>>hence the error, and since the 2.6 kernel releases, this looks more like =

>>a mus than a should. So, another solution I found was to remove the=20
>>"-I$(KERNEL_DIR)/include" from iptables' Makefile...
>>
>>Doing so, iptables begins to compile, but stops quickly after a=20
>>"linux/netfilter_ipv4/ipt_CLUSTERIP.h" missing file error
>>I see that the include files iptables uses this way are provided by=20
>>glibc-kernheaders-2.4.-9.1.94, standard version for FC4, but those files =

>>look three years old and obviously recent netfilter stuff isn't present=20
>>within (to say nothing about the remainder), and making compile to abort
>>
>>Some more googling, until I find a post which says that to compile=20
>>iptables without using the kernel headers I have to install=20
>>"linux-libc-headers" that are a brand of userspace kernel headers. Ok,=20
>>let's give it a try : I restore iptables' original makefile (with=20
>>-I$(KERNEL_DIR)/include) and export a KERNEL_DIR environment variable=20
>>set to the directory where I untared linux-libc-headers, and I (after a=20
>>make clean) I start a new make.
>>Fine, iptables compiles successfully
>>
>>But now comes the big question : when I'll apply pptp and h323 patches=20
>>from p-o-m, I can direct KERNEL_DIR to either the true kernel source=20
>>directory or to this new "headers only" directory, but obviously not=20
>>both. So I'll get either the kernel sources patched, which is necessary=20
>>to build a patched kernel, or I'll get the headers patched, which is=20
>>necessary to build iptables, but how will I be able to build both ???
>>
>>So to conclude and make it short, is there anybody out there who has=20
>>successfully applied pptp and h323 patches on an out-of-the-box fedora=20
>>core 4, and how did he do that ?
>>Should I upgrade to a 2.6.15 kernel ? vanilla or fc4 flavour ?
>>
>>many thanks in advance
>>
>>
>>   =20
>>



