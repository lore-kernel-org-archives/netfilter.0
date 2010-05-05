From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: what is atomicity of iptables packet processing?
Date: Wed, 5 May 2010 23:27:37 +0530
Message-ID: <AANLkTinImt-RX4BBQaf641sH3lekA81pC_tsdKEgMGho@mail.gmail.com>
References: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>
	 <alpine.LSU.2.01.1005051843340.2592@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ssODSuape/4isod78vdDFRD944XZ8JIeS3wYZ+99Ios=;
        b=QhKCBes2vx1g014aAUuI0zfyQAWNMrL+4tvF6j58qwSrO1O2XPdBXlwdwy12toXEzI
         VEopRckrymio3zCFmQDsW1M1kobSOdHau9aWoyCbBPylGAEV4AyjV67j5703fLdf3e1U
         jL1rzXt2ujYM9SjxnaHswU8xqIfY+R9zrZvjY=
In-Reply-To: <alpine.LSU.2.01.1005051843340.2592@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Bill Bogstad <bogstad@pobox.com>, Netfilter mailing list <netfilter@vger.kernel.org>

 > On Wednesday 2010-05-05 17:56, Bill Bogstad wrote:
>Since incoming packets may not be synchronized with outgoing
packets, there is the possibility that the INPUT chain rules might be
modifying the connection marking at the same time that the OUTPUT
chain rules are using the mark to modify the packet.

I am a little bit confused .
My understanding is pkts will traverse thru various HOOKs one by one .
PREROUTING -> INPUT etc . So how come ,the same pkt will be marked and
processed at different hooks at same time  ?

Thanks,
Ratheesh

On Wed, May 5, 2010 at 10:28 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Wednesday 2010-05-05 17:56, Bill Bogstad wrote:
>>
>>However, I'm concerned about the atomicity of packet processing by
>>xtables. =A0Since incoming packets may not be synchronized with outgo=
ing
>>packets, there is the possibility that the INPUT chain rules might be
>>modifying the connection marking at the same time that the OUTPUT
>>chain rules are using the mark to modify the packet.
>
> Indeed.
>
>>Even worse, I'm
>>considering building up the connection mark in the INPUT chain one bi=
t
>>at a time and the correct mark won't be in place until after all rule=
s
>>in the INPUT chain (or subchains) are completed.
>>
>>So my questions are:
>>
>>Does iptables/xtables fully process one packet at a time or can
>>multiple packets be in various tables/chains at the same time?
>
> In reality: It processes one packet at a time per CPU. (does
> multiqueue change that?)
>
> It's perhaps safer to assume that any number of packets might be in
> flight on any CPU, even if that does not match what Linux might
> currently be doing. (A bit like 'const' in C. It does not protect,
> but it gives a good guarantee :-)
>
>>If the answer is multiple packets, can someone suggest a way for thes=
e
>>packets/connections to make processing single threaded AND
>>run to completion?
>
> When the connection exchange itself is synchronized, read: TCP
> connection establishment, you can set the ctmark on the SYN packet
> and be sure that it's all done before there will be the SYN-ACK -
> because the initial SYN is only passed to tcp.c after leaving
> Xtables.
>
> For connection-less protocols and changing the mark within
> established connections, it's pretty dim.
>
>>On a related note, how atomic is single rule processing?
>
> Pretty non-atomic. Updating (read-write-cycle) the ctmark is not
> atomic either.
>
>>If in a single rule, I use CONNMARK to mark a connection can I
>>assume that no other CONNMARK can modify the mark at the same time.
>>(--set-xmark involves two operations: zeroing based on mask and XOR
>>based on value which may be a race condition.)
>
> The lowest atomicity level is what the CPU offers, i.e. on
> contemporary CPUs that would mean that the READ of the ctmark from
> memory is atomic, and that the WRITE is. You get some 32-bit value in
> the end, but at least you can be sure it is not 16 bits from before
> and 16 bits from the other thread.
>
>>If there are any other issues involving connection marks/parallel
>>processing/race conditions etc., I would like to here about them as
>>well.
>
> I guess that, if really need be, one could add an on-demand locking
> mechanism (including the penalties) by means of a parameter.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
