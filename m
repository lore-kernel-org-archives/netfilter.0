From: ajay seshadri <seshajay@gmail.com>
Subject: Re: Query regarding NAPT using iptables
Date: Thu, 10 Mar 2011 18:31:14 -0500
Message-ID: <AANLkTikfurWjwBvv721X_ofvAQA3GO9+=NEV=OL086rx@mail.gmail.com>
References: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
	<AANLkTinTwUOC8MdCrso_UpMWf+ZHCmrHTXWADi=8DhWU@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=TrUowYEl5w1a/YSQc0fzShm5zLf5CRFYVIUOTacnpo4=;
        b=tSNOCK0t0epcggUUPInswu/1HMhl1IxnUNt0BMIXAQYpZSTb5S3dcUJExxL4N7D0Df
         DpYXjaLEPkR9ARkmMFgqMBzt8xDkZXlwlV78Zrn+6KawE0mNZiJcy1H5DX7Lr8uTJ9VH
         XnTJbBCTQpKy3/dbwvGD/ZZ9HDQEBJpkSgEEU=
In-Reply-To: <AANLkTinTwUOC8MdCrso_UpMWf+ZHCmrHTXWADi=8DhWU@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

Thanks a lot for the information.

So in case of protocols like ICMP without ports, we specify -j SNAT
without ports. Wouldn't this mean allocating separate addresses for
such mappings? (isn't this similar to plain NATing ? or am I missing
something here?)

Thanks,
Ajay



On Wed, Mar 9, 2011 at 6:19 PM, Pandu Poluan <pandu@poluan.info> wrote:
> (sorry for top posting; Gmail mobile client)
>
> I'll try to answer your questions.
>
> 1. For an example: ICMP does not have ports. You should split the rul=
e:
>
> -p tcp -g nr_napt
> -p udp -g nr_napt
> -p sctp -g nr_napt
> -p tcp -g nr_napt
> -j SNAT (without ports)
> -A nr_napt -j SNAT (with ports)
>
> 2. Yes, with helper. Prior to the SNAT rules above, place a rule with
> helper match:
>
> -m helper --helper ftp
>
> 3. Netfilter will perform a defragmentation in this case.
>
> 4. One-to-one will happen only if (in the case of SNAT) you use a -s
> match. If (like in your example) you use a -d match, it will still be
> NAPT, and port multiplexing will still happen.
>
> Others, feel free to CMIIW.
>
> Rgds,
>
>
> On 2011-03-09, ajay seshadri <seshajay@gmail.com> wrote:
>> Hi all,
>>
>> I was trying to write some iptables rules to perform NAPT. I had the
>> following doubts:
>>
>> 1. When I specified the following rule:
>>
>>>sudo iptables -t nat -A POSTROUTING -d 10.20.3.81 -j SNAT --to
>>> 10.19.11.1:1-500 I got the following error:-=A0 iptables v1.4.4: Ne=
ed TCP,
>>> UDP, SCTP or DCCP with port specification.
>>
>> Is there anyway to specify a single rule to cover all the protocols?=
 I
>> got the same error when i specified '-p 0'. Are there any protocols
>> that don't work with NAPT?
>>
>> 2. Would NAPT work in case of application layer protocols like FTP,
>> where the application code requires port numbers? I came across ALG
>> and conntrack modules. I don't really have clarity in this regard to
>> know if there are any application layer protocols that would fail to
>> work with NAPT. If yes, is there anyway to get around this?
>>
>> 3. If I am not mistaken the NAT RFC states that NAPT won't work if t=
he
>> packets are already segmented as the segments don't contain port
>> information. Is there anyway to get around this? Also, are there any
>> such scenarios where NAPT would fail?
>>
>> 4. If NAT is done instead of NAPT, by specifying a one - to - one
>> mapping for each flow using iptables, does that guarantee that port
>> multiplexing will not be used?=A0 Is NATing more stable that NAPT?
>>
>>
>> Thanks,
>> Ajay
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>
