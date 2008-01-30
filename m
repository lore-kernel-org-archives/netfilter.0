From: Alexey Vlasov <renton@renton.name>
Subject: limit module
Date: Wed, 30 Jan 2008 19:13:44 +0300
Message-ID: <20080130161344.GA33214@diabolo.evga.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello!

There's some mess in figures:

# iptables -A INPUT -p tcp -s 111.222.111.222 --syn -m limit --limit 1/s
--limit-burst 50 -j ACCEPT
# iptables -A INPUT -p tcp -s 111.222.111.222 --syn -m limit
--limit-burst 1000 -j LOG

Do I understand right that according to the first rule through it can
pass only 50 SYN packets per second. If I am right, then it can be
checked like this: I launch 50 times all at once "telnet dst_host 80" and
look at the counter:

50  2600 ACCEPT
0     0 LOG

Launch 50 times telnet again:

66  3432 ACCEPT
34  1768 LOG

Here goes that 50 packets came, but why only 16 came through the first
rule?

-- 
BRGDS. Alexey Vlasov.
