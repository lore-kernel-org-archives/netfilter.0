From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Can't use iptables -m string with any RedHat distri
Date: Mon, 2 Jun 2003 17:36:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DCC@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: olivier <netfilter.org@olivier.us>, netfilter@lists.netfilter.org

Oliver, there are two halves to IPTABLES. They are the kernel and the
userspace tools. The userspace tools are called iptables, and the kernel
space tools can be found as patch-o-matic. On the iptables site,
download the latest patch-o-matic and apply it to the kernel sources for
the kernel you are using. You cannot do this with RPMS atm since to the
best of my knowledge, there is no RPM available with these features
built in for Redhat releases.

Here goes:

Download P-O-M, whatever the latest is
Download iptables latest
Download Redhat kernel sources to the kernel you are using now (it is
much easier to download the -i386 version of the sources if you have
that option).

rpm -i kernel-source-<kernelversion>-i386.rpm
cp /boot/config-<kernelversion> /usr/src/linux-<kernelversion>/.config
Edit /usr/src/linux-<kernelversion>/Makefile to change the kernel
version

Extract the POM to its own directory
cd <pomdir>
KERNEL_DIR=3D/usr/src/linux-<kernelversion> ./runme extra
Select the options that you with to install into the kernel. By saying
'y', you install that patch into the kernel sources. The String kernel
patch should be included in this set of patches.

cd /usr/src/linux-<kernelversion>
make menuconfig
Do your business adding Networking -> Netfilter -> Modules into the
netfilter config. I KNOW that modules work, so compile all the patch
added netfilter options as modules.
Make dep; make bzImage; etc...
Install the new kernel

Extract the iptables to its own directory
Use standard make to install things, but postfix LIBDIR, and the other
directory prefixes to match those that Redhat uses.
Install the iptables you just built and run iptables -V to make sure the
version is the one you installed.

Voila! iptables -m string --help

Still no beans?

If you did all the above alright, and you made sure to check string was
in the kernel, I had an issue where iptables makes the module, but does
not install it even though it is made and built. In that case, go to the
extensions directory and copy libipt_string.so into /lib/iptables or
wherever your iptables module directory is.

-----Original Message-----
From: olivier [mailto:netfilter.org@olivier.us]=20
Sent: Monday, June 02, 2003 3:58 PM
To: netfilter@lists.netfilter.org
Subject: Can't use iptables -m string with any RedHat distri

Hello All !


I have been having this problem for quite a while and decided to make a
post
about it.
If you run a RedHat distri, and don't want to compile anything, just
using
RPM (especially if you plan to maintain your server with RHN), you get
this
error trying to use the string matching option:

# iptables -A INPUT -j ACCEPT -m string --string HELLO
iptables v1.x.x: Couldn't load match
`string':/lib/iptables/libipt_string.so: cannot open shared object file:
No
such file or directory

Where is this library ?
# find / -name libipt_string.so
#
Hmmm... Obviously not included in any of the iptables RPMs provided by
redhat.

So I downloaded the matching iptables1.x.x.tar.bz2 from netfilter.org,
and
found the libipt_string.c in there.
With a "make", this library doesn't get compiled...

OK, then I will compile it myself, then:
cc -O2 -Wall -I etc.. etc...

ipt_strings.h not found...

and can't seem to find this file anywhere.. not even in the redhat
kernel
source rpm ....


Anybody has an idea on how to make "iptables --m string" work with
RedHat ?


Thanks All !!!




