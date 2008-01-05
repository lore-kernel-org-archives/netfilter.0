From: "Hal Moroff" <hmoroff@teltone.com>
Subject: libnetfilter_conntrack
Date: Fri, 4 Jan 2008 18:48:55 -0800
Message-ID: <1C795E2FCD154E46979DDDD5374B5ABE01C7CB18@TTMAIL2.teltone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I have a firewall application that creates/deletes iptable (netfilter) =
rules dynamically in response to client requests.

In other words, a client negotiates with my application and I agree to =
open a route from that client to a device behind the firewall.=A0 At a =
certain time later my application closes that route by removing the rul=
e.

The problem is that TCP connections persist, so even though I remove th=
e rule, the client (if already connected to the target device) can cont=
inue to use that connection.

I use 'cutter' to terminate the connection, and that works most of the =
time, however the connection remains listed in /proc/net/ip_conntrack, =
and that confuses my 'cutter' invocation if the same client opens the s=
ame route too soon.

I've set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_{close,c=
lose_wait} to 0, and that doesn't seem to help.

I'm thinking that calling nfct_delete_conntrack() directly is my soluti=
on, however I'm not certain, and I'm also having trouble understanding =
how to fill in the arguments (and where to get the id required by the l=
ast argument).

Does anyone have a suggestion?=A0 Is 'cutter' the best tool to cut the =
connection?=A0 Is there a better way to force cut entries out of conntr=
ack?=A0 Is there an example of nfct_delete_conntrack()?

