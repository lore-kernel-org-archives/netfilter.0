From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Configurationrequest for firewall with temporary ppp0-interface
Date: Sun, 3 Jul 2005 15:56:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507031556110.901@yvahk01.tjqt.qr>
References: <42C3BA1B.6070004@my-mail.ch>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ruprecht Helms <rhelms@my-mail.ch>
Cc: netfilter@lists.netfilter.org

> Hi,
>
> I've the problem that I need some rules for a temporary ppp0 interface.
> This interface is only active then the admin has made a dial-up on the server
> and has activated a ppp-daemon.

Maybe it's been said, or not:
You can have iptables rules for devices even if they do not exist or are 
turned off (`a la "ip link set down")


Jan Engelhardt
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

