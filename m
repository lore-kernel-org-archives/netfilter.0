From: davidsen@tmr.com (bill davidsen)
Subject: Re: Microsoft PPTP VPN server behind FIREWALL
Date: Tue, 25 Mar 2003 13:34:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303251834.NAA02380@gatekeeper.tmr.com>
References: <083201c2f2cf$a4fc85c0$6e69690a@rimas>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c2f2f5$2b662920$1001a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rreid@studio3arc.com

In article <001501c2f2f5$2b662920$1001a8c0@s3ac> you write:
| 
| > 
| > I tried to use this command to make a forward to itenal IP 
| > address: iptables -t nat -A PREROUTING -d $EXTERNALIP -p tcp 
| > --dport 1723 -j DNAT --to 192.168.1.150:1723 But it doesn't 
| > work, I mean I cannot connect to my VPN server from outside.
| > 
| > Any ideas or issues?
| 
| 
| FYI iptables does not support pptp filtering. In order to support it you
| need to apply the pptp patch from patchomatic. In my experience it's not
| worth it. I ended up using FreeSwan installed on myfirewall gateway as
| my VPN solution.

I believe there is a userspace IPsec package, reasonably high overhead
but runable where a patched kernel is politacally incorrect. Does that
ring a bell with anyone?
-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.

