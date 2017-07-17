From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Tue, 18 Jul 2017 00:43:34 +0200
Message-ID: <2e60796b-1cad-9444-1d81-c13dcf44bcfd@free.fr>
References: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Le 17/07/2017 à 22:35, Bruno de Paula Larini a écrit :
> I've missed Adel's response (sorry!), and now I'm trying to load the helper directly in the rules as suggested.
> However, now even external clients can't connect with the new ruleset (the data connection fails).
> I'm not sure if I understood it completely, so here's what I'm trying to do in my test environment:
> 
>     #!/bin/bash
> 
>     iptables -P FORWARD ACCEPT
> 
>     ...
> 
>     echo 1 > /proc/sys/net/ipv4/ip_forward
> 
>     ...
> 
>     iptables -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
>     iptables -t nat -A PREROUTING -p tcp --dport 21 -j DNAT --to-destination 192.168.0.10

> 
>     iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 1024: -m conntrack --ctstate ESTABLISHED -m helper --helper ftp -j ACCEPT

If you read carefully the URL about "secure use of helpers", you'll
see that the ctstate should be RELATED, not ESTABLISHED. You should
still have a separate, _simple_, --ctstate ESTABLISHED -j ACCEPT
rule somewhere. Forget about this, you can even just reuse the very same
ESTABLISHED,RELATED without changing your pre-kernel 4.7 rules:
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 

that should still be translated to the modern form for the future:
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT 

Anyway, with FORWARD -P ACCEPT the rule isn't needed at
all in your test environment.

The only _required_ part is the -j CT in raw (which automatically loads
nf_conntrack_ftp) *and* _explicitely_ loading nf_nat_ftp. Or else no
nat handling will happen at all. Did you check nf_nat_ftp was actually
loaded in your test environment?

> 
>     iptables -t nat -A POSTROUTING -s 192.168.0.10 -p tcp --sport 21 -j SNAT --to-source $public_ip

I think this rule is useless: conntrack/nat already handles it you
should just remove it (the other POSTROUTING rule from your production
rules is indeed needed to handle having the server in the user's LAN).

> 
> 
> Would this be enough? I've searched for more info about helpers and how to use them but didn't find much.
> I had to add the raw table rule because the module wasn't being shown as loaded on lsmod.
> In this case the FORWARD policy is ACCEPT.
> 
> Also, I was already setting nf_conntrack_helper to 1 and it works for users outside my LAN as I explained before, but it doesn't work when trying to make a connection go back to my LAN with SNAT (which works on 4.6).
> 

I noticed in your previous email that you were setting
 nf_conntrack_helper to 1 _after_ having loaded the helper modules:too
late. For reverting the change in 4.7, you could add this option in
modprobe.d: options nf_conntrack nf_conntrack_helper=1
or just explicitely run modprobe nf_conntrack, then run the echo, then
load the helpers, in this order.

Don't forget to rmmod the helper modules before trying again with echo
if you want to revert to the pre-4.7 way.

regards,
Adel BELHOUANE.
