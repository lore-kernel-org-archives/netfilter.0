From: gabrix <gabrix@gabrix.ath.cx>
Subject: iptables and hostnames.
Date: Wed, 04 Oct 2006 15:12:41 +0200
Message-ID: <4523B349.20009@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

What is the reason why if i use this iptables:
> # (APACHE)
> $IPT -A INPUT -p tcp -d x.gabrix.ath.cx --dport 80 -m state --state ! 
> INVALID -j ACCEPT
> $IPT -A INPUT -p tcp -d tor.gabrix.ath.cx --dport 443 -m state --state 
> ! INVALID -j ACCEPT
the hostnames you see get resolved to their pubblic ips.This is on an 
inside lan pc but this doesn't happen on the gateway pc right before it 
where iptables says it can't resolve the hostnames .Why this ?I have 
debian sarge kernel 2.6 on all machines.
Thanks !

