From: Peter Volkov Alexandrovich <pvolkov@mics.msu.su>
Subject: Re: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Tue, 02 Aug 2005 23:47:26 +0400
Message-ID: <1123012047.26053.8.camel@localhost>
References: <1123009163.12889.164.camel@ws50.darkcore.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123009163.12889.164.camel@ws50.darkcore.net>
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

Hi.

On =D0=92=D1=82=D1=80, 2005-08-02 at 13:59 -0500, John Lange wrote:
> The problem is, quite a few packets are being dropped which I don't
> think should be.
>=20
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
>=20
> iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
>=20
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> With the above rules why does the following get blocked?
>=20
> -----
> Aug  2 13:04:47 HOST kernel: IN=3D OUT=3Deth0 SRC=3DXXX.XXX.XXX.XXX
> DST=3DXXX.XXX.XXX.XXX LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D119=
45 DF
> PROTO=3DTCP SPT=3D80 DPT=3D48473 WINDOW=3D1805 RES=3D0x00 ACK URGP=3D0 UI=
D=3D501
> -----
>=20
> This appears to be the return ACK of the inital SYN. Shouldn't that be
> permitted under the above rules?

No. IIUC your connection is in state NEW while it have not seen packets
in both directions (man iptables). After syn packet have reached your
host syn,ack packet should be sent to client. At this moment your
connection is in state NEW. And your rules forbid OUTPUT packets in
state NEW. Thus packet is dropped.

Peter.


