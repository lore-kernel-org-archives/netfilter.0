From: Martin Bednar <martin@serafean.cz>
Subject: nftables vmap concatenations with interval
Date: Tue, 27 Sep 2016 17:10:45 +0200
Message-ID: <11357773.LdaEAIBM0O@nemmerle>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1474989095;
        bh=FEdx0d4WNJtiAEVtP/zU+hG43BpLj+U/hAwuOA4lZ0I=;
        h=From:To:Subject:Date;
        b=N3hSbtz0MWhpzTh0QyRITWWA4FU+xMqVIbFBJsVyPzff0Q0Vf1MvX9V8cc9JTjLn8
         WbL7s2QjRsPz+cwirSDJ3KdUu2d0oY9++/BwPCi5Q0ZtgadO0+BJyolcMEI4o1S2hP
         djgEecAkcS4iTIbF8bxGEsx5FwVqWoefk/6XqW5fg9ocNw1coBCO1QgaKi32fvZiL2
         4H/QytRarzZjR6VAYKzQxDAOlK2YUDKB6qmzd+9ZrOWbdOQebJo3fIbJszcJ2GT0yu
         +Q/NjKOICEeXPvP5yNXckg1DgiDxEaBuyJpQRv6gPBxCn9WDZXkJVb9v3OhmCaHTt7
         BZE1e15Tbg+DA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

hi, 

using nftables, I want to create a vmap : 

map mymap {type ipv4_addr . iface_index : verdict }

I'd like the first argument to be an ip range/ network, so that I can add like 
so :
nft add element inet filter mymap { 172.18.0.1/24 . eth0 : accept }
or
nft add element inet filter mymap { 172.18.0.1-172.18.0.255 . eth0 : accept }

Any hints as to what to do it?

Thanks,

Martin.
