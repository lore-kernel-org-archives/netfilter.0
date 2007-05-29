From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: NAT rules for VPN only allowing one user?
Date: Tue, 29 May 2007 20:12:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705292011230.11140@yvahk01.tjqt.qr>
References: <000c01c7a217$2e0ab670$dededede@neilhp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c7a217$2e0ab670$dededede@neilhp>
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
To: Neil Aggarwal <neil@JAMMConsulting.com>
Cc: netfilter@lists.netfilter.org

On May 29 2007 12:31, Neil Aggarwal wrote:

>/sbin/iptables -t nat -A POSTROUTING -o eth1 
>	-d $LINKSYS_VPN_IP -p tcp --dport 1723 
>	-j SNAT --to-source $ETH1_IP

This is redundant.

>Either one of my remote users can connect to the VPN using
>the Windows XP VPN client.  But, if one of them is connected
>and the other tries to connect, the second person gets to
>the verifying username and password screen and then
>gets an Error 619 that they are not able to connect.
>
>I think somehow the existing connection is mis-routing
>the login for the second connection.
>
>Any ideas what could be going on?

Use the holy tcpdump.


	Jan
-- 

