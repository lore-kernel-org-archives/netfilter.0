From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: SYN Proxy for iptables?
Date: Mon, 23 Apr 2007 12:24:01 -0700
Message-ID: <BAY119-F18F1AA6AF53F9D4D9CDFCBD64B0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

For SYN flood protection, it seems OpenBSD's pf deploys something they call=
=20
a "SYN proxy" whereby the 3 step TCP handshake is completed by this proxy s=
o=20
as to avoid SYN floods to the actual target.

This OpenBSD pf feature is described here:
http://www.openbsd.org/faq/pf/filter.html#synproxy

The target is only brought into the picture if and when the handshake is=20
complete.

I guess pf must then adjust the real target's sequence numbers so as not to=
=20
confuse the initiator of the connection.

Has something like this been implemented via iptables?

If not, are there any plans to do so?

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
MSN is giving away a trip to Vegas to see Elton John.=A0 Enter to win today=
.=20
http://msnconcertcontest.com?icid-nceltontagline


