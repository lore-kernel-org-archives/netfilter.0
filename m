From: Amiq Nahas <m992493@gmail.com>
Subject: Use ipset and conntrack with nftables
Date: Tue, 18 Aug 2020 15:14:04 +0530
Message-ID: <CAPicJaE9qBs4NAKGzzKLU5GzNneJa6056WbdGn_RzVqKJhSrWg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3iK7k0yX6AQeNxcWfB9NFmp5J0Rg9zahCPGoNQJOmLI=;
        b=ivnrg0IkfYG+q7Yn3oqdWKKTaQqmhTf/5owA00+bHMjDuh6qQeVlv7kXuJSO7Qror7
         5PwlAnVSpsxMYTwcQq5B9k9xpghWTSP5kRCmvMh8Bx40DNHtFfrBG1B0Lr1QG0YlKzZT
         SN1tBDlE5g4KsbapB5QqxuSUVxFIXHZsV+hL7FohtVmTkyYE3q2kmXj6afwa990l6Xzo
         7hFHYamcPshxP93Zaeqkef3ItdWymSMvuxaIDH4X1TMJkZcuqjDFSf3BpyguxhpXWsoE
         JtrhCKlEQElIz4iCfhapjnGZsVx2vyH+xPK3daPljlQVXKXjLnrwiRu4MF/o6KB8kAJq
         77pQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Guys,

What would be the nftables equivalent for this rule:
iptables -D FORWARD -m conntrack --ctorigsrc 172.5.1.123 --ctproto tcp
-j MARK --set-mark 123

Also how can such a rule be made for a collection of different
ip-addresses in an ipset.

So as an example: 172.5.1.123, 172.5.1.124, 172.5.1.125, 172.5.1.126
all these ips are part of an ipset called 'myset'

How can a rule like mentioned above be applied to a collection of ips
denoted by an ipset 'myset'?

Thanks
Amiq
