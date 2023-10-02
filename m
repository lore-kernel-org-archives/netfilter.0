From: Paul Crossley <p.t.crossley@gmail.com>
Subject: Display Masquerade mappings
Date: Mon, 2 Oct 2023 13:21:55 +0100
Message-ID: <CAF0mwo8XPN3O-3tp65bDcXMP1dLhv_Feb=sGSARk8LNEDSyB7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696249325; x=1696854125; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUPeNl8toGRH/uuq1FrRUqX4uGOjHNcXusrPPIhJzRE=;
        b=bUKKck+Fz2qhv3esCwywszJ7wBpWczEYKvyHIYy8bN7rVfrjDmr20wj6l0jJJm9QD4
         nMvC/wQHgtZyak1Vqx0fmb7dq60xsypRcwyVmgHcBpWkloh0aJDrP4+5oaw8wH3aQrpc
         o6XZVIc5uLakv+rblNyLy0V4wZggoz6pgKdWKXylYbae9GLT2s7q39j8Xvf7AyI+aXjA
         zweFB4NPGe1LWMoJ3LuuuqSoI2XQJH4XnPXg5pGxYliavYeGLsW2ND38+DVINZZnV6xH
         Y+cSEfTVwT/Xzp4mGrJLz3X6qj8RTsLWLtgRILRKb1HBbZNeiC4laQE5/W48wIwR5lVE
         q8Rw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 I can't help feeling that this question must be answered in the
archive somewhere but I couldn't find it.

I am successfully using MASQURADE.
But the diagnostics only allow me to see my RULE when  I actually want
to see the dynamically created mappings!

Is there a command to do this?
e.g. display something like:

Inside.                          Outside (eth0)
192.168.1.5:4000 -> 203.0.113.5:4000
192.167.1.6:4000 -> 203.0.113.5:1024

I would imagine the developers needed something like this while debugging it.

Thanks for your help.
