From: =?iso-8859-1?q?pooja?= <pooja2909@yahoo.co.in>
Subject: Iptables Queuing Problem
Date: Thu, 30 Jan 2003 07:14:53 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130071453.54533.qmail@web8206.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi!!

I am using iptables queuing concept to get the packets
for my application.The applicaction is just doing
simple dynamic nat if reqd..I change the dest ip in
prerouting hook if reqd and the src ip i postrouting
hook...This is working fine for first few pkts after i
start my application..But after that i am getting
segmentation fault...What is happening is one pkt
after passing through and accepted by prerouting hook
disappears..it gets lost..neither it enters FORWARD
hook nor postrouting hook..and the next pkt gives me
the SEGMENTATION FAULT ERROR ..

CAn somebody tell me why is this happening????

Thanx in advance,
Pooja

________________________________________________________________________
Missed your favourite TV serial last night? Try the new, Yahoo! TV.
       visit http://in.tv.yahoo.com

