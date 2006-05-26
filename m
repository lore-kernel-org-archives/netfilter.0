From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connection tracking looses packets?
Date: Fri, 26 May 2006 14:19:16 +0200
Message-ID: <4476F244.8000608@plouf.fr.eu.org>
References: <44745ECF.70702@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44745ECF.70702@expertron.co.za>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Justin Schoeman a =E9crit :
>=20
> (This is logged by a -m state --state INVALID rule in the mangle table.=
)=20
> The packet is then not natted, but drops into the INPUT chain for the=20
> firewall itself, where it is dropped.

Yes, packets marked in the INVALID state by the connection tracking are=20
not handled by NAT.


> Any idea why this packet may be dropped, or are there other possible=20
> reasons why the connection may be stalling?

If the reason is incorrect sequence numbers with a kernel >=3D 2.6.9 or=20
including patch tcp-window-tracking, you can try to enable (value > 0)=20
the parameter /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal=20
(net.ipv4.netfilter.ip_conntrack_tcp_be_liberal in sysctl) :

   ip_conntrack_tcp_be_liberal
                 when enabled, only out of window reset (RST) segments
                 are marked as INVALID; when disabled (default), all
                 out of window packets are marked as INVALID.

