From: Peter Hoeg <peter@hoeg.com>
Subject: Running nft --check as non-root
Date: Thu, 11 Aug 2022 23:53:35 +0800
Message-ID: <874jyiu661.fsf@hoeg.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hoeg.com; s=google;
        h=mime-version:message-id:date:subject:from:to:user-agent:from:to:cc;
        bh=ND6iEQu9mFwbPTZpgXGpGh4ikRO8ukxhRJ3RtYjzyj4=;
        b=A+wXN1UGJTfBvNwLehG/L38yLjeJvjxVhRL6XjJ6FaqgjQgtJCzqPCCZfBgZJmeXaT
         /AKPiS6dnsvGHLN3RgPZmA945dE3ql4xot/UOjlcn7b6Xte5+ikMw7MOzoyGjBvpcbJ5
         EnkZDC5Xpmon8wdCo8bljbrrXk/BDrrczHkF4=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Hey all,

as part of deploying nftables rules on NixOS, I want to check the syntax before actually trying to deploy them.

Now, nft --check --file works fine when run as root but the builder used does not have root permissions (or access to sudo or anything like that). Is there any particular reason why nft --check needs to run as root or any way to make it work as !root?

$ nft --check --file foo; echo $?
1

$ sudo nft --check --file foo; echo $?
0

Thanks in advance,
Peter
