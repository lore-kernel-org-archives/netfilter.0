From: "Minh Cao" <caom@statsus.com>
Subject: Re: Help: Iptables rules
Date: Thu, 15 Jan 2004 11:57:26 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF487854B5.F9A9C49A-ON88256E1C.006A8AE9-88256E1C.006DA0EC@statsus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org








> Some questions:
>
> 1. Do you have packet forwarding turned on in the kernel (cat
> /proc/sys/net/ipv4/ip_forward)?

Yes, I have ip_forward

>
> 2. What are the default policies on your netfilter chains (iptables -L)?

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere           LOG level
warning

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

>
> 3. You say the above has not worked - how have you tested it?

Yes, I tested
I used VPN client, which connected to remote side. After connected, the
password authentication is timeout in 2 minutes.

Here is my network diagram

Internet --> CheckPoint Firewall --> (linux/NAT/IPtables/DHCP with 2 NICs)
--> DHCP/VPN client

To verify the packets at Checkpoint firewall, I connect VPN-client before
IPtables hosts (right after the Checkpoint firewall) , the VPN client
connected and password auth. w/o a problem.

>
> 4. Do packets get across the router in either direction (internal to
> external?
> external to internal)?

How do I check this ?
Telnet, ftp, ping all working

>
> 5. Have you read Oskar Andreasson's netfilter tutorial at
> http://iptables-tutorial.frozentux.net, referenced on the netfilter home
> page
>
http://www.netfilter.org/documentation/index.html#documentation-tutorials?

I will read

>
> 6. Did the machine work as a simple router before you tried adding
> netfilter
> rules?

Two NICs are on different subnet. Can I config as a router w/o using
netfilter ?


>
> Regards,
>
> Antony.

--
The difference between theory and practice is that in theory there is no
difference, whereas in practice there is.

                                                     Please reply to the
list;
                                                           please don't CC
me.








