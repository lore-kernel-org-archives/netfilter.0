From: J Webster <jw.jwebster@gmail.com>
Subject: Re: using iptables to speed limit connections
Date: Wed, 26 Oct 2011 14:44:47 +0100
Message-ID: <4EA80ECF.8030206@googlemail.com>
References: <4EA7EEF6.4000808@googlemail.com> <Pine.LNX.4.61.1110260919400.24418@soloth.lewis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=rAQtCtW6JNmfwf3u1IcRAh+PnwBSxSkEHlru7vSJ1a4=;
        b=hG+hjGEoxbMcPbsKRBD8x4NvBUIIIGajHFKIMfuo6NPtD0PGqvzCtbpzNHhrBVeT/s
         eR5xkzdSNH+wNELljgeF8/CX/g1hovesJRwCj0lsmiMktsC94PZFQ8uI6c4HMv3etILu
         sSdhwQgQYtqdum10Vu5CR/cvJ2L5wl6QwZFBI=
In-Reply-To: <Pine.LNX.4.61.1110260919400.24418@soloth.lewis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jon Lewis <jlewis@lewis.org>, netfilter@vger.kernel.org

The problem is not so much limiting the overall connection but limiting 
the connection of each individual vpn user to 2Mbps.
So, there is 100Mbps to share between 10 users, they should each get 2, 
giving a use of 20Mbps.
Also, I wasn't sure from those pages whether this should be applied to 
each IP on the VPN network 10.8.0.0/24 or every IP with outgoing packets 
but that would then limit the server to 2 Mbps.

On 26/10/2011 14:20, Jon Lewis wrote:
> On Wed, 26 Oct 2011, J Webster wrote:
>
>> Is there any easy way to speed limit connections on a VPN to 2 Mbps?
>> My server is 100Mbps but I have connections on a VPN of 10.8.0.0. so 
>> need to limit the outbound connection from 10.8.0.0 to 2 Mbps.
>> I tried reading the stuff on leaf but the tutorial doesn't seem very 
>> straightforward and there is not much information on this on the net.
>
> You probably should have a look at 
> http://lartc.org/howto/lartc.qdisc.html
>
> ----------------------------------------------------------------------
>  Jon Lewis, MCP :)           |  I route
>  Senior Network Engineer     |  therefore you are
>  Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
