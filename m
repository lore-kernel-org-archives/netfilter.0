From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 09:53:29 -0500
Message-ID: <4267BE69.6080203@riverviewtech.net>
References: <c0e9781f0504202352240208e4@mail.gmail.com>	<426753A3.7030800@riverviewtech.net>	<c0e9781f05042102544437b319@mail.gmail.com>
	<c0e9781f0504210718566c4025@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f0504210718566c4025@mail.gmail.com>
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

> Hi all,
> 
> Hum... not quite working for me yet, nearlt there but I get the error:
> 
> "MARK: can only be called from "mangle" table, not "nat""
> 
> So I used:
> 
> iptables -A PREROUTING -i eth0 -t mangle -s $DMZ_HOST_IP -p tcp
> --dport 25 -j MARK --set-mark 2

Sorry, my mistake.  It was late at night after a long day.  :(

> Q: Is eth0 correct as this is the red/ INET IFACE and not the DMZ dev
> IFACE (that would be eth1)

No.  I think you should use eth1 in your IPTables rule as you are looking to mark the traffic that is coming back to the router / firewall from the DMZ/SMTP server that is outbound to the world.  Basically you want to mark the SMTP server's returning traffic as a control handle that you can look for with an IPRoute2 rule so that the routing core can decide what routing table to use to send the traffic back out to the world.

> And then:
> 
> ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_ALIAS
> ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP
> ip rule add fwmark $SMTP_MARK table $IPROUTE2_SMTP_TABLE
> 
> Where $SMTP_MARK=2 and IPROUTE2_SMTP_TABLE=smtp.out
> 
> I have "echo 25 smtp.out >> /etc/iproute2/rt_tables"
> 
> Packets still come from the "wrong" ip address
> 
> Any suggestions.
> 
> Thanks.
> 
> Greg

Try changing your eth0 to eth1 in your IPTables mark rule.  Other than that (and my snafu about the wrong table) I think your set up should work just fine.  I feel like you are very close to having what you want set up and working.  :)



Grant. . . .

