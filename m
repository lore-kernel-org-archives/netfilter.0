From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: iptables rule for more than one target
Date: Thu, 26 Jan 2012 18:12:39 -0200
Message-ID: <CAMTjHrzUgXbHviHAYmaBZyTzV-pwXJYpOR4puWxgQ1WCf2TDYQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello everyone, what I want is add an rule in my firewall with more
than an destination target. for exemplo:

/sbin/iptables -t mangle -I PREROUTING -s 10.10.10.10 -d !
192.100.100.8 10.254.253.1 172.16.0.1  -j MARK --set-mark 5

when I try add this rule appear

Bad argument `10.254.253.1'
Try `iptables -h' or 'iptables --help' for more information.

I need add some "-d ! x y z ..."



thanks
