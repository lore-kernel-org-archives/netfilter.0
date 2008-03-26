From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: UNTRACKED packets are identified as INVALID
Date: Wed, 26 Mar 2008 17:42:01 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803261735061.22661@fbirervta.pbzchgretzou.qr>
References: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Sharon Tal <shatal@websplanet.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-03-26 14:29, Sharon Tal wrote:
>
> Hi there,
> I have 2 web servers behind an iptables based load-balancer, and I'm trying
> to setup a graphics web server on the load-balancer, so that if a simple
> static file is requested it will be able to respond instead of forwarding
> the request to the web servers.
>
> I've been trying to do that by matching packets at the raw table, setting
> them to be UNTRACKED and leaving them on the LB.
> The problem is that all UNTRACKED packets are identified as INVALID as soon
> as they get to the mangle chain and dropped.

I would have a hard time reproducing it --

# iptables -t raw -A PREROUTING -s 134.76.13.21 -j NOTRACK
# iptables -t raw -A PREROUTING -s 134.76.13.21 -j LOGMARK
# iptables -t mangle -A PREROUTING -s 134.76.13.21 -j LOGMARK

# ping 134.76.13.21 -c1
PING 134.76.13.21 (134.76.13.21) 56(84) bytes of data.
[352431.272089] nfmark=0x0 secmark=0x0 classify=0x0 ct=UNTRACKED ctmark=NULL
ctstate=UNTRACKED ctstatus=NONE
[352431.272249] nfmark=0x0 secmark=0x0 classify=0x0 ct=UNTRACKED ctmark=NULL
ctstate=UNTRACKED ctstatus=NONE

# iptables -t mangle -nvL PREROUTING
Chain PREROUTING (policy ACCEPT 145 packets, 115K bytes)
  pkts bytes target     prot opt in     out     source               destination

     1    84 LOGMARK    all  --  *      *       134.76.13.21         0.0.0.0/0
         LOGMARK level 4 prefix ""
     0     0            all  --  *      *       134.76.13.21         0.0.0.0/0
         ctstate INVALID

Now I am not sure what system you use, but this is my output on
kernel 2.6.23.
