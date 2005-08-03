From: Peter Volkov Alexandrovich <pvolkov@mics.msu.su>
Subject: Re: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Wed, 03 Aug 2005 09:08:01 +0400
Message-ID: <1123045682.26557.47.camel@localhost>
References: <1123009163.12889.164.camel@ws50.darkcore.net>
	<1123012047.26053.8.camel@localhost>
	<1123016327.12889.200.camel@ws50.darkcore.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123016327.12889.200.camel@ws50.darkcore.net>
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
Content-Type: text/plain; charset="utf-8"
To: John Lange <john.lange@open-it.ca>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi, again.

On =D0=92=D1=82=D1=80, 2005-08-02 at 15:58 -0500, John Lange wrote:
> Perhaps you can help clarify this for me?

Perhaps. :) But be aware that I'm not a TCP guru. ;)

May be somebody from netfilter mailing list point us to the right
documentation. The general question is at which points of the packet
traversal diagram the connection tracking code changes its state? Or in
which chain/tables syn,ack packet is the part of ESTABLISHED connection?

> According to http://www.knowplace.org/netfilter/ip_overview.html , the
> handshake procedure is as follows:
>=20
> 1. (B) --> [SYN] --> (A)
> 2. (B) <-- [SYN/ACK] <--(A)
> 3. (B) --> [ACK] --> (A)
>=20
> I read it as meaning that up until the end of step 2 the connection
> would be NEW. At the end of Step 2 and beyond the connection would be
> ESTABLISHED.
>=20
> A packet with just the "ACK" flag set can only be part of an established
> connection. quote "The important thing to note here is that after the
> three-way handshake is completed, and the connection is complete, every
> packet that is part of this TCP connection will always have the ACK bit
> set."
>=20
> So, my understanding is the only way a packet could be generated with
> the ACK flag set and the SRC as my server's IP is as part of an
> established connection.
>=20
> If that is the case then it should not be blocked because I have an
> OUTPUT rule  which allows it.

TCP connection states are not the same as iptables connection states.
And connection tracking code think that connection is ESTABLISHED only
after step 2. But (I hope :)) packet should pass connection tracking
code BEFORE it get INPUT or OUTPUT chain and thus connection should be
at the ESTABLISHED state in this chains. Thus setting just ESTABLISHED
should be Ok.

> Where am I going wrong here?
>=20
> If I do:
>=20
> iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> Then all outbound packets are allowed so I definitely don't want that.

I think your problem is in the following rule:

iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT

change it on

iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT

Please tell me if this works for you.

Peter.


