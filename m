From: Felix <felix@epost.ch>
Subject: geoip not working as expected
Date: Mon, 23 Dec 2019 15:40:04 +0100
Message-ID: <f26bf016-3442-49a8-f988-2e0ba69551c6@epost.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

Since few days I updated to buster and have the following setup:

- Linux raspberrypi 4.19.84-v7l+ #1 SMP Mon Nov 18 15:40:00 GMT 2019
armv7l GNU/Linux
- xtables-addons-3.7

I can make queries against countries:

$ cd /usr/share/xt_geoip  # I have to sit on this directory to succeed
$ ./xt_geoip_fetch CH|less
2.56.40.0-2.56.43.255
2.59.28.0-2.59.31.255
2.59.96.0-2.59.99.255
2.59.120.0-2.59.123.255
5.1.96.0-5.1.103.255
5.1.112.0-5.1.119.255
5.23.22.0-5.23.22.7
5.39.2.205-5.39.2.205
5.39.56.32-5.39.56.47
5.39.103.56-5.39.103.63
5.44.112.0-5.44.127.255
5.53.104.0-5.53.111.255
5.57.200.0-5.57.207.255
5.61.224.0-5.61.231.255
5.102.32.0-5.102.35.255
...

And I have this rule active:

#iptables -A INPUT -m geoip --src-cc CH -j ACCEPT
iptables -A INPUT -i eth1 -m geoip ! --src-cc CH,FR -j DROP

But everything is blocked:

$ iptables -nvL|grep geoip
  867 39076 DROP       all  --  eth1   *       0.0.0.0/0           
0.0.0.0/0            -m geoip ! --source-country CH,FR

And the commented rule allow every countries.

Any hint to fix or troubleshoot?

Kind regards

Felix
