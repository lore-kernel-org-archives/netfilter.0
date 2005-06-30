From: Ruprecht Helms <rhelms@my-mail.ch>
Subject: Configurationrequest for firewall with temporary ppp0-interface
Date: Thu, 30 Jun 2005 14:49:48 +0200
Message-ID: <42C3EA6C.4020000@my-mail.ch>
Reply-To: rhelms@my-mail.ch
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

------------------------------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Web:       htp://www.rheyn.de


