From: edwardspl@ita.org.mo
Subject: Re: Server machines behind Firewall
Date: Fri, 07 Jan 2005 22:48:19 +0800
Message-ID: <41DEA133.8319FDDD@ita.org.mo>
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

I want to know why needn't to define the original IP ( Public IP ) ?
eg :

iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -s 202.175.xxx.xxx --dpor=
t
80 \
=A0 -j DNAT --to-destination 192.168.xxx.xxx

Sorry, what useful about the following function ( command line ) ?

> iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> =A0 --dport 80 -j ACCEPT

In additional, if I want to setup a NAT ( 192.168.101.0/24 ) with a Serve=
r
machines ( 192.168.100.1 ) behind Firewall...
So, is there more than one sample ( nat scripts ) for reference ?

Edward.





