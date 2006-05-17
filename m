From: Bowie Bailey <Bowie_Bailey@BUC.com>
Subject: RE: iptables and pop3 lockup
Date: Wed, 17 May 2006 11:39:55 -0400
Message-ID: <4766EEE585A6D311ADF500E018C154E302684A25@bnifex.cis.buc.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

Gary W. Smith wrote:
> I'm now sure what the problem is.  There is nothing pointing out right
> now.  But these are the canned RH rules.  I would recommend making the
> following change just to rule out any connection tracking.  Here is
> the reason.  If connection tracking is broken then any requests for a
> second packet will not be considered new which will fail to be
> matched on the connection tracking site.
> 
> Do this as a test (in place for the corresponding rules).
> 
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 25 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 110 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 53 -j ACCEPT
> -A RH-Firewall-1-INPUT -m udp -p udp --dport 53 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 587 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 80 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 22 -s 172.16.0.0/16 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 443 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 995 -j ACCEPT
> -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 21 -j ACCEPT
> 
> Connection tracking can save you some time in the chain processing for
> allowing for faster matches but we are trying to find out if it's even
> working or not.

I made the change you suggested, but only for pop3 since that was the
only service with the problem.  Everything worked properly at that
point.  So it seems that the problem is with the connection tracking.
What can I do to fix it?

For comparison and clarity, this is my working rule list at the
moment:

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j
ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 110 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 53 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 53 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 587 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -s
172.16.0.0/16 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 995 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT

All I did was remove the state requirements from the pop3 rule.
Everything else is still at my original settings.

Bowie

