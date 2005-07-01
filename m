From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: Configurationrequest for firewall with temporary ppp0-interface
Date: Fri, 1 Jul 2005 19:40:15 +0200
Message-ID: <16109.4697578394$1120239242@news.gmane.org>
References: <42C3BA1B.6070004@my-mail.ch>
Reply-To: edvin.seferovic@kolp.at
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Well if you are using NAT then you can say that ppp+ should be NATed to your
extern interface.. should be to complicated? :) pppd brings up a new
interface and adds a route to it, so you dont have to worry about this.

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Ruprecht Helms
Sent: Donnerstag, 30. Juni 2005 11:24
To: netfilter@lists.netfilter.org
Subject: Configurationrequest for firewall with temporary ppp0-interface

Hi,

I've the problem that I need some rules for a temporary ppp0 interface.
This interface is only active then the admin has made a dial-up on the 
server and has activated a ppp-daemon.

In the time the ppp0-Interface is up the connections should be able 
completely in both directions and through to clients. But this should 
only alowed for connections via ppp0.

Connections via the normal isdn0 should be protected by the normal 
firewallroules (iptables).

How have I to configure.

Regards,
Ruprecht

----------------------------------------------------------------------------
--------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Web:       htp://www.rheyn.de



