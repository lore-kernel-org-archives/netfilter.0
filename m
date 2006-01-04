From: "Pedro Drimel Neto" <pedrodrimel@uol.com.br>
Subject: Re: pom-ng "condition" for 2.6 kernels
Date: Wed, 4 Jan 2006 09:26:39 -0200
Message-ID: <013001c61121$bb439800$2f00a8c0@TRINTASETE>
References: <43B8526C.4040706@arcoscom.com><1136298300.2565.10.camel@davila.nicaraguaopensource.com><43BA8EA0.5060907@arcoscom.com>
	<200601031603.22960@nienna>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

I'm trying to apply patch-o-matic-ng on fedora core 4  2.6.11 kernel, wha=
t I=20
did was:

cd /usr/src
ln -s kernels/2.6.11-1.1369_FC4-smp-i686/ linux
cd /usr/src/linux
wget=20
ftp://ftp.netfilter.org/pub/iptables/snapshot/iptables-1.3.4-20060103.tar=
.bz2
wget=20
ftp://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-20=
060103.tar.bz2
tar -xjvf iptables-1.3.4-20060103.tar.bz2
mv iptables-1.3.4-20060103 iptables
tar -xjvf patch-o-matic-ng-20060103.tar.bz2
mv patch-o-matic-ng-20060103 patch-o-matic-ng
export KERNEL_DIR=3D/usr/src/linux
export IPTABLES_DIR=3D/usr/src/linux/iptables/
cd patch-o-matic-ng/
./runme extra

And in the enf of command ./runme extra :

Excellent! Source trees are ready for compilation.

Recompile the kernel image.
Recompile the netfilter kernel modules.
Recompile the iptables binaries.

After recompile the kernel, do I have do recompile "/usr/src/linux/iptabl=
es"=20
? And replace the binaries of iptables ?

Does someone has a HOWTO about this ? In=20
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.=
html=20
had only to recompile the kernel...

Sorry for my bad english.

Regards,

Pedro Drimel Neto.

----- Original Message -----=20
From: "KOVACS Krisztian" <hidden@sch.bme.hu>
To: <netfilter@lists.netfilter.org>
Cc: "Samuel D=EDaz Garc=EDa" <samueldg@arcoscom.com>
Sent: Tuesday, January 03, 2006 1:03 PM
Subject: Re: pom-ng "condition" for 2.6 kernels



  Hi,

On Tuesday 03 January 2006 15.48, Samuel D=EDaz Garc=EDa wrote:
> Jorge, I don't know if you stand me, but the problem isn't if I know ho=
w
> to use patch-o-matic.
>
> The problem is a bug in patch-o-matic (or mistake) that don't allow to
> use "condition" patch with 2.6.x kernels.
>
> I explain in the message you reply.

  It's not a bug, pom-ng simply does not contain the 2.6 version of the
condition match.

--=20
KOVACS Krisztian



