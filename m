From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: RE: NAT rules for VPN only allowing one user?
Date: Wed, 30 May 2007 00:17:14 -0500
Message-ID: <000001c7a279$c93477f0$dededede@neilhp>
References: <Pine.LNX.4.61.0705292011230.11140@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705292011230.11140@yvahk01.tjqt.qr>
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

Jan:

Actually, I need the SNAT rule to make my remote
users look like they are coming from the local network.

For some reason, the Linksys does not respond to the
connection unless I have that.

Thanks,
	Neil

--
Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
FREE! Eliminate junk email and reclaim your inbox.
Visit http://www.spammilter.com for details.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jan Engelhardt
Sent: Tuesday, May 29, 2007 1:13 PM
To: Neil Aggarwal
Cc: netfilter@lists.netfilter.org
Subject: Re: NAT rules for VPN only allowing one user?

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


