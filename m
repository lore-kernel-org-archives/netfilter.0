From: Florian Westphal <fw@strlen.de>
Subject: Re: Linux netfilter / iptables : How to enable iptables TRACE chain
 handling with nf_log_syslog on RHEL8+?
Date: Sun, 25 Jun 2023 15:40:39 +0200
Message-ID: <20230625134039.GB3207@breakpoint.cc>
References: <hhttuv65e9.fsf@jvdspc.jvds.net>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <hhttuv65e9.fsf@jvdspc.jvds.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Vas Dias <jason.vas.dias@ptt.ie>, Jason Vas Dias <jason.vas.dias@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Jason Vas Dias <jason.vas.dias@ptt.ie> wrote:
> 
> Good day -
> 
>   On a Linux RHEL8 system, I have enabled these iptables rules,
>   which I am led to believe should enable ICMP packet syslog
>   logging on interface ingress & egress :
> 
>     # iptables -L -t raw
>     Chain PREROUTING (policy ACCEPT)
>     target     prot opt source               destination         
>     TRACE      icmp --  anywhere             anywhere            
> 
>     Chain OUTPUT (policy ACCEPT)
>     target     prot opt source               destination         
>     TRACE      icmp --  anywhere             anywhere            

Run "xtables-monitor --trace".
