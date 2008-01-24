From: Eial Czerwacki <eial@cs.bgu.ac.il>
Subject: Re: iptables block samba or not?
Date: Thu, 24 Jan 2008 22:17:00 +0200 (IST)
Message-ID: <200801242017.m0OKH0lJ011470@indigo.cs.bgu.ac.il>
References: <4797B8FC.8080308@bspu.unibel.by>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4797B8FC.8080308@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Cc: netfilter@vger.kernel.org

I've got this too has part of the rules

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


On Thu 24 Jan 0:00 2008 Dzianis Kahanovich wrote:
> Eial Czerwacki wrote:
> 
> > -A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 -j ACCEPT
> > -A INPUT -p udp -m state --state NEW --dport 137:138 -s 132.72.144.0/20 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 -j ACCEPT
> > 
> > -A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 -j ACCEPT
> > -A INPUT -p udp -m state --state NEW --dport 137:138 -s 192.168.114.0/24 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 -j ACCEPT
> > -A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 -j ACCEPT
> > 
> > # up to 5 Bit-torrent connections
> > -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
> > 
> > #else
> > -A INPUT -j REJECT --reject-with icmp-port-unreachable
> 
> You ACCEPTing only NEW connection state - initial packets for every session.
> Remove "-m state -- state NEW".
> 
> 
> -- 
> WBR,
> Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
> 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 




