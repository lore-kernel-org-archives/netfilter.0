From: Jihoon Chung <difro@sexycoder.com>
Subject: IRC DCC between 2 clients on the same net.
Date: Mon, 18 Nov 2002 12:55:55 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021118035555.GA5525@sexycoder.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I have 2 clients behind a masquerading gateway.

When one of them DCC SEND to the outside world, everything's fine.
(Thanks
to ip_conntrack_irc/ip_nat_irc)

But when I DCC-SEND from one client to the other client on the same
network, it doesn't work.  The sending side fails almost immediately.

Is this normal?
I'm using kernel 2.4.17.

