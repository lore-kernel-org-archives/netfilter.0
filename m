From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: counter target
Date: Fri, 25 Aug 2023 16:06:54 -0500
Message-ID: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4RXXZf4lvszB3DjD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1692997625; x=1693602425;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JKGhUXxGT9reJcdq0yktXbxtqXeHc+1oBT0DHsKk6v0=;
        b=LVyT5/TEzsNan5Us8wSXFgGC/ebBA6d81jI/l6pyT29Q9WeapleBmfBxh3NU6rcfim
         KJt0NPVbQqo1zxNuW55IecdX0ErW49A9QkEwRBolkCAx1EHiqnMVSxpWJLGuszW3akNF
         nO519Nn73t24YMNm5ljKi2hAr1Z/BwXjnerDm1Paw1PhQf6A+QM6UoKMzft14x43tqLG
         WbxQjCJW01KMUAh3IdjRCFWJqxEmB0EDFWanKCvqFIFjeliUBSNUF24FSo+hN3UlJnUr
         9ELUxx6DJGvZHr1/7kIH19DsoJC3/p+x16kz+shyoy2MmsFILxjcJMaI36bzpug88jRu
         iLUA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Greetings netfilter,

I have a question about the location of a "counter" statement.

I see from the wiki [0] that placing a counter for the default policy
comes *after* the policy:

table ip counter_demo {
    chain IN {
        type filter hook input priority filter; policy drop;

        protocol tcp counter
    }
}

That feels a little counterintuitive to place a counter after the
packet "appears" to have been dropped.

Thus, do I place other counter statements *after* their corresponding
netfilter stanzas:

table inet filter {
    chain input {
        # accept traffic originated from us
        ct state vmap {
            established: accept,
            related:     accept,
            invalid:     drop,
        }
        counter
    }
}

Or do I place the counter before:

table inet filter {
    chain input {
        counter

        # accept traffic originated from us
        ct state vmap {
            established: accept,
            related:     accept,
            invalid:     drop,
        }
    }
}

Or does it not matter?

Thanks for helping me understand.

Cheers,

-m

[0] https://wiki.nftables.org/wiki-nftables/index.php/Counters
