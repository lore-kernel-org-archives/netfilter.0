From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: masquerade error
Date: Fri, 14 Oct 2011 12:27:19 +0200
Message-ID: <1318588039.3179.16.camel@ns014530.dcyb.net>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com>
	 <4E95D9E2.4010002@gmail.com>  <4E97E602.3000809@gmail.com>
	 <1318582536.3179.5.camel@ns014530.dcyb.net>
	 <1318583118.3179.6.camel@ns014530.dcyb.net>
	 <4E980738.5040202@googlemail.com>  <4E980794.7040906@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E980794.7040906@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-10-14 at 10:57 +0100, J Webster wrote:
> The problem is that the connection comes from a VPN client so I do not 
> usually know the external IP.

Yes, well, if MASQUERADE is disabled and you can only use SNAT but you
don't know the --to address, then it may not be possible to do what you
want because you can't create a valid rule. Maybe someone else has a
better idea or the VPS provider can shed some more light.

> All I know is that they connect on the tun/vpn networks of 10.8.0.0/24 
> and 172.16.0.0/24.
> In the mangle section do I put:
> *mangle
> :PREROUTING ACCEPT [19588:10233482]
> :INPUT ACCEPT [19588:10233482]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [18858:10334564]
> -A POSTROUTING -s 10.8.0.0/255.255.255.0 -o venet0 -j SNAT --to-source 
> xxx.xxx.xxx.xxx
> -A POSTROUTING -s 172.16.0.0/255.255.255.0 -o venet0 -j SNAT --to-source 
> xxx.xxx.xxx.xxx
> :POSTROUTING ACCEPT [18858:10334564]
> COMMIT

Did you actually check 'man iptables'? Because the man says:

'SNAT    This  target  is only valid in the nat table, in the
POSTROUTING chain.'

Unless there's something missing (or I'm missing something) in the
above, you're trying to use the mangle table to do NAT.

> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [18851:10333352]
> :RH-Firewall-1-INPUT - [0:0]
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT
> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 20 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 21 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p udp -m udp --dport 53 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 53 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p udp -m udp --dport 123 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 8002 -m state --state NEW 
> -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 9001 -m state --state NEW 
> -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j 
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 8080 -m state --state 
> NEW,RELATED,ESTABLISHED -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 1935 -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
> -A RH-Firewall-1-INPUT -p udp -m udp --dport 1194 -j ACCEPT
> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
> COMMIT
> *nat
> :PREROUTING ACCEPT [1234:59200]
> :POSTROUTING ACCEPT [338:21268]
> :OUTPUT ACCEPT [338:21268]
> COMMIT


--
Rob


