From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd external cache does not contain NAT information
Date: Fri, 21 Aug 2009 16:28:24 +0200
Message-ID: <4A8EAF08.9020807@netfilter.org>
References: <3E64FDDA-1B89-4548-8A52-B7D15BCF3E40@terreactive.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3E64FDDA-1B89-4548-8A52-B7D15BCF3E40@terreactive.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Egon Burgener <egon.burgener@terreactive.ch>
Cc: netfilter@vger.kernel.org

Hi,

Egon Burgener wrote:
> Hi
> 
> I am building a firewall with
>   kernel 2.6.29.6
>   iptables 2.4.4
>   conntrack-tools 0.9.13 (FTFW mode)
>   heartbeat version 1
> 
> conntrack synchronisation works fine except NAT traffic. If I do
> conntrackd -i on the active node I see the NAT information in it:
> 
> tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403
> dport=80 src=12.129.147.65 dst=84.73.54.61 sport=80 dport=2403 [ASSURED]
> [active since 48s]
> 
> On the standby node I am missing the NAT information (conntrackd -e):
> 
> tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403
> dport=80 [ASSURED] [active since 91s]
> 
> Has anybody a hint?

The NAT information is there but not listed when you do `conntrackd -e'
but it's built during the commit phase that occurs when your HA manager
calls `conntrackd -c' (see the primary-backup.sh script).

You can verify this by invoking `conntrack -L' to see the result of the
commit. You should see the NAT information at that stage.
