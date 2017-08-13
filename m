From: J Doe <general@nativemethods.com>
Subject: Re: Question regarding meta skuid
Date: Sat, 12 Aug 2017 20:56:34 -0400
Message-ID: <A39C618A-B11D-42AC-B2AD-2AAE07196D4D@nativemethods.com>
References: <5EB94417-274C-45CD-BA35-B7C545491C34@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5EB94417-274C-45CD-BA35-B7C545491C34@nativemethods.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I was wondering if anyone had feedback regarding limiting which accounts on a host can receive traffic.

I initially attempted to use the following rule to allow inbound traffic on port 80/443 to be handled only by processes on the server that were root or www-data:

add rule filter input tcp dport { http, https } meta skuid { root, www-data } ct state new,established,related accept

...I have since learned that a better approach for this rule would be abstracting the connection states out, but I have repeated the rule from my original post.

This did not work as nftables is attempting to limit the skuid to root or www-data based on the client account that created the traffic - which is not included in the traffic.

Is there a way to restrict this so only processes owned by root or www-data on the server will receive HTTP/S traffic (either with nftables or another means) ?

Thanks,

- J


