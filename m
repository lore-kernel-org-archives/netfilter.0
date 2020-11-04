From: Martin Gignac <martin.gignac@gmail.com>
Subject: Trying to provision flowtable returns error
Date: Wed, 4 Nov 2020 00:30:31 -0500
Message-ID: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=pnMxVZ8i806odT8BKE5YJLTWRfzSPeZABdruMMWg6vo=;
        b=aC6i/L+ldhPWjhaOISSh2MUi3GkecN4d6QnBUMdOHu7ETHYvfzmS/TD2AJ7wzawiy+
         NpUe91RcO8FUN3Ekxnqcq1OL9ZTVTXVJsqOUHPIB9SaPY+oQCizzpgwcUJ5SYsLGOcw3
         fgCWBqP16bJI0ySfR47wEmvCHbwWHrg1DdPNK8c6ml33pzas2bC2VRbRBlDfzEzcqhcm
         SCeRm/QeCr8M/6XJACtgEEg0JWc9JEB71KGPOU9ZHtd/Q6JuSRkpWJ2RxcLB6VjeJqjp
         42LMhwwPm5Y4T/41nBQd0hELK7unoJQJxv+agTOYFZezwqm2Q4b5Yb+iClE+IC9rbf2S
         aNww==
In-Reply-To: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I want to try out flowtables and I am trying to create a new flow
table (based on
https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt)
by inserting the below statement in my 'firewall.nft' file:

----------
table inet filter {

  flowtable f {
    hook ingress priority 0; devices = { br0, br1 };
  }

  chain input {
    type filter hook input priority 0; policy drop;

[remainder removed]
----------

When I run 'nft -c -f firewall.nft' it returns the following error:

----------
/etc/firewall.nft:10:13-13: Error: Could not process rule: No such
file or directory
  flowtable f {
----------

I haven't been able to figure out what's wrong about my syntax so far.

Any hints?

Thanks,
-Martin
