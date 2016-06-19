From: "Irwin L." <biatche@gmail.com>
Subject: nftables: drop ssh brute force with ip block
Date: Mon, 20 Jun 2016 02:24:11 +0800
Message-ID: <5766E34B.4040008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-transfer-encoding;
        bh=8clYOynlgboACW2ws0p1Tuk9c6lBJrLlPob0UMjUG9U=;
        b=q1pyNyHyvI+KkDOEsrGbfAUbH1XX3qtEcPSgTBcuoXVW4Kr+itn/iK6wpM12r5zFWP
         F9WU7JGZKIP0uHib07zCK6Lu4TnixaukoClOE0jPwEY0Sj49ugjb6aflyWVNpczGIdt3
         nHZoY7RnvqORke9Rlu8+8TQf7Q2exgQXBsVH2KyWxxT4hlrre9ll9ToyBA/7TtrBXwzp
         rRXH/osX14GhiNOSsnQVWtUBm7fUd+6BfVZStZuNmCMdNXC1UG7ZadmuE5/S2pmpfj3+
         f4GcB8dTABTSJtXfeuLKZuhCtSJ93BZ67P+MfU4xlN9lHBdOvjnUrsOuJlbeX47Kwig2
         AFew==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

As subject says.

tcp dport {22} counter limit rate 3/minute counter accept comment "avoid 
brute force"

I've tried something like this, but it seems to limit ALL ips.
I would prefer to block the ip address for 24 hours or something.

Please suggest

Irwin
