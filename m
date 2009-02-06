From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Empty Target
Date: Fri, 6 Feb 2009 14:05:40 -0800
Message-ID: <498cb439.20018e0a.3be8.ffffc9e3@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=JbqREZfy+bHqpyCgORsy1esvI398F5TAGD/VrCKvqgc=;
        b=GAtXoYCwiYJP3Oi9WpD+Fj4WM2gPojNWz7hDsx63mDbsvuNzcnY1JmL0lRPX3EGbtM
         EI6PD8nM5TKzObVQnH/xp8jc6JPRQdCgEohY32sld9VNwYpYlo3/xyKB58vdIO9xEmCZ
         3SMr7YaLWd6+7wGJLGtCJtcGBIX2w+4jTFb1E=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am trying to troubleshoot an iptables rule set, trying to understand where
different packets are going. I have found that using "iptables -L -v" is a
useful tool, with the counters telling me what's going on.
To "trigger" counters I currently use LOG rules. I would actually prefer
some sort of empty rule; a rule that would do nothing beyond increasing the
counters.

Does something like that exist ?
Seems trivial to implement. 

