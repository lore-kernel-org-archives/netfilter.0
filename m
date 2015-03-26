From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Why SYN-ACK packets are dropped as INVALID?
Date: Thu, 26 Mar 2015 08:53:07 -0400
Message-ID: <201503260853.07382.neal.p.murphy@alum.wpi.edu>
References: <CBA35483CE5B4D4B804BF128A77A61651B66E56B@HIKAWSEXMB02.ad.harman.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CBA35483CE5B4D4B804BF128A77A61651B66E56B@HIKAWSEXMB02.ad.harman.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Thursday, March 26, 2015 04:41:21 AM Spenst, Aleksej wrote:
> Hi All,
>=20
> I=E2=80=99m sending TCP SYN packets to the server. The problem is tha=
t the SYN-ACK
> packets coming from the server in response are sometimes dropped by m=
y
> firewall (iptables) as INVALID. I can=E2=80=99t figure out why the fi=
rewall sees
> these packets invalid. They seem to be Ok. What parameters are taken =
into
> account by the firewall when making a decision about invalidity of a
> packet?
>=20
> Example from tcpdump:
>=20
> 19:29:22.045106  <my IP>      <Server IP>  TCP  60710=E2=86=928080 [S=
YN]
> Seq=3D2646194936 Win=3D14600 Len=3D0 MSS=3D1460 SACK_PERM=3D1 TSval=3D=
1356920 TSecr=3D0
> WS=3D16 19:29:22.817859  <Server IP>  <my IP>      TCP  8080=E2=86=92=
60710 [SYN,
> ACK] Seq=3D3920856233 Ack=3D2646194937 Win=3D65535 Len=3D0 MSS=3D1200=
 SACK_PERM=3D1
>=20
> The ACK sequence number (Ack=3D2646194937) is OK, but I see in my ipt=
ables
> logs that this SYN-ACK packet is marked as INVALID and dropped. When =
the
> SYN-ACK packet comes the TCP session is in the state SYN_SENT -> So, =
the
> states are also OK. Why is this packet invalid then?

Does the ACK tell the peer the sequence # of the *next* packet the host=
=20
expects to receive? Or does it acknowledge the *last* packet it receive=
d? If=20
the latter, then the SYN-ACK as sent is invalid, as it acknowledges a p=
acket=20
that hasn't been sent yet.
