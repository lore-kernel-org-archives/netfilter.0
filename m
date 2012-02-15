From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Wed, 15 Feb 2012 12:04:38 -0600 (CST)
Message-ID: <23836786.3322.1329329078381.JavaMail.root@ixer.mx>
References: <25775146.3320.1329329075047.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <25775146.3320.1329329075047.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: SamLT <sam@sltosis.org>, netfilter@vger.kernel.org, Andrew Beverley <andy@andybev.com>

> On Tue, 14 Feb 2012, Enrique Huerta de la Fuente wrote:
> 
> > The problem is that the MASQUERADE rule does not work with UDP(1195).
> >
> > Any idea?
> 
> One thing to check out, took me a whole day to figure out with openvpn
> udp traffic to port 1194 not beeing masqueraded in some "random" cases:
> 
> Does the connection to your port 1195 exist before the filewall rulesets
> are loaded first after boot? - one packet before the rule setup may be
> enough. Once a connection with the same sip+sport+dip+dport has been
> added to the conntrack list their masquerading/SNAT/DNAT state is not
> changed again - and with the "virtual" udp connection they can stay
> alive quite a while.
> 
> Perhaps try just flushing the whole connection-tracking table and see if
> it starts working afterwards:
> 
> conntrack -F conntrack ; conntrack -F expect
> 
> c'ya
> sven-haegar
> 
> -- Three may keep a secret, if two of them are dead.
> - Ben F.

 
Hello Sven-Haegar, yes, exist the connection to port 1195 before the  firewall rulesets.

udp      17 179 src=38.124.170.14 dst=38.124.170.25 sport=1195 dport=1195 packets=496310 bytes=132295480 src=38.124.170.25 dst=38.124.170.14 sport=1195 dport=1195 packets=664491 bytes=169869224 [ASSURED] mark=0 secmark=0 use=1

I try the NOTRACK target, but I have to wait the time to live of the connection tracking to apply the new rules:

iptables -t raw -I PREROUTING -p udp --sport 1195 -j NOTRACK
iptables -t raw -I OUTPUT -p udp --dport 1195 -j NOTRACK
iptables -t raw -I PREROUTING -p udp --dport 1195 -j NOTRACK

I wait 179 secs and ...
iptables -t raw -D PREROUTING -p udp --sport 1195 -j NOTRACK
iptables -t raw -D OUTPUT -p udp --dport 1195 -j NOTRACK
iptables -t raw -D PREROUTING -p udp --dport 1195 -j NOTRACK

With this, I can apply the rule MASQUERADE and works very well. Now, I have to install conntrack-tools for delete the connection tracking very quicly.

Thanks very much, I really appreciate your help, I was desperate because i did not know why not working.

E.Huerta
