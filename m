From: Fred F <frederik.vogelsang@gmail.com>
Subject: nftables: Define variable with IPv6 suffix match in nft script
Date: Wed, 23 Sep 2020 21:19:52 +0200
Message-ID: <CAJqja9fhYzAQ-cYcP_HnB5Mmd2UKZgvL8+DG0nT2GRdhWB9N_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lW1IwlWaQDWXoV2dJr4QTBuNQQbYHz0IQj+QQUWVmwU=;
        b=haPFvwcE7BXpA5lxXGxn1Ts27qKQHHBfSKnLLj7eoy8VfqletdKOsi/AeUVo7nB4KL
         6Ce9ngpkQUzkykiyg2rynAUFtMWROS1PyhB/meadz58cy2uiDmeFhItUEkPjdf9Vf6an
         p8aQsFuWMVAGLpBrJfc0LKIrqPetREhHBNv5yW8zjCoVy1hWmAfTcfW2mAWlmJ/ojkTf
         mLt1kJTpWnQO0bb4cZGq8arXJ8WUlo6C5SVvY0FVFrJxzEePc2t2u0saaQsA3MZun47b
         9uO6/XC/TciC7jgqnTHukNCE+Ds29j02AyLFSjpE3O4SqH/L07AIty7ZPnC8LHG+XQyu
         3t3g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am having issues defining a variable which contains an IPv6 host
(actually a suffix match). This is the rule in question which is
working:

chain forward {
  # relevant rule:
  iifname "wan" oifname "lan" ip6 daddr & ::ffff:ffff:ffff:ffff ==
::192:168:1:1 tcp dport 443 accept
}

Now I'd like to store the suffix match in a variable, as I need it in
various places, like this:

define ip6_testserver = "& ::ffff:ffff:ffff:ffff == ::192:168:1:1"

chain forward {
  # relevant rule:
  iifname "wan" oifname "lan" ip6 daddr $ip6_testserver tcp dport 443 accept
}

Unfortunately this is not working. It seems like the value of
"ip6_testserver" is interpreted as a hostname when written in quotes.
Without the quotes I am getting a syntax error. Any ideas how I can
fix this? Are there any other notations for the suffix match? Back in
the old ip6tables days it was written like
::192:168:1:1/::ffff:ffff:ffff:ffff.


Best regards,
Frederik
