From: neil@JAMMConsulting.com
Subject: Re: Port forwarding not working (nfcan: to exclusive)
Date: Sat, 28 Apr 2007 23:56:33 -0500 (CDT)
Message-ID: <1077.70.240.185.92.1177822593.squirrel@ssl.jammconsulting.com>
References: <000001c78a0c$a7b02cd0$dededede@neilhp>
	<1177819456l.3596l.0l@soapy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1177819456l.3596l.0l@soapy>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Jim:

> The outside should be able to initiate
> so the first rule looks good:
>
> /sbin/iptables -A FORWARD -i eth0 -o eth1 -d $LINKSYS_VPN_IP
> 	-p tcp --sport 1024: --dport 1723
> 	-m state --state NEW,ESTABLISHED -j ACCEPT
>
> But you need to accept the return packets.
> How about this for the return pattern:
>
> /sbin/iptables -A FORWARD -i eth1 -o eth0 -s $LINKSYS_VPN_IP
> 	-p tcp --sport 1723
> 	-m state --state ESTABLISHED -j ACCEPT

That is my point.  Without this rule, I should see packets
hitting the firewall in the log.  I dont see them.

I can add this rule, but I dont think the return packets are
coming back correctly.

> The accept in the nat postrouting can be removed.

I need that as I also set the nat postrouting to drop
by default.

Would it help to see my entire firewall script?

Thanks,
  Neil

--
Neil Aggarwal
JAMM Consulting, Inc.


