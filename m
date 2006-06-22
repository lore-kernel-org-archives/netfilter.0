From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Pom patch error
Date: Thu, 22 Jun 2006 17:08:50 +0200 (CEST)
Message-ID: <59311.193.173.147.3.1150988930.squirrel@webmail.sterenborg.info>
References: <60157.193.173.147.3.1150982206.squirrel@webmail.sterenborg.info>
	<20060622133409.445E7699BF@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060622133409.445E7699BF@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, June 22, 2006 15:44, Ali Ozaltin wrote:
> I want install fresh linux and patch POM which distb. You counsel ?

Well, patching the kernel is not that hard if you have compiled a new ker=
nel
before.. If you have not, well, it's best to try it on a test-system firs=
t.
Actually, maybe you should do that first, but I'll leave that to you.

If you patch the kernel for the functionality you need then you also need=
 to
patch iptables (which together is one step).

Download a new kernel from ftp.kernel.org or one of it's mirrors.
Download a new POM and iptables from ftp.netfilter.org.
Untar each to a separate directory of your liking.

(Not sure if you *need* this step. Some people do this, me too. AFAIK it =
does
no harm if you don't need it.)
cd to the kernel directory
Execute:
make menuconfig (do nothing, just exit and save config)

cd to the POM directory
Execute:
KERNEL_DIR=3D"/path/to/kernel" IPTABLES_DIR=3D"/path/to/iptables" \
./runme <pending|base|extra>

Patch the kernel for the functionality you need.

cd to the kernel directory
Execute:
make menuconfig

Configure, compile and install your kernel like you normally would. This =
would
look something like this:
make dep clean
make bzImage
make modules
make modules_install
cp System.map /boot
cp arch/i386/boot/bzImage /boot

Don't forget to edit lilo.conf (and run lilo) or grub.conf.
Don't throw away your old kernel untill you have everything working and y=
ou
really want to.

cd to the iptables directory
Execute:
make
make install

Make sure you uninstall the old iptables binary/package so you don't run =
the
old binary by accident.


I don't *know* if CentOS has patched it's kernels. If so; you might *need=
*
those patches to keep all functionality on your system. I cannot help you=
 with
that.

Again, if this is the first time you are building/installing a new kernel=
 from
source: don't do it on a live server, use a test server.


Gr,
Rob


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob Sterenb=
org
> Sent: Thursday, June 22, 2006 4:17 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Pom patch error
>
>
> On Thu, June 22, 2006 14:17, Ali Ozaltin wrote:
>
>> Hello ,
>> How can i install patch-o-matic on =EF=BF=BD2.6.9-34.0.1.Elsmp kernel =
version ?
>>
> When
>
>
> This is probably a CentOS kernel ?
>
>
>> i try ./runme pending its giving this error messages ; Do you want to
> apply
>> this patch [N/y/t/f/a/r/b/w/q/?] y Testing patch
> submitted/01_2.4.19.patch...
>
> Maybe I'm reading this wrong, but if not then I think it's strange that=
 POM
> tries to use a 2.4.29 patch on a 2.6.9 kernel. Btw, what is the exact
> commandline that you use to execute "runme"?
>
>> Warning - no help text file could be found in either
>> /usr/src/kernels/2.6.9-34.0.1.EL-smp-i686/net/ipv4/netfilter/Config.he=
lp
>> or /usr/src/kernels/2.6.9-34.0.1.EL-smp-i686/Documentation/Configure.h=
elp
>> Failed to patch copy of /usr/src/kernels/2.6.9-34.0.1.EL-smp-i686
>> TEST FAILED: patch NOT applied.
>> [Press enter to continue]
>> What can i do ? pls help
>> Installed OS: CentOS 4.3
>>
>
> It could be that this kernel has been modified by CentOS. POM should be
> working on a vanilla kernel from kernel.org so you could try using one =
of
> those.
>
>
> Gr,
> Rob
>
>
>
>
>


--=20
IMPORTANT: This email is intended for the use of  the individual addresse=
e(s)
named above and may contain information that is confidential, privileged =
or
unsuitable for overly sensitive
persons with low self-esteem, no sense of humour or irrational religious
beliefs. If you are not  the intended recipient, any dissemination,
distribution or copying of this email is not
authorised (either explicitly or implicitly) and  constitutes an irritati=
ng
social faux pas. Unless the word absquatulation has been used in its corr=
ect
context somewhere other than in this
warning, it does not have any legal or grammatical use and may be ignored=
. No
animals were harmed in the transmission of this
email, although the yorkshire terrier next door is living on borrowed tim=
e,
let me tell you. Those of you with an overwhelming fear of the unknown wi=
ll be
gratified to learn that there is no hidden message revealed by reading th=
is
warning backwards, so just ignore that Alert Notice from Microsoft: Howev=
er,
by pouring
a complete circle of salt around yourself and your computer you can ensur=
e
that no harm befalls you and your pets. If you have received this email i=
n
error, please add some nutmeg and egg
whites and place it in a warm oven for 40 minutes. Whisk briefly and let =
it
stand for 2 hours before icing.



