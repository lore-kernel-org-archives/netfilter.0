From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 15:01:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051270@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Now with some -j LOG i can see the packet going
> into OUTPUT with eth1 as dst interface
>
> Now it gets into my anti-spoof rule :
> Aug 11 13:20:17 natasha kernel: firewall::OUT_IP_CHECK IN=3D =
OUT=3Deth1
> SRC=3Dsql.se.rv.er DST=3D192.168.0.149 LEN=3D40 TOS=3D0x00
>  PREC=3D0x00 TTL=3D255 ID=3D0 DF PROTO=3DTCP SPT=3D445 DPT=3D3394 =
WINDOW=3D0 RES=3D0x00 ACK
> RST URGP=3D0
>
> If i open this rule, i can see the packet adressed to 192.168.0.149
> sent on eth1 (WAN) with tcpdump.
>
> Any other ideas ?

yeah--in order for your netfilter machine to be able to reset the =
connection--it has to spoof/pretend to be the original destination of =
the packet (sql.se.rv.er).  i.e. it generates a packet locally with a =
source IP of the SQL server and a destination of the client that is =
subject to the OUTPUT chain filters.  your OUT_IP_CHECK chain only =
allows the source IP to be the actual IP's of the netfilter machine =
(this is actually a good thing).

my guess is adding this:

  -I OUTPUT -p tcp --tcp-flags SYN,RST,FIN RST -j ACCEPT

would fix the situation.  if it does--i'll leave it to you to decide how =
you want to incorporate it into your custom chains.

-j


