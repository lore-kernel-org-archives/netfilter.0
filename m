From: Andrew Collins <bsderandrew@gmail.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Thu, 13 Dec 2012 15:06:14 -0700
Message-ID: <CAKTPYJQ74r2HUsk1duKcEzT71AVWKBt4s+opUFjGh=T+n3V_EQ@mail.gmail.com>
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
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=SSGfbtHb+H6eH1+bMZ2wEK7j3VNvuM5jrArf7bnODbQ=;
        b=JBBxRHyRXN7bsj0f2FIyuShdkSXPFN58WraLl3zaKmv3+OOUokJ7p+e9ZkMA+eTX+N
         it/oob1DvGd2Z64bqVjZo5U2NTRaWXHfX0tuLdtVPVY5M8vpyY/5IrRNLZsujVuz6gR5
         0qoh8TlaRshgVBNuW770ypqeM2SJWFfR1sXY4Vua9VuVHbq1FEx+s0Op8SaMmeDHc2mF
         EqP/cjekhNtq8UUM0LOkJmzqk9nmS6HVcH/l7gniDGz2K10WAXxpfuV/qZG6isG/6UmB
         mu6zCC/Gq9yIhsJ/xz/Z0UM+ap9v7yODPUbk7lk6+GCvkVHYaNRHvfYjqs0EUaIfJuN8
         vsbQ==
In-Reply-To: <CA+4D1scXWSk=jy7-H2+1WLdopASmON03a0KpKzcf=VxYkdADBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

> The traffic will be ingress on eth0.2, but it will be treated as
> egress on ifb0 device.
> Using ifb is a common scheme to overcome the above-mentioned limitation.

From the point of view of queueing/TC this is true, however it will
not pass through the neftilter hooks while going through the IFB, so
iptables/conntrack will still have no chance to see it until after
it's already egressed the qdisc attached to the IFB.
