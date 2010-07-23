From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Regarding write send a packet to network that received in 
 NF_IP_PRE_ROUTING
Date: Fri, 23 Jul 2010 09:24:39 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007230923580.10737@obet.zrqbmnf.qr>
References: <AANLkTilFBhfh-jBBaO4eJAzDw0gU_PhBEcEc1mdsUjjo@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilFBhfh-jBBaO4eJAzDw0gU_PhBEcEc1mdsUjjo@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Padmalochan Moharana <padman.m@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-07-20 12:49, Padmalochan Moharana wrote:
>i am facing problem during sending a packet that received in
>NF_IP_PRE_ROUTNG hook to network again  .
>After receive a packet i have update the source and destination IP.
>then i have recalculate the checksum for IP and UDP layer. then i have
>to send that packet to network by using below command.
>
>	NF_HOOK(PF_INET, NF_IP_LOCAL_OUT, skb, NULL, skb->dev, dst_output);
>	ret = NF_STOLEN;
>	return ret;
>
>But after loading my module kernel hang when it receive any data from peer.

Without the code, nobody can tell.
