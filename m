From: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Subject: unexpected behaviour...?
Date: Mon, 8 Sep 2003 23:24:36 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030908212436.48066.qmail@web21402.mail.yahoo.com>
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

--- Ralf Spenneberg <lists@spenneberg.org> schrieb:

> No bits in the header. It is simply matching the IP addresses, protocol
> and ports. If you add the TCP-Window-Tracking patch it does more.
> At the moment TCP is handled just like  UDP, ICMP, and generic
> protocols.
>
> If the client behind the firewall sends an ACK the connection is
> automatically picked up by iptables.

OK, i see (after *reading* some netfilter documentation as
well....RTFM...sorry). I thought that netfilter is doing *real* tcp state
tracking which is not true. to quote Joszef Kadlecsik (from "connection
tracking" by James C. Stephens):

---- snip ----

"When a packet with the SYN+ACK flags set arrives in response to a packet w=
ith
SYN set the connection tracking thinks: "I have been just seeing a packet w=
ith
SYN+ACK which answers a SYN I had previously seen, so this is an ESTABLISHED
connection."

The important point here is that the conntrack states are not equivalent to=
 tcp
states. We have already seen that a connection doesn't achieve the tcp
connection status of ESTABLISHED until the ACK after the SYN+ACK has been
received.

The representation of the tcp connection states in the state table is purely
for timeouts. You can prove this to yourself by sending an ACK packet throu=
gh
your firewall to a non-existent machine (so that you don't get the RST back=
).
It will create a state table entry no problem because it it is the first pa=
cket
of a connection and so is treated as NEW (the entry will not be marked as
ASSURED though).

---- snip ----

Well, that explains it. thank you very much!


__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Logos und Klingelt=F6ne f=FCrs Handy bei http://sms.yahoo.de

