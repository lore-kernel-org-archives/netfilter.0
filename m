From: Mauro Santos <registo.mailling@gmail.com>
Subject: Re: Help/guidance with automatic CT helper assignment
Date: Tue, 11 Apr 2017 21:14:41 +0100
Message-ID: <bff7d882-43fe-1316-34a8-156605144dab@gmail.com>
References: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
 <0f597416-2d74-d98b-f969-f21391797b6a@familie-kuntze.de>
 <e494d582-2241-2374-bf86-2eb2c421bd22@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=qdPpzjh0wW/aQGhZhplhW3/2+xLNBNdVUhLMUlo39HA=;
        b=h2sLDGdVo/9SVi7EI9VwVZj4PrGVEsnqXnkmiXhAema16YJ91qw+ICWNfx1GSSnvLl
         pSnEuvhWInhOzTpWWsJl+sJ593E25jxbSlH5Iml7AOXkrnYzwynE16TbA1uYsJNCLFvC
         tpZ98jk3mX4D5Pm0GtmekCNOoGqoPJQaJoIz/UQp12Ppdcn4w43Be0McFNi8TSuapA3p
         F3EMJHjUE6l2+GKoniv0eLFsqqo+Y6BVtet0DquUv+a9QrL5tZjvu1f3v9jEMNksHkmE
         zRcb6UDHhhaQkzWEHJZrStPiEXuXRIOyjEZl7bl5MK2EmGC06kvNLSPiUjK1G8aZh2Ck
         +1fg==
In-Reply-To: <e494d582-2241-2374-bf86-2eb2c421bd22@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

Your comment about gre really nudged me in the right direction. After
refining my logging rules I have found that incoming tcp packets with
destination port 21 or 1723 would trigger the nf_conntrack message.

This now makes sense since I have assigned helpers for the outgoing
packets but not incoming packets.

My mistake was assuming that connection tracking helpers applied only
outgoing packets. I was also puzzled as to why udp packets with
destination port 5060 (and other default ports for protocols for which
there is a conntrack helper) would not trigger the message but I assume
that is because nf_conntrack_sip is not loaded.

-- 
Mauro Santos
