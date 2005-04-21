From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 02:17:55 -0500
Message-ID: <426753A3.7030800@riverviewtech.net>
References: <c0e9781f0504202352240208e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f0504202352240208e4@mail.gmail.com>
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
To: Greg Cope <gregcope@gmail.com>
Cc: netfilter@lists.netfilter.org

Greg, if I understand you correctly you have a system that is multi homed with one of it's IP addresses being port forwarded to a DMZ server?  What happens is that your DMZ server replies back to your router / firewall which then in turn send the traffic out it's default route with a source IP of something other than what you want your SMTP traffic to use?  If this is the case you need to so a few tings to get your traffic to go out the interface that you want with the IP that you want.

For starters you will need to use IPTables to mark the traffic that is coming in to your router / firewall from the DMZ mail server.
Second you will need to create a new routeing table for this traffic via something like the following:

iptables -t nat -A OUTPUT -s $DMZ_Server_IP -p tcp --sport 25 -j MARK --set-mark $SMTP_Mark
ip route add table $IPRoute2_SMTP_Table dev $DEV_of_SMTP_network_interface_or_alias src $IP_of_DEV_of_SMTP_network_interface_or_alias
ip route add table $IPRoute2_SMTP_Table default via $Default_INet_Gateway
ip rule add fwmark $SMTP_Mark table $IPRoute2_SMTP_Table

Where:
$DMZ_Server_IP is the internal LAN ip of your SMTP server in the DMZ.
$SMTP_Mark is the value you want to use to mark the packets that need to use the alternant route.
$IPRoute2_SMTP_Table is the name as it appears in /etc/iproute2/rt_tables or the number of the table that you want to use.
$DEV_of_SMTP_network_interface_or_alias is the device name or alias of your network interface that you want all SMTP traffic to use.
$IP_of_DEV_of_SMTP_network_interface_or_alias is the IP address of the device name or alias of your network interface that you want all SMTP traffic to use.
$Default_INet_Gateway is the IP address of your internet gateway.

This should cause any SMPT traffic (source port 25 from the SMTP server) to go out a different interface / alias and thus use a different source IP when the traffic is sent out to the world.  If you have any questions or need more help let me know and I'll see what I can do.


Greg Cope wrote:
> Hi All,
> 
> I have a mutli-homed router/firewall.
> 
> One IP address is the default router gateway address
> 
> Three other (virtual) IP's are for applications (one of which is SMTP).
> 
> My mailserver is on a NAT'ed DMZ.
> 
> However when it sends mail the router uses the default gateway address
> as opposed to the SMTP IP address.
> 
> This upsets reverse DNS lookups as it now appears to come from the
> router as opposed to the mail IP (that has the correct reverse IP
> address lookup).
> 
> Any ideas?
> 
> Greg

