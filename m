From: Alex Ongena <Alex.Ongena@able.be>
Subject: Re: [Iptperl-general] Is IPTables::IPv4 Perl module trustable?
Date: Mon, 26 Jul 2004 09:31:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090827118.17645.866.camel@ao.able.be>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Bruno =?unknown-8bit?q?Negr=E3o?= <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org, iptperl <iptperl-general@lists.sourceforge.net>

Hi,

We are using it already for a long time and on many
systems and it works well (for us).

Thanks to Derek for this

Regards
alex

On Sat, 2004-07-24 at 01:34, Bruno Negr=E3o wrote:
> Hi guys,
>=20
> My question is exactly the one in the e-mail subject: Is
> IPTables::IPv4
> Perl module trustable?
>=20
> This module is a perl interface to the 'libiptc' library, written by,
> Derrik Pates. I'd like to use it in an application.
> But I read in netfilter's FAQ the following:
>=20
> "4.5 Is there an C/C++ API for adding/removing rules?
> The answer unfortunately is: No.
> Now you might think 'but what about libiptc?'. As has been pointed out
> numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be
> used
> as a public interface. We don't guarantee a stable interface, and it
> is
> planned to remove it in the next incarnation of linux packet
> filtering.
> libiptc is way too low-layer to be used reasonably anyway.
> We are well aware that there is a fundamental lack for such an API,
> and we
> are working on improving that situation. Until then, it is recommended
> to
> either use system() or open a pipe into stdin of iptables-restore. The
> latter will give you a way better performance."
>=20
> Does someone else already tested it before? Does someone else there
> knows
> its internals?
>=20
> Thanks,
> bruno negr=E3o
>=20

--
aXs GUARD has completed security and anti-virus checks on this e-mail
(http://www.axsguard.com)

