From: "Billy Crook" <billycrook@gmail.com>
Subject: Re: Setting up a proxy with iptables
Date: Tue, 5 Aug 2008 12:28:06 -0500
Message-ID: <a43edf1b0808051028r6d633d3k2b20cae70edc0f93@mail.gmail.com>
References: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
	 <48941506.6080409@unipex.it>
	 <50805eb10808041406x545a5ed1q6da8302370a0accb@mail.gmail.com>
	 <4897F3CB.8090103@unipex.it>
	 <50805eb10808050946s5678b584ud77df506e1692a31@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=rm2rKdoJn98MXStpr0OGsHXUWc8uZf0Ar24YLlphG9Y=;
        b=nCzi6SBKNSpReIHZ39mSMXQR3QM6gbRjjG3q9NMoueKoxyonO/Zwg7+4m1EbfrfK64
         ckGwcoRISRPJGNGoy0r/fhRum+kS87ztJ05P+o/3RwuaAi9abSz+0aeBy5BS4UGbCP8a
         Fir0yep8bFuzYvKvK5h1Czr+38LmX/ulaVoIY=
In-Reply-To: <50805eb10808050946s5678b584ud77df506e1692a31@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shawn Fitzgerald <sargon97@gmail.com>
Cc: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>, netfilter <netfilter@vger.kernel.org>

We all thought outbound meant outbound from your network.  Your use of
-i eth0 also gave that impression since -i isn't valid for matching
traffic originating on your own machine and travelling out onto the
network.  The PREROUTING chain is never matched by traffic originating
on your own box and heading outward.  Only the OUTPUT and POSTROUTING
chains are.  The REDIRECT target is valid only in REROUTING and
OUTPUT.  Try using it in OUTPUT.

On Tue, Aug 5, 2008 at 11:46, Shawn Fitzgerald <sargon97@gmail.com> wrote:
> I have not logged any incoming packets. I only want to redirect
> outbound traffic to localhost 8080. I have only one nic card, eth0 and
> it is up. Is it possible that some kernel configuration is causing
> problems?
>
> Thanks, Shawn
>
> On Mon, Aug 4, 2008 at 11:31 PM, Michele Petrazzo - Unipex srl
> <michele.petrazzo@unipex.it> wrote:
>> Shawn Fitzgerald wrote:
>>>
>>> I did an iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
>>> REDIRECT --to-ports 8080 and nothing. Just to make sure the firewall was up
>>> I entered iptables -A OUTPUT -j DROP and it did block all outbound traffic.
>>>
>>> What am I missing here?
>>>
>>
>> Nothing it's not an answer.
>> How it's your lan? How are connected your eth0? Have you log the
>> incoming packets *before* redirect? Have you tried to tcpdump?
>> Too little infos...
>>
>> Michele
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
