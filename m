From: Guillaume Vachon <gvachon@infoglobe.ca>
Subject: Re: iptables + 2 isp + dnat problem
Date: Thu, 11 Mar 2010 11:38:52 -0500
Message-ID: <1268325532.23467.5.camel@gvachon-laptop>
References: <1268255390.15912.109.camel@gvachon-laptop>
	 <4B98227B.1060307@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B98227B.1060307@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi all,=20

Thanks Pascal Hambourg that did the trick.

I added this to my configuration :
eth3 is my lan
eth4 is my 2nd ISP

-t mangle -A PREROUTING -i eth3 -m conntrack --ctorigdst 69.x.x.18 -j
MARK --set-mark 0x1

Or i can also do this

-A PREROUTING -i eth4 -m state --state NEW -j CONNMARK --set-mark 0x1
-A PREROUTING -i eth3 -j CONNMARK --restore-mark

Now everything is working, thanks!



On Wed, 2010-03-10 at 23:51 +0100, Pascal Hambourg wrote:
> Guillaume Vachon a =C3=A9crit :
> >=20
> > Now the point that i dont understant is this. How can i dnat incomi=
ng
> > traffic on my second isp to a lan server? For example. Im iptables =
i
> > added this :
> > -t nat -A PREROUTING -d 69.x.x.18 -p tcp -m tcp --dport 22 -j DNAT
> > --to-destination 10.10.200.11:22
> >=20
> > Now the traffic gets in my firewall on eth5 that send it localy to
> > 10.10.200.11 but when the traffic comes back to the firewall it doe=
s not
> > try to get out using my second isp but the first one. I know i can =
mark
> > packet to solve this. But i dont know how to do it. Should i mark a=
ll
> > traffic that come in using second isp with a mark so that it can ex=
ist
> > through that interface?
>=20
> IIUC, you need symmetric routing.
>=20
> You can either :
> - use a connection mark with CONNMARK based on the input interface an=
d
> copy it in the packet mark for return traffic
> - match the original destination address of the connection with -m
> conntrack --ctorigdstaddr
> - DNAT to a specific address on the LAN (possibly an alias) and use a
> routing rule based on that source address for return traffic.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

