From: Vincent Haverlant <galadril@parinux.org>
Subject: Re: iptables bridge filter question
Date: Thu, 18 Mar 2004 20:28:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040318192850.GD21027@haverlant.org>
References: <ILECICAFAJIIMPBBLMEAAELECPAA.gerryw@objectivedomain.com> <200403181524.35795.Antony@Soft-Solutions.co.uk> <200403181533.58166.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403181533.58166.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Le Thu Mar 18 15:33:58 2004, Antony Stone a =E9crit:
| > > I have setup a bridging firewall. I want to drop packets on the ext=
ernal
| > > interface, which have source addresses on my internal network. Howe=
ver,
| > > the firewall/bridge sits between my T1 router and the rest of my LA=
N. Is
| > > there a way to drop the packets mentioned previously, but allow the
| > > router? I guess a rule could be created that uses the routers mac a=
ddress
| > > as a match. I've been playing around with this, but I'm not getting=
 the
| > > result I want. I could sure use some advice on this.
| > >
| > > [ LAN xx.xx.xx.0/24 ]<=3D=3D>[ bridge/firewall ]<=3D=3D>[ router xx=
.xx.xx.254/24
| > > ]
| >
| > How about:
| >
| > iptables -A FORWARD -i $extIF -s xx.xx.xx.254 -j ACCEPT
| > iptables -A FORWARD -i $extIF -s xx.xx.xx.0/24 -j DROP
|=20
| Okay, scrub that - I overlooked the significance of it being a *bridgin=
g*=20
| firewall :(

Well this is not altogether stupid :) provided you have the bridge-nf
patch for a 2.4 kernel or a 2.6 kernel with bridge filtering and
ebtables.

Vincent.
--=20
   .~.     Vincent Haverlant  -- Galadril -- #ICQ: 35695155  =20
   /V\      MSN: vincent_msn@haverlant.org  -- http://www.haverlant.org/
  /( )\      Parinux member: http://www.parinux.org/
  ^^-^^       GPG: 8FEA 52C2 5C54 A201 2375  0FA5 AF2E 1881 92D0 EE84

