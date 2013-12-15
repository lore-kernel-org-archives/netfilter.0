From: ZenSecurity <mailto@zensecurity.su>
Subject: Bug in owner module
Date: Sun, 15 Dec 2013 16:57:08 +0300
Message-ID: <52ADB534.7020700@zensecurity.su>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, i have some issue with module (owner) in iptables v1.4.14 (debian
wheezy 7.2.0)

Current rule fails:

iptables -t nat -A OUTPUT -o eth0 -p tcp -s x.x.x.x -m owner --gid-owner
usergroup -j DNAT --to-destination x.x.x.x:80;

I tried to use numeric gid, it failed too..

But this rule works fine:

iptables -t nat -A OUTPUT -o eth0 -p tcp -s x.x.x.x -m owner --uid-owner
user -j DNAT --to-destination x.x.x.x:80;

Is it possible to fix this bug ?

Thanks!
