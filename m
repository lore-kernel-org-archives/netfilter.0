From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <bnegrao@engepel.com.br>
Subject: Is IPTables::IPv4 Perl module trustable?
Date: Fri, 23 Jul 2004 20:32:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01c401c4710d$64351350$5100a8c0@egp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org
Cc: iptperl-general@lists.sourceforge.net

Hi guys,

My question is exactly the one in the e-mail subject: Is IPTables::IPv4
Perl module trustable?

This module is a perl interface to the 'libiptc' library, written by,
Derrik Pates. I'd like to use it in an application.
But I read in netfilter's FAQ the following:

"4.5 Is there an C/C++ API for adding/removing rules?
The answer unfortunately is: No.
Now you might think 'but what about libiptc?'. As has been pointed out
numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be used
as a public interface. We don't guarantee a stable interface, and it is
planned to remove it in the next incarnation of linux packet filtering.
libiptc is way too low-layer to be used reasonably anyway.
We are well aware that there is a fundamental lack for such an API, and we
are working on improving that situation. Until then, it is recommended to
either use system() or open a pipe into stdin of iptables-restore. The
latter will give you a way better performance."

Does someone else already tested it before? Does someone else there knows
its internals?

Thanks,
bruno negr=E3o


