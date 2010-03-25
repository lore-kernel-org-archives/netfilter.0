From: Julien Vehent <julien@linuxwall.info>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 25 Mar 2010 20:17:27 +0100
Message-ID: <9661da2402edd9880c000f38833ea360@localhost>
References: <067c83163988908ef546d7ff7f560a17@localhost> <20100325193140.1593fd51@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=lnw-dkim;
	 bh=AVlq1sAZRg9Vnwo904CRICV46osDc4B5lVggar+5GgE=; b=l2wg4w7Jiuy+
	7FtEJzx4HmEN8Opp16unflVdFGif0GEbRA3Wol+5n+uvc/fD4WNB7GSmG3TpZlyt
	KUKpsIkY54T/cUyvM96K9hprBSM0yaUB/mgJomwF+y/jdSo6JYwyHZGuFz8VRHMg
	V/LdF80Hsj6QcZdplp20Yu+jtQFEqNM=
In-Reply-To: <20100325193140.1593fd51@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, 25 Mar 2010 19:31:40 +0100, Marek Kierdelewicz <marek@piasta.pl>
wrote:
>> Hello folks,
> 
> Hi,
> 
>>I observe unused bandwidth on my QoS policy that I cannot explain.
>>Conditions are: I have a HTB tree with 8 classes and a total rate of
>>768kbits. I use the ATM option so I assume the real rate to be
>>something close to 675kbits (about 88% of the ethernet rate).
> 
> Try adding p/bfifo or sfq qdisc under the classes. See if it chances
> things. Don't ask me why. It just solved some problems in my case. W/o
> qdisc I could sometimes see stalls like yours.

I have pfifo under class 10 and 20 and SFQ under the others.

From my point of view, it looks like class 20 is borrowing, so the other
classes are not authorized to borrow whatever is left.



> 
> Best regards,
> Marek
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
