From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: tcp-MSS target extensions Patch
Date: Sun, 16 May 2004 11:03:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161103.41699.Alistair@nerdnet.ca>
References: <BAY1-F39s3nJQHd4Kkc00018f2c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F39s3nJQHd4Kkc00018f2c@hotmail.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On May 16, 2004 05:28 am, Stephen Jones wrote:
> Hello All,
>
> I am having difficulty locating and applying the tcp-MSS patch as describ=
ed
> here:
>
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-=
4.
>html#ss4.7
>
> I have run through both the patch-o-matic-20031219 and the
> patch-o-matic-ng-20040302 against an iptables 1.2.9 and  2.4.25 kernel
> sources.  The option to apply the patch does not appear as I run through
> the ./runme extra or ./rume userspace  scripts for either patch-o-matics.
>
> I am in desperate need to implement:
>
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> --clamp-mss-to-pmtu

	Umm ... try
iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS=20
=2D-clamp-mss-to-pmtu
 =20
	I've always included the -m tcp --- to load the apropriate iptables intern=
al=20
module.
>
> with a pptp client I have installed on a gateway device.
> (http://pptpclient.sourceforge.net/  <-- main page, and see these for the
> problem I am tryting to solve:
> http://pptpclient.sourceforge.net/howto-diagnosis.phtml#connections_freeze
> and finally     http://lartc.org/howto/lartc.cookbook.mtu-mss.html)
>
> The kernel config has these options set:
>
> CONFIG_IP_NF_MATCH_TCPMSS=3Dy
> CONFIG_IP_NF_TARGET_TCPMSS=3Dy
>
> Both the kernel and iptables appear to compile without complaints.

	I take it you have rebuilt the kernel to get this code in.  You need to ma=
ke=20
sure that after a kernel change and rebuild you have rebuilt the iptables=20
userspace code against this new kernel code or it will work in weird ways -=
=2D=20
or not work at all.

>
> I get an "unknown arg `--clamp-mss-to-pmtu'  gripe from the recompiled
> iptables when I enter the full command as specified above.
>
	can you find libipt_TCPMSS.so on your system anywhere? --=20
	This is the bit that provides the userspace code.

	if you do a find / -name iptables=20
	how many do you have?

	One other issue folks have had issues with is that you can end up with=20
several copies of iptables installed, which have different functionalities=
=20
built in, and which end up not matching the running kernel for some things.



> The only "hits" I could find using tcp-MSS on a google hunt were to a post
> on the netfilter list from October of 1999, and a reference to the patch =
on
> the samba cvs, but it was a dead link...
>
> A nudge in the right direction would be greatly appreciated!  Thanks for
> your time!

	good luck,=20

	Alistair Tonner


>
> SJ
>
> _________________________________________________________________
> MSN Toolbar provides one-click access to Hotmail from any Web page =96 FR=
EE
> download! http://toolbar.msn.click-url.com/go/onm00200413ave/direct/01/

