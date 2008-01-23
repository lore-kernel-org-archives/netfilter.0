From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: Re: iptables block samba or not?
Date: Wed, 23 Jan 2008 20:00:28 -0200
Message-ID: <4797B8FC.8080308@bspu.unibel.by>
References: <200801212233.m0LMXQqO006594@indigo.cs.bgu.ac.il>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801212233.m0LMXQqO006594@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eial Czerwacki wrote:

> -A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 -j ACCEPT
> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 132.72.144.0/20 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 -j ACCEPT
> 
> -A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 -j ACCEPT
> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 192.168.114.0/24 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 -j ACCEPT
> -A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 -j ACCEPT
> 
> # up to 5 Bit-torrent connections
> -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
> 
> #else
> -A INPUT -j REJECT --reject-with icmp-port-unreachable

You ACCEPTing only NEW connection state - initial packets for every session.
Remove "-m state -- state NEW".


-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by

