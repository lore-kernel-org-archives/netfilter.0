From: Craig <elitesyntax@yahoo.com>
Subject: iptables dial-up
Date: Mon, 2 Jun 2003 07:21:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030602142140.47136.qmail@web14712.mail.yahoo.com>
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




I have  2 nic cards one is eth0 and the other is eth1
and there is the same computer.The probs is i not sure
where i  could put this in my script?



OUTIP= `/sbin/ifconfig ppp0 |awk '/inet
addr/{split($2,x,":"); print x[2]}'`


I am useing a dial-up.Someone told me told me thid
would work out with 2 nic cards.The other prob how
would i srart my other put of the script with eth0 and
eth1?












=====
EliteSyntax  www.linuxnewbie.org





__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com

