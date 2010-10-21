From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 12:32:47 -0500
Message-ID: <4CC0793F.9020703@riverviewtech.net>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/21/10 11:42, Mateus Caruccio wrote:
> In the end, we came with a very simple solution (no iptables/ip 
> needed):
> 
>    # ifconfig eth1 PROD_SRV_IP netmask PROD_SRV_NETMASK promisc -arp hw 
> ether PROD_SRV_HWADDR up

That looks like you bound it to eth1 when you were talking about eth0 
before.

Are you using eth0 at all?  Or does the box have two nics (0 & 1) in the 
same subnet?

> That is it !

Simple solutions are nice.

> All traffic targeted to PROD_SRV_IP is now being accepted by our 
> mirrored eth1. Since this is an interface aimed to tests only, no 
> matter what's being accepted.

Ok.

Are you accessing (for management) the dev server across the network at 
all?  Or is everything done on console?

> Thanks Jan and Grant for your suggestions and explanations. That 
> worths a lot!

You are welcome.  I'm glad that you got things working, especially as 
simple as you did.



Grant. . . .
