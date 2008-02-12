From: "Albert Dorn" <TreNrod@gmx.net>
Subject: Error Message "nfnl_talk: sendmsg(netlink) Message too long" by test.c
Date: Tue, 12 Feb 2008 14:48:58 +0100
Message-ID: <20080212134858.126090@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Problem: Error Message "nfnl_talk: sendmsg(netlink) Message too long" when running test.c programm.

My System is 2.6.18-5-ixp4xx on a NSLU2 ARM CPU.
I installed libnetfilter_queue and libnfnetlink from debian rep. by tipping apt_get install libnetfilter_queue1.

I also installed it manually with apt-get. But i still got the same Problem.
On other Hand i installed it on my desktop and it worked great.

I have not found same error msg on the net.

Test Env.

LKG995999:~# modprobe ip_tables
LKG995999:~# modprobe iptable_filter
LKG995999:~# iptables -A INPUT -s 192.168.2.1 -p TCP -j QUEUE
LKG995999:~# gcc route.c -o test_nfq -lnetfilter_queue
LKG995999:~# ./test_nfq
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
binding nfnetlink_queue as nf_queue handler for AF_INET
binding this socket to queue '0'
setting copy_packet mode
nfnl_talk: sendmsg(netlink) Message too long
can't set packet_copy mode


Thank you a lot!
Best regards Albert Dorn
-- 
Ist Ihr Browser Vista-kompatibel? Jetzt die neuesten 
Browser-Versionen downloaden: http://www.gmx.net/de/go/browser
