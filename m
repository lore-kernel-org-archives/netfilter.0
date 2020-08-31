From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Nftables src NAT with port range allocation
Date: Mon, 31 Aug 2020 17:36:44 +0200
Message-ID: <20200831153643.GC2725@salvia>
References: <CAK+5afBrW7h=YQ5eCL0DfDguLd44Os=rwe-_1=xWVMaP8nHR9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK+5afBrW7h=YQ5eCL0DfDguLd44Os=rwe-_1=xWVMaP8nHR9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Moore <ridgebacktech@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Aug 27, 2020 at 06:02:58PM -0500, Joshua Moore wrote:
> Hello,
> 
> I am wanting to do a determinate src NAT IP/port range allocation
> leveraging nftables. For example, for every "original src
> address:original src port" there is a mapped "new src address:new src
> port". The original source address is known but the original source
> port is unknown. The new src address is known and the new src port is
> from a known range or ports.
>
> I thought about leveraging maps to do this but I'm unsure of the best
> way to dynamically capture the unknown src address. Any suggestions?

table ip nat {
        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                dnat ip addr . port to ip saddr . th dport map { 2.2.2.2 . 80 : 3.3.3.3 . 443 }
        }
}

This is mapping:

       IP saddr     th dport        IP daddr    dport
        2.2.2.2  .     80     ->     3.3.3.3     443

IIRC, this is available since nft 0.9.4, I'm testing with current git
snapshot.
