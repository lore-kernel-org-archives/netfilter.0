From: Reuven Kohanim <rkohanim@yahoo.com>
Subject: iptable/netfilter and X protocol
Date: Sun, 4 May 2003 08:24:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030504152448.36968.qmail@web41703.mail.yahoo.com>
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

I have been successfully using X protocol across an
ipchain gateway. I am trying to move to iptables.
Everything is finally working smoothly except for X. I
am bypassing masquerading when my source/destination
are the X client/server so that I can use my
non-masqed ip address for the 'display' parameter of
say xterm application.Could anyone tell me if iptables
supports X and if so how.
One more general question: Is there a way to trace
packets to see what goes in and out of the
iptable/netfilter gateway?

Thank you in advance

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

