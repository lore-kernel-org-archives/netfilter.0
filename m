From: Askar Ali Khan <askarali@gmail.com>
Subject: blocking a site for others not for -m owner
Date: Thu, 8 Jul 2004 09:56:37 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e50407072156420fc7aa@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Salam

Im trying own my home box (standalone) which is directly connected
with net via ppp0 (dialup). I got a three user accounts on this box
only for practice purpose.
Now im trying to block a site www.foo.com for users excluding user
"askar" with something like....

#iptables -A OUTPUT -p tcp --dport 80 -d www.foo.com -j DROP

       this works for all users however when I tries to exclude user
"askar" from this blocking with...

#iptables -A OUTPUT -p tcp --dport 80 -d www.kmmod.com -m owner
--uid-owner askar -j ACCEPT

              site is still block for user "askar", i also tried with
changing the other of the rules no working :), Howto exclude "askar" ?
my default chain polices ...

Chain INPUT (policy ACCEPT)
Chain FORWARD (policy ACCEPT)
Chain OUTPUT (policy ACCEPT)

Regards
Askar

