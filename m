From: "Paulo J. Matos" <pocm@mega.ist.utl.pt>
Subject: Command not working  in latest version
Date: Sun, 16 Feb 2003 14:00:10 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b401c2d5c3$b87fd6c0$0100a8c0@nikita>
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

Hi all,

I've changed from my old distribution to a new one that comes with iptables
1.2.7a.
I have iptables in the kernel (2.4.20) and I've loaded the modules
iptable_nat, ipt_REDIRECT and ipt_MASQUERADE.
I had in my previous distributions the following lines:
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

This would give total access from lan attached to eth0 to the internet
through my computer. But now, line 1 executes ok, line 2 gives:
iptables: Invalid Argument

If I do :
iptables -t nat -A POSTROUTING -o eth0
everything runs ok but lan has still no access to the internet as expected.
What's happening, any ideas?

Best regards,

Paulo




