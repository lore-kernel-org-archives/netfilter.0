From: "David Busby" <busby@pnts.com>
Subject: SNAT
Date: Mon, 7 Jul 2003 17:21:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007901c344e6$e98aa410$1100000a@busbydev>
Reply-To: "David Busby" <busby@pnts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Dudes,
    I setup my SNAT like this:

iptables -t nat -I POSTROUTING 1 -s 10.0.0.0/24 -d 0/0 \
  -p tcp -m tcp --dport 80 \
  -j SNAT --to 1.2.3.66-1.2.3.126

So my lan outbound HTTP traffic gets shared over those 60 ip addresses.
Seems sweet, but I notice that netfilter doesn't always rotate the
addresses. And sometimes only switches a client between two addresses. Where
in the docs does it show me how to make this thing rotate addresses more
regularly, or if not in doc how would I do that?

David Busby
Systems Engineer
busby@pnts.com


