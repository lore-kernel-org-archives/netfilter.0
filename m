From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Problem getting connection to terminal Server behind router
	andfirewall
Date: Thu, 20 Oct 2005 15:05:34 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5885@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: nunocruz@lei.fis.uc.pt, info@mysolutions.de
Cc: netfilter@lists.netfilter.org

I think the rules you have put in place are confusing themselves. =20

First off, when NAT'ing an IP you really want to NAT the interface as
well.=20

Try this:

iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 3389 -j DNAT
--to-destination 192.168.1.101:3389=20

iptables -t filter -A FORWARD -i eth0 -p tcp -m tcp --dport 3389 -j
ACCEPT


> > eth0: 192.168.178.100 (connected to the router)
> > eth1: 192.168.1.100   (connected to my LAN)

> > 1. Config the router to forward all TCP 3899 requests to the
firewall
> > (192.168.178.100)
> > On the firewall i put the setting:
> > iptables -t nat PREROUTING -p tcp --dport 3389 -j DNAT --to
> > 192.168.1.101:3389
> > and (another try)
> > iptables -t nat PREROUTING -p tcp --dport 3389 -j DNAT --to
> > 192.168.1.101
> >
> > 2. Config the outer to forward all TCP requests directly to MS SBS
> > (192.168.1.101)
> > Firewall:
> > iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT
> >


