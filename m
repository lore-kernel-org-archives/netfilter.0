From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Display Masquerade mappings
Date: Mon, 2 Oct 2023 13:29:06 +0100
Message-ID: <20231002132906.b2ffdc73b97f3aab16b8b52f@plushkava.net>
References: <CAF0mwo8XPN3O-3tp65bDcXMP1dLhv_Feb=sGSARk8LNEDSyB7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1696249749; x=1696336149; bh=UYkXL1oBvjNUHCl2kRrxtj1VD
        NInE81KfYa7rZlC5UU=; b=GdWic2R/AxKvJHadlSnjBcaaXNPpd1KNPqFj2Xjg2
        m7bUyDJoqaCAK6oAyvvBnftYNyGiTpB+iJsjgp/laqvbSfg1jJOFWQZLdkDAkEbC
        P6l8aPFjcqMq9xzI9DhDdxVL46V9DioQOiB5jtvJ/u+RGvV1WCPVXQ7BrvWXNSSC
        dRo5KjcgEeZRMru8qeIkoNLq33b1hQYWBkYVCb+1qeAMiwQnyAv5dHxo4KTEd3I9
        AKw4TJGREgdRwPGZid+B+gaaXWNgg/I3zSZi8CuqIbcBDbPeOcCgtC7/8wUHun4d
        p5bvaV/nyNBodikH6R43JZmy4YknPM3+x5ruDnerCMcHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1696249749; x=1696336149; bh=UYkXL1oBvjNUHCl2kRrxtj1VDNInE81KfYa
        7rZlC5UU=; b=lMd1eX3i9WvvwTKwL2KozfexdYS8SEGFnkRSb33M1MvLQr9FdTq
        m1r509auGe7TUtVPMqPNkHtzv7EhLRX2jIE8DFMhJBCaTe2I/ZSQIqvXq3aVdcgI
        yoiXuNuCGOxpjnbojoPb1dZPeQJNZRxymRc2EanhgNlGf9rBfZzYCqVevrc/pkEf
        /xzfPoL/KQMo0hBYwzR7lonxnM/oXaoGKMHt8+BzODTqwFxtM8dZIIQ7i9Om7R6G
        iJQ6qNiKI0VbMsUR1nRrnazXmzQ6X4yCWzPESqppPaWB8/8AJk+AbDMo/rHc5ndO
        0Uv/aw6ExQKSzSUbTJFlGaoIqBgayHzJIkA==
In-Reply-To: <CAF0mwo8XPN3O-3tp65bDcXMP1dLhv_Feb=sGSARk8LNEDSyB7A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Crossley <p.t.crossley@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2 Oct 2023 13:21:55 +0100
Paul Crossley <p.t.crossley@gmail.com> wrote:

>  I can't help feeling that this question must be answered in the
> archive somewhere but I couldn't find it.
> 
> I am successfully using MASQURADE.
> But the diagnostics only allow me to see my RULE when  I actually want
> to see the dynamically created mappings!
> 
> Is there a command to do this?
> e.g. display something like:
> 
> Inside.                          Outside (eth0)
> 192.168.1.5:4000 -> 203.0.113.5:4000
> 192.167.1.6:4000 -> 203.0.113.5:1024

See conntrack(8) from conntrack-tools.

https://conntrack-tools.netfilter.org/

-- 
Kerin Millar
