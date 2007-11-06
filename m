From: "Srinivas Murthy" <codevana@gmail.com>
Subject: New tables
Date: Tue, 6 Nov 2007 09:29:49 -0800
Message-ID: <df1bdeb10711060929m24071b3cx5c1af68d096edd2c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=4UE9tHb8H+6tf5cOkDJz8x7y0q+Y7S4Ul0EYQsssi3Q=;
        b=Es6YxUH/RFWj4qhxfL4/8xmUyNJQl7MENqtQEWwDljjUqyskuCg+t3Xz/6coNGdVwaO/k/zwk1GlZL/ujxIuXGtDqYRGGa2AT4BXgIEZQdqvCF3V2D4jl879x8x5Lz0G41xHPb4MotvgeBPs/IB5iHzfmkBIVg0bzPt7lcVW+z0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I need to insert rules in the prerouting, postrouting, forward hooks
with priorities diff than what is defined for the built-in chains for
the existing tables ("mangle", "raw", "filter", etc.). Further, I need
to insert rules and manipulate these from within kernel space.

For this I'm creating some new tables, and define valid hooks for
where I want to insert rules. For example, I'm using iptable_raw.c as
an example for what I need to do to create a new table.

However I see that in the various files for the targets
(ipt_CLASSIFY.c,) etc. there seems to be some work done based on the
table ( Ex. if (table is "mangle") etc.).

Is that something I need to worry about if create new tables?

I think if I register these hooks from the new table (just as is done
in iptable_raw.c), that should be sufficient to make sure all the rule
invocation, matching, etc. would work as is expected. Isnt that right?

Is there an easier way to do this than create new tables?

Thanks.
