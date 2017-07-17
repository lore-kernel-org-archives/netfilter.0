From: sorcus@inwebse.com
Subject: Re: What wrong with snat in nftables?
Date: Mon, 17 Jul 2017 21:24:00 +0000
Message-ID: <3160df4f931c5b244f092aebdfa409b5@inwebse.com>
References: <691d19d7765158dc9d10dd62b5033536@inwebse.com>
 <CAEzD07JY4pix=dh0W7rZ1MU0MxCo=Ky32o3EFtbf9i44B+7BMQ@mail.gmail.com>
 <e55eeed4d10d0209dc4441a83b1bc922@inwebse.com>
 <6687da5a7ee70c19e1c3b41fea5fb20f@inwebse.com>
 <b9e98380dacecbec99d0e0aea7847042@inwebse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inwebse.com
        ; s=mail; h=Message-ID:References:In-Reply-To:Cc:From:Date:
        Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HS+2tttC+q9v8+XmwBAnghgsP14olMWnWZ6I+CkyL+c=; b=o6X0tGOuLtgvAfRzauRu7YbwOH
        h1oh4MsmUZ+xvlrq6eIUstDMRM0I/nioMGw9kEToSJJ5+FrKGjQmAJ0wSiUDh++p56g0H6eOUbJjK
        CtLiEPP84JeAE3SxRZn0y18Xpgj0z9IbRr4iu6FBHmg14swWGkHMK8tvEJBo9lGhIfoY=;
In-Reply-To: <b9e98380dacecbec99d0e0aea7847042@inwebse.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>

Solved. http://marc.info/?l=netfilter-devel&m=150027256708621&w=2

You are probably lacking the reply NAT chain, which needs to be 
registered.
https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
I'm updating right now the wiki to put this in bold.


On 2017-07-15 22:47, sorcus@inwebse.com wrote:
> Output for command nft --debug all -f ruleset
> 
> https://gist.github.com/MrSorcus/2c8c65461e3c65fb70364f3a70d95439
