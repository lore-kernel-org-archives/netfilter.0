From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 13:21:14 -0500
Message-ID: <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5Kqu5BFzkSCZo6HTxClqUMRUWoUuYLXXg8K5iUNMQ0=;
        b=VLR/NQG2tF5TcBUtOcwWWvqnLP7hoi1UmrZv5cXsWeisiYtOy7aahqe+KrtPdhmBVY
         17NJ0RrvCF7n8OKmBZBZPzV1Cr7GV+ItqfA3NYJ1vuSNp9KI+aGpn2NGC+JcjsSvI22u
         wp03CVi3R73WvnzgdVXgtQbIVDFX8GcvSwNYD57f7Gs98SVVL+oVvZ29JUFasg9ZONwb
         KnZqgbZWomjjDPhoR5l+SzbdRf4PfRL0ikDCgzh6S89fH4t79JQ+OihRGKwv1wZV+G/n
         H4OngPZce5FLbVj8/2WAILEK2tBK0NtTC/68VWzJvNmzxM/LfG/+vcogv1TQQxcgkurl
         N3zg==
In-Reply-To: <20201105170754.GB25824@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

> Can't nm execute some action when an interface comes up?

Looks like there might be:
(https://askubuntu.com/questions/1111652/network-manager-script-when-interface-up).

> That way you could just add the flowtable later.

However, this would only insert the flow table statements on server
bootup. Since '/etc/nftables/firewall.nft' ttself *wouldn't* contain
the flow tables statements, any 'systemctl reload nftables' or 'nft -f
/etc/nftables/firewall.nft' action (to apply a rule change, for
example) would essentially get rid of the flow tables mechanism from
the running system, wouldn't it?

-Martin
