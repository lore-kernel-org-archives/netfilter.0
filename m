From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Problem after  SAME tagret became obsoletes
Date: Mon, 15 Sep 2008 14:26:28 +0300 (AST)
Message-ID: <32630945.3051221477988035.JavaMail.root@mail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>
Cc: wlagmay <wlagmay@yanbulink.net>


Dear All,

I am aware that SAME is obsoletes on higher linux 2.6, and I am inform to use only masquerade or SNAT. 
Since I am using a multiple source and a multiple destination IP address, my configuration with SAME goest like this:

iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j SAME --to 10.0.0.1-10.0.0.100 --nodst
with the above rule it "gives the client the same source/destination-address for connection" which solves my problem on voice chat, yahoo, msn and other voice messenger.

I am trying hard to find out how am I going to implement the same rule using SNAT but I cannot find any link. Can you please help me on this. If possible give me the step by step procedure on how to solve my problem.

Please Cc: me in every response  

Thank you very much,

Wennie
 
