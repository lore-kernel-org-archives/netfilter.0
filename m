From: edwardspl@ita.org.mo
Subject: Re: Server machines behind Firewall
Date: Sat, 08 Jan 2005 11:33:00 +0800
Message-ID: <41DF546C.D18971B7@ita.org.mo>
References: <41DC1258.78D37B1D@ita.org.mo>
	<20050106163555.GA28547@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Jason Opperisano wrote:

> On Thu, Jan 06, 2005 at 12:14:16AM +0800, edwardspl@ita.org.mo wrote:
> > Dear All,
> >
> > Is there a sample ( nat scripts ) for the title ?
>
> EXT_IF=3D"eth0"
> INT_IF=3D"eth1"
> SRV1=3D"10.1.1.10"
>
> iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 \
> =A0 -j DNAT --to-destination $SRV1
>
> iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> =A0 --dport 80 -j ACCEPT

Can we setup server machines behind firewall with same machine ?
Because there is only one machine allow to setup firewall + Internet
Server...

Edward.




