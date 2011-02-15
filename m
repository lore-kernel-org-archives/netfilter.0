From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Ebtables usage
Date: Tue, 15 Feb 2011 16:48:54 +0700
Message-ID: <AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacky Lam <lamshuyin@gmail.com>, netfilter@vger.kernel.org

Have you set up Linux bridging?

Here's a reasonably complete guide:

http://tldp.org/HOWTO/Ethernet-Bridge-netfilter-HOWTO.html

Rgds,


On 2011-02-15, Jacky Lam <lamshuyin@gmail.com> wrote:
> Hi,
>
>      I am a dummy about network administration. But I currently setup
> my Linux box as a switch to forward the packet from eth0 to eth1. But
> I find the throughput is not good. It seems the overhead of IP stack
> is too high. I want to know if ebtables can allow me to do the job
> below IP level? If yes, can anyone show me how to setup up that?
> Thanks very much.
>
> Jacky
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
