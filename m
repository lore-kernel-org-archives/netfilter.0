From: Infoomatic <infoomatic@gmx.at>
Subject: nat/forwarding reject - basic question ipt/nft
Date: Sat, 25 Feb 2017 14:39:57 +0100
Message-ID: <trinity-262aff1c-8a6f-462f-88c5-52ab1a11aa67-1488029996995@3capp-gmx-bs32>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I am playing around in my test environment to migrate from Openbsd PF to iptables/nftables.
I just want to have basic rules for my internal net what to send outside.
So I have e.g.
iptables -t nat -A POSTROUTING -s 192.168.200.170 -j SNAT --to Y.Y.Y.Y

Now I want the host 192.168.200.170 to get an icmp type 3 code 3 return when it wants to connect
to any ip-address to tcp-port 22. I have tried various ways, e.g.
iptables -A FORWARD -p tcp --source 192.168.200.170 --dest X.X.X.X -j REJECT
This rule works but the client does not get notified so when it connects it just gets a timeout

In OpenBSD/PF you just define e.g. 2 input rules, and then the client gets the info "Connection refused"
pass in quick proto tcp from 192.168.200.170 to any port {22 443}
block return in quick on $if_int proto tcp from 192.168.200.170

How is this to achieve with iptables/nftables? I have probably missed some important info ;-)
Thanks in advance,

infoomatic
