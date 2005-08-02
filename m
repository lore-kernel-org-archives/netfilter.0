From: John Lange <john.lange@open-it.ca>
Subject: Re: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Tue, 02 Aug 2005 15:58:46 -0500
Message-ID: <1123016327.12889.200.camel@ws50.darkcore.net>
References: <1123009163.12889.164.camel@ws50.darkcore.net>
	<1123012047.26053.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123012047.26053.8.camel@localhost>
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
To: Peter Volkov Alexandrovich <pvolkov@mics.msu.su>
Cc: netfilter <netfilter@lists.netfilter.org>

Thanks Peter.

Perhaps you can help clarify this for me?

According to http://www.knowplace.org/netfilter/ip_overview.html , the
handshake procedure is as follows:

1. (B) --> [SYN] --> (A)
2. (B) <-- [SYN/ACK] <--(A)
3. (B) --> [ACK] --> (A)

I read it as meaning that up until the end of step 2 the connection
would be NEW. At the end of Step 2 and beyond the connection would be
ESTABLISHED.

A packet with just the "ACK" flag set can only be part of an established
connection. quote "The important thing to note here is that after the
three-way handshake is completed, and the connection is complete, every
packet that is part of this TCP connection will always have the ACK bit
set."

So, my understanding is the only way a packet could be generated with
the ACK flag set and the SRC as my server's IP is as part of an
established connection.

If that is the case then it should not be blocked because I have an
OUTPUT rule  which allows it.

Where am I going wrong here?

If I do:

iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Then all outbound packets are allowed so I definitely don't want that.

--=20
John Lange

On Tue, 2005-08-02 at 23:47 +0400, Peter Volkov Alexandrovich wrote:
> Hi.
>=20
> On =B2=E2=E0, 2005-08-02 at 13:59 -0500, John Lange wrote:
> > The problem is, quite a few packets are being dropped which I don't
> > think should be.
> >=20
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> >=20
> > iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
> >=20
> > iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >=20
> > With the above rules why does the following get blocked?
> >=20
> > -----
> > Aug  2 13:04:47 HOST kernel: IN=3D OUT=3Deth0 SRC=3DXXX.XXX.XXX.XXX
> > DST=3DXXX.XXX.XXX.XXX LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D=
11945 DF
> > PROTO=3DTCP SPT=3D80 DPT=3D48473 WINDOW=3D1805 RES=3D0x00 ACK URGP=3D=
0 UID=3D501
> > -----
> >=20
> > This appears to be the return ACK of the inital SYN. Shouldn't that b=
e
> > permitted under the above rules?
>=20
> No. IIUC your connection is in state NEW while it have not seen packets
> in both directions (man iptables). After syn packet have reached your
> host syn,ack packet should be sent to client. At this moment your
> connection is in state NEW. And your rules forbid OUTPUT packets in
> state NEW. Thus packet is dropped.
>=20
> Peter.
>=20



