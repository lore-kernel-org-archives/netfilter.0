From: "Paul Rubin" <equilter@equilter.com>
Subject: Problem with connlimit patched kernel 2.6.23
Date: Fri, 12 Oct 2007 08:13:48 -0600
Message-ID: <0a2601c80cda$1d9691f0$3501a8c0@paulr>
Reply-To: "Paul Rubin" <equilter@equilter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hello. We're having difficulty getting iptables to work with connlimit.
We're running the latest kernel 2.6.23, and the connlimit modules
are compiled into the kernel.

when I try to add the rule,
iptables -v -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 16 -j
DROP
I get the following back:
DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:80 #conn/32 >
16
iptables: Invalid argument

 It then puts the following message into /var/log/messages:
ip_tables: connlimit match: invalid size 32 != 16

Any help is greatly appreciated.
Thank you,
Paul Rubin
equilter@equilter.com 

