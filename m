From: eribicic@sinectis.com <kisero@uolsinectis.com.ar>
Subject: Re: fwmarks
Date: Sun,  2 Mar 2003 18:30:26 -0300 (GMT+3)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030302213026.ECAB36C617@tino.sinectis.com.ar>
Reply-To: kisero@uolsinectis.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: lartc@eter.tym.pl, netfilter@lists.netfilter.org

Thanks Thomas, it really help your commnent..still doesnt work :( but i think where the problem is..but i couldnt workit out.

i wanted to the where to things:

1) make transparent squid paquets (which i asume they are generated in the linux box) being routed to the gw i choose. it seems that as i have only one deafault gw, when squid generate the paquets it takes that address as src address and thats why, even i fwmark rules and stuff, that doesnt work..

2) make internal network paquets (wich are mascararaded throght my default gw) -remember even when i have two gateway i only masquerde paquts through one of them- use the another interface, thats why i do fwmark on prerouting and now (thanks thomas) it works, but as masquerading is not appyled (i dont know why!) paquets only go, but never come back..

any sugestion?
thank you really much!!!!!!
help needed!


all conf and stuff is in: http://www.dejawu.com.ar/net.html


> > and then
> > echo 201 www.out >> /etc/iproute2/rt_tables
> > ip rule add fwmark 2 table www.out
> > ip route add default gw via 1.1.1.1 dev ppp0
> > ip route flush cache
> >
> > and does not work!.
> > if i create a rule like
> > ip rule add to 2.2.2.2 table www.out
> > ip route flush cache
> >
> > that does work!..
> 
> Set [I guess location but key is to turn of rpfilter when using
> policyrouting via fwmark]:
> echo "0" > /proc/sys/net/ipv4/conf/ppp0/rp_filter
> 
> Regards
> tw
> -- 
> 
> ----------------
>  ck.eter.tym.pl
> 
> "Never let shooling disturb Your education"
> 
> 
-- 
Slds.

