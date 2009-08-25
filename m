From: "John Lister" <john.lister@kickstone.com>
Subject: Problem with statistic module nth mode
Date: Tue, 25 Aug 2009 13:27:36 +0100
Message-ID: <58261217A1E14FCCB2F0CF27FA977252@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi, I have a set of rules as follows

iptables -t nat -N SNAT1
iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 0 -j 
SNAT --to-source 87.194.x.1
iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 1 -j 
SNAT --to-source 87.194.x.2
iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 2 -j 
SNAT --to-source 87.194.x.3
iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 3 -j 
SNAT --to-source 87.194.x.4
iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 4 -j 
SNAT --to-source 87.194.x.5

iptables -t nat -A POSTROUTING -o eth1 -j SNAT1
...
iptables -t nat -A POSTROUTING -o eth1 -j LOG --log-prefix "Failed to nat"


The last rule is occasionally triggered, is this a bug? I could put a catch 
all there, but the 5 "nth" rules should cover all possible cases or have I 
missed something obvious??


I'm running ubuntu hardy, kernel 2.6.24-24 and iptables 3.8

Thanks

John 

