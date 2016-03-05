From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Rewriting target IP and port on Linux with iptables or
 firewall-cmd
Date: Sat, 5 Mar 2016 01:32:03 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1603050130390.24095@aurora.sdinet.de>
References: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Barylo <abarylo@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 4 Mar 2016, Alex Barylo wrote:

> I have a server in a DC1 with a private IP, of say 10.10.10.10. This
> IP is NAT'd to a public IP, say 216.58.219.10 in this way:
> 
> 216.58.219.10:8090 -> 10.10.10.10:8089
> 
> I have a server in DC2 which knows about (and wants to connect to)
> 10.10.10.10:8089 but doesn't know about 216.58.219.10:8090 (long
> story).
> 
> So I want to rewrite dest IP/port from 10.10.10.10:8089 to 216.58.219.10:8090.
> 
> This is what I tried:
> 
> # sysctl net.ipv4.ip_forward=1
> # iptables -t nat -A PREROUTING -p tcp --dest 10.10.10.10 --dport 8089
> -j DNAT --to 216.58.219.10:8090

> Any pointers are greatly appreciated.

Try adding the same rule also to the nat OUTPUT chain.

iptables -t nat -A OUTPUT -p tcp --dest 10.10.10.10 --dport 8089 -j 
DNAT --to 216.58.219.10:8090

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
