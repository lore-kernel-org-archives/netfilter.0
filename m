From: paridhi bansal <paridhibansal@yahoo.com>
Subject: PLS help..........
Date: Wed, 5 Feb 2003 22:54:02 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030206065402.12045.qmail@web10804.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have observed that  with iptables nat enabled ,
return ICMP pkts(not the TCP pkts) directly enter
INPUT hook without passing through Prerouting
hook???Why is this so????

Is it possible to redirect a pkt from INPUT hook to
prerouting hook?????

By the way, i am using iptables queuing(libipq for
queuing pkts to user spaceapplication that is doing
the nat..I am checking that if the pkt has come to
prerouting, then do so and so..Because, actually the
ICMP reply pkt is not meant for nat box but other m/c
inside LAN,my appliocation shld reNAt it to ip of
destination m/c and then forward it.. but if it enters
input hook, i have no control of redirecting the pkt
to the destination m/c on LAN even if i reNAT it
correctly)

Pls somebody help me out of this situation..IT'sreally
URGENT...............

Thanx in advvance,
Paridhi



__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

