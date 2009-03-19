From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Outgoing redirection with iptables - TCP skips NAT?
Date: Thu, 19 Mar 2009 12:09:26 +0100
Message-ID: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=pjHEt4C1yJU6ecaiDE7NFhJOT+FbN8ZNdecyjKWroQg=;
        b=RBi0WW/Y7OAdromltTQshrT9hWcIYzB38OHn0ahgp5HSxztgn3M7zck53ml4FfInxE
         xoQ6e8T5Vu0HVci+ijJXeY6ruGkNW5wT5yVjE2Wh22GlM2dlK/Vj63B0fHZV2XausCLi
         oYAJjeVGL23N6R6ayM2VF7gprBxaUBmuS9rjI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am working on configuring a multihomed machine, and one of my goals
is to redirect some outgoing TCP-traffic originating from this machine
using iptables. Currently, I have got it working with UDP and if I add
the rule to the output-chain of the NAT-table before I start the
connection, it works.

However, sometimes I want to start doing redirection in the middle of
a TCP connection and this does not seem to work. I do not get any
matches to my LOG-target (except for the first SYN packet) and the
packets still go through the old interface. In other words, it somehow
seems like TCP is skipping the NAT's output-chain. Does anyone have
any ideas how to solve this?

The iptables rule I use is:
sudo iptables -A OUTPUT -t nat -p tcp -d 192.168.101.14 --dport 9999
-j DNAT --to 192.168.100.250:9999

The LOG rule is constructed like this:
sudo iptables -A OUTPUT -t nat -p udp -d 192.168.101.14 --dport 9999
-m state --state NEW,ESTABLISHED,RELATED --sport 1024:65535 -j LOG
--log-prefix "INFO,OUTPUT,NAT(tcp): " --log-level debug

Thanks in advance,
Kristian
