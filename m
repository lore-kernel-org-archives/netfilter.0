From: "Jihoon Chung" <difro1234@hotmail.com>
Subject: IRC DCC between 2 clients on the same net.
Date: Fri, 15 Nov 2002 17:37:13 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F67clWvGA46w9aobrAQ0001208a@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I have 2 clients behind a masquerading gateway.

When one of them DCC SEND to the outside world, everything's fine. (Thanks
to ip_conntrack_irc/ip_nat_irc)

But when I DCC-SEND from one client to the other client on the same
network, it doesn't work.  The sending side fails almost immediately.

Is this normal?
I'm using kernel 2.4.17.


_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail


