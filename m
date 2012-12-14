From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Fri, 14 Dec 2012 07:17:19 +0200
Message-ID: <CA+4D1sfNruK67MHx3BhuRK3SphKrCnw5dKzF7edVanuFhrkDZw@mail.gmail.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
	<3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
	<50B84725.3080608@nottheoilrig.com>
	<50B851E8.8070107@ngtech.co.il>
	<50BC6639.3090502@nottheoilrig.com>
	<50BC9297.3050507@ngtech.co.il>
	<50BCB80F.4090208@nottheoilrig.com>
	<CA+4D1sfikOc6BqVpGNxyYUOv-CA9j0ofSf-QJ_Fvz+JSw=SH3w@mail.gmail.com>
	<50BF1011.1050709@ngtech.co.il>
	<50BF5786.3050208@nottheoilrig.com>
	<CA+4D1sdBSzM6QKH1xrgXsG3SS1Quu63omvJtGPDyt1b1gDgiiA@mail.gmail.com>
	<50C60B48.70003@nottheoilrig.com>
	<CA+4D1sdwNr3zi41YaKDBg3x7O8k1VxnfbCy1RTDX=KsrTLKvow@mail.gmail.com>
	<50C8A1D0.9010303@nottheoilrig.com>
	<CAKTPYJT6VsNASyLN1Z4qEagSnyA5sZrBztuWr+5wqCHPoK1GmQ@mail.gmail.com>
	<CA+4D1scXWSk=jy7-H2+1WLdopASmON03a0KpKzcf=VxYkdADBQ@mail.gmail.com>
	<CAKTPYJQ74r2HUsk1duKcEzT71AVWKBt4s+opUFjGh=T+n3V_EQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=6dhxHS+5n7C/VxoFiCZLB2d7WQbpcMaKVAmvGxxDmVo=;
        b=phILM3cub7lJ9G9oozxekqT4A1+L8ESo0d3hsHg3r2WAVxW3Istu/Gbr687g3TCoEr
         34Vh1ZHryFTp8qOi0ZYiAq+148eTul+VRGv64gAEDMESppRF4a/Ei55XIMR6F758hOkr
         qxRNIDbKMzVTB0hIMmQOlyFl7eIks5rxZoGrHQYKVCyXbGc5dpGkpq8/jNNGG2LoyvOk
         21LdB2DfgvhMTbgbwrN9yfjli8XoKPDeBpaCSiHEUUugSPq5ht7NK/BvlU/BxS3JywBa
         j9Ng4CqOHQOUL9+1gGdJXTTssfHfeQrPj+TUW0OVVV/FyQgZLmKV/EDINF493dJmKDT/
         Nnxw==
In-Reply-To: <CAKTPYJQ74r2HUsk1duKcEzT71AVWKBt4s+opUFjGh=T+n3V_EQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Collins <bsderandrew@gmail.com>
Cc: netfilter@vger.kernel.org

2012/12/14, Andrew Collins <bsderandrew@gmail.com>:
>> The traffic will be ingress on eth0.2, but it will be treated as
>> egress on ifb0 device.
>> Using ifb is a common scheme to overcome the above-mentioned limitation.
>
> From the point of view of queueing/TC this is true, however it will
> not pass through the neftilter hooks while going through the IFB, so
> iptables/conntrack will still have no chance to see it until after
> it's already egressed the qdisc attached to the IFB.
>

To my shame, you are right.
The IFB device has no netfilter hooks, so we can not use iptables to
mark traffic on it.
The external incoming traffic should be shaped on the internal
outgoing interface.


-- 
Best regards
Anatoly Muliarski
