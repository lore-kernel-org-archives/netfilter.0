From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: iptables, nat and traffic shaping woes
Date: Tue, 8 Oct 2002 11:57:52 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210081157260.13031-100000@ts1.alberni.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

As I try to solve my problems with iptables, nat and traffic shaping (with
ip accounting thrown intot he mix) a friend of mine just sent this claim.
Is it true?  Will I have to step back to ipchains, or is there a way to
force packets through the traffic shaping filters using iptables?

> If you are using iptables, you MUST forget it, or change to
> ipchains, because
> masq is done by nat table, and shaping is done by mangle table. I
> cannot found
> any way to drive the packet 1. thru nat, than mangle, instead of
> using OUTPUT
> and FORWARD.


-- 
Aaron Clausen


