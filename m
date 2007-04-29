From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Port forwarding not working
Date: Sun, 29 Apr 2007 10:39:54 -0400
Message-ID: <1177857594l.3596l.2l@soapy>
References: <1177830613l.3596l.1l@soapy>
	<000c01c78a5f$3d392570$dededede@neilhp>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c78a5f$3d392570$dededede@neilhp> (from
	+nfcan+jimlaur+ce6b708e36.neil#JAMMConsulting.com@spamgourmet.com on
	Sun Apr 29 09:06:44 2007)
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 04/29/2007 09:06:44 AM, Neil Aggarwal - neil@JAMMConsulting.com wrote:
> Jim:
>=20
> > Maybe you could use SNAT to make the packets appear
> > to come from the firewall, then they ought to come back.=20
>=20
> How do I set up the SNAT rule?
>=20

This will make the packet look like it came from the firewall:

/sbin/iptables -t nat -I POSTROUTING -o eth1 -d $LINKSYS_VPN_IP \=20
  -p tcp --dport 1723 -j SNAT --to-source 192.168.1.1

(where 192.168.1.1 is the ip address of the firewall on eth1 side)

If postrouting still has a default drop policy etc.
then this rule must be found before the accept rule,
that is why it has -I, to put it first.

HTH
--=20
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.


