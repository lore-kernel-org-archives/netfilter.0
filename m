From: "John Lister" <john.lister@kickstone.co.uk>
Subject: statistic module problem
Date: Wed, 10 Dec 2008 15:40:42 -0000
Message-ID: <622D73DB972D4C608275D2DCC3DCE4C1@squarepi.com>
References: <F5E47532014E8E45A339717AF42215342F1A1E7C2F@hild.consultech.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi, i'm trying to use the statistic module to route different packets out on 
different ips using SNAT, however it only seems to match for the first N 
packets and then fails.

I've got the following rules set

iptables -t nat -A POSTROUTING -o eth1 -j LOG --log-prefix 
'***before***' --log-level debug
iptables -t nat -A POSTROUTING -o eth1 -m statistic --mode nth --every 
2 --packet 0 -j SNAT --to-source x.y.96.34
iptables -t nat -A POSTROUTING -o eth1 -m statistic --mode nth --every 
2 --packet 1 -j SNAT --to-source x.y.96.35
iptables -t nat -A POSTROUTING -o eth1 -j LOG --log-prefix 
'***failed***' --log-level debug


if i try and ping on a route via eth1, the first 2 packets are SNATted ok 
but subsequent packets don't seem to be...

I'm guessing i've made a fundamental mistake wrt my understanding of the nat 
table or the stats module..

any ideas?

Thanks 

