From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: incoming interface confusion question
Date: Mon, 21 Jun 2004 13:34:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621203436.GA8022@ranjeet-pc2.zultys.com>
References: <40D71EC4.7090900@smxy.org> <1087846613.1937.30.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1087846613.1937.30.camel@anduril.intranet.cartel-securite.net>
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
To: netfilter@lists.netfilter.org

* Cedric Blancher (blancher@cartel-securite.fr) wrote:
> Le lun 21/06/2004 =E0 19:45, Shaun T. Erickson a =E9crit :
> > Are there any cases where iptables can be confused about what interface=
=20
> > a packet came in on? Can a packet arriving on interface A ever be=20
> > reported as arriving on interface B?
>=20
> I'm not aware of such a case. Would be quite surprising.
>=20
> > I had an incident this weekend, and am trying to be certain that the=20
> > packets came in the interface my system said it did. It's a Red Hat 9=20
> > system, running their stock 2.4.20-8 kernel.
>=20
> Do you have any reason to think your system was wrong ?
>=20

In order of likelihood, (highest to lowest):

1) http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.kernel.rpf.html

Check your /proc/sys/net/ipv4/conf/$INTF/rp_filter setting.

If it is not set, someone might have tried to attack your network from
the public side, using private src ips. e.g. this can be used for an
attack to make javaVM think that the packets are coming from the host
itself or a trusted server.

2) If it is set, then a VPN might still allow such packets into your
network, past a firewall.

3) If neither, then it might be an issue with the code in Linux.

HTH

--=20
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye at Zultys dot com
http://www.zultys.com/
=20
The views, opinions, and judgements expressed in this message are solely th=
ose of
the author. The message contents have not been reviewed or approved by Zult=
ys.


