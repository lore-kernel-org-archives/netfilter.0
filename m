From: Christoph Georgi <christoph.georgi@web.de>
Subject: Re: Configurationrequest for firewall with temporary ppp0-interface
Date: Fri, 01 Jul 2005 12:43:21 +1200
Message-ID: <42C491A9.8070301@web.de>
References: <42C3BA1B.6070004@my-mail.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C3BA1B.6070004@my-mail.ch>
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
To: rhelms@my-mail.ch
Cc: netfilter@lists.netfilter.org

Just create rules specifying ppp0 as incoming and outgoing interface (-i 
and -o), e.g.

$IPTABLES -A FORWARD -i eth0 -o ppp0 -j ACCEPT
$IPTABLES -A FORWARD -o eth0 -i ppp0 -j ACCEPT

christoph

Ruprecht Helms wrote:
> Hi,
> 
> I've the problem that I need some rules for a temporary ppp0 interface.
> This interface is only active then the admin has made a dial-up on the 
> server and has activated a ppp-daemon.
> 
> In the time the ppp0-Interface is up the connections should be able 
> completely in both directions and through to clients. But this should 
> only alowed for connections via ppp0.
> 
> Connections via the normal isdn0 should be protected by the normal 
> firewallroules (iptables).
> 
> How have I to configure.
> 
> Regards,
> Ruprecht
> 
> ------------------------------------------------------------------------------------------ 
> 
> Ruprecht Helms IT-Service & Softwareentwicklung
> 
> Tel./Fax  +49[0]7621 16 99 16
> Web:       htp://www.rheyn.de
> 
> 

-- 


Christoph Georgi
-----------------------------
email.  christoph.georgi@web.de
fon.	+64 (0)9 815 8259

registered linux user #380268
ubuntu 5.04 (ubuntu.com)

