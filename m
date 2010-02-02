From: Vikram Ragukumar <vragukumar@signalogic.com>
Subject: Regarding Iptables Redirect Target rule
Date: Mon, 01 Feb 2010 20:26:36 -0600
Message-ID: <4B678D5C.7090701@signalogic.com>
References: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@lists.netfilter.org

Hello,

Interface 1                  Interface 2
9090(encrypted)  ---------  9000(decrypted)
   ------>-------|Fire wall|--->-----
   ------>-------|         |--->-----
9000(unencrypted)--------- 9000(unencrypted)

I need to encrypt/decrypt and port translate traffic coming in on a 
particular port (9090).

I first perform decryption by queuing packets to a userspace program 
with the following iptables rule
(a) iptables -t mangle -A PREROUTING -p udp --dport 9090 -j NFQUEUE

To achieve port translation i use the REDIRECT target as shown below
(b) iptables -t nat -A PREROUTING -p udp --dport 9090 -j REDIRECT 
--to-port 9000

The iptables rule with the REDIRECT target ensures that traffic on port 
9000 on Interface 2 gets port translated to port 9090 while going out 
through Interface 1, only if they belong to a connection that was port 
translated from 9090 to 9000 while coming in on Interface 1.

I would like to know how to construct a rule to intercept packets that 
belong to the port translated stream, but now are coming from Interface 
2 and would like to encrypt them before they go out on Interface 1 ? 
There are other connections that use port 9000, however these do not 
belong to the port translated stream.

Will the following rule work ?

iptables -t mangle -A POSTROUTING -p udp --sport 9090 -j NFQUEUE
i.e. Will REDIRECT, ensure that the source port is rewritten from 9000 
to 9090 by the time the packet hits mangle POSTROUTING ?

Thanks in advance,
Vikram.


