From: Derrik Pates <dpates@dsdk12.net>
Subject: Re: [Iptperl-general] Is IPTables::IPv4 Perl module trustable?
Date: Fri, 23 Jul 2004 20:35:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4101AEE1.3050107@dsdk12.net>
References: <01d101c4710d$8c3c4490$5100a8c0@egp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01d101c4710d$8c3c4490$5100a8c0@egp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org, iptperl-general@lists.sourceforge.net

Bruno Negr=E3o wrote:
> My question is exactly the one in the e-mail subject: Is IPTables::IPv4
> Perl module trustable?
>=20
> This module is a perl interface to the 'libiptc' library, written by,
> Derrik Pates. I'd like to use it in an application.
> But I read in netfilter's FAQ the following:
>=20
> "4.5 Is there an C/C++ API for adding/removing rules?
> The answer unfortunately is: No.
> Now you might think 'but what about libiptc?'. As has been pointed out
> numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be used
> as a public interface. We don't guarantee a stable interface, and it is
> planned to remove it in the next incarnation of linux packet filtering.
> libiptc is way too low-layer to be used reasonably anyway.
> We are well aware that there is a fundamental lack for such an API, and we
> are working on improving that situation. Until then, it is recommended to
> either use system() or open a pipe into stdin of iptables-restore. The
> latter will give you a way better performance."

The ways they suggest will work, but not very well, and they're really=20
quite ugly. Yes, a whole new userspace tool for managing netfilter rules=20
will eventually be written - but that's still a ways off, and until the=20
kernel side interface changes, the libiptc code which I'm using from the=20
iptables codebase will continue to work just fine, thank you.

> Does someone else already tested it before? Does someone else there knows
> its internals?

I don't really know what you're saying here. But really, you can test it=20
any way you need to, or have whoever you want test it for you - the=20
source is there for your (or anybody's) perusal. It incorporates a fair=20
amount of code on top of libiptc so that you don't have to know the raw=20
data structures, and generally makes things a good bit nicer than=20
calling libiptc directly, and way cleaner than assembling command lines=20
and using system() to call out to iptables (I've tried that before, long=20
ago, and it caused me great pain. Or maybe that was just lunch one=20
day... I forget now.)

--=20
Derrik Pates
dpates@dsdk12.net

