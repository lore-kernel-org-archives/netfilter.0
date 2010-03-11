From: "Sheepa" <sheepa@sheepa.org>
Subject: Update delay when using nat table?
Date: Thu, 11 Mar 2010 01:42:23 +0100
Message-ID: <09084388150B46A2B74F745A8E1272DA@main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hello, im trying to redirect a port based in source ip like this:
iptables -t nat -A PREROUTING -p udp --dport 777 -j REDIRECT --to-port 
888 -s x.x.x.x

Notice that i will have services listening on both ports. Allthough this 
works it takes several minutes for it to take effect. And it doesn't seem to 
take effect at all if i keep sending packages to port 777 here in the 
example. How can i make it take effect instantly? Or is thier any other way 
of doing this (redirecting a port locally) on a debian squeeze machine?

Thanks,
Sheepa 
