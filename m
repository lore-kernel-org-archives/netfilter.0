From: =?iso-8859-1?q?Stephen=20Bylo?= <stephenbylo@yahoo.com.sg>
Subject: DNAT/SNAT & existing connections
Date: Tue, 15 Jul 2003 18:01:15 +0800 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715100115.87255.qmail@web13101.mail.yahoo.com>
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

Dear list,

I am looking into the use of a NAT "router" to change
the destination (or source) IP addresses of packets in
existing connections.  Maybe it sounds weird why I
might want to do this, but I need to divert streams to
other destinations!

I understand from the iptables docs that only the
first packet of a connection is examined for NAT
entries, subsequent packets do not need to be
processed again.  I would like all packets to be
examined OR I would like to be able to "reset" the
particular entry in the table so that the existing
connection will be "re-considered" again using the
NAT.

Is this possible in some way with iptables?  If not,
can you point me in the right direction to a solution,
please?

Thanx,
Steve

__________________________________________________
Do You Yahoo!?
Send free SMS from your PC!
http://sg.sms.yahoo.com

