From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: IP Forwading from Local IP to Live IP
Date: Tue, 19 Apr 2005 02:44:58 -0500
Message-ID: <4264B6FA.6080102@riverviewtech.net>
References: <1079365863.2163.8.camel@vejan>	<200403151608.12073.Antony@Soft-Solutions.co.uk>
	<002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
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
To: elg3ne <sun@dap.edu.ph>
Cc: netfilter@lists.netfilter.org

> Hi guys, Im new to iptables.. hope someone can help me to this.
> 
> The situation is this, I have a webserver running on a local network machine
> (192.168.1.3) & I want it to be accessible outside my network. Is it
> possible?
> 
> setup is like this:
> 
> workstation (192.168.1.3) ---> HUB ---> server ( LIVE IP, accessible
> everywhere on the net )
> 
> when user access the live IP ex. 10.0.0.3 can he forward to get the files on
> the worstation?

I think you are talking about simple port forwarding.  To accomplish this you would want to run such a set up on server / router / firewall.

iptables -t nat -A PREROUTING -i $INet_Interface -d 10.0.0.3 -p tcp --dport $Port_of_Service -j DNAT --to-destination 192.168.1.3:$Port_of_Service
iptables -t nat -A PREROUTING -i $INet_Interface -d 10.0.0.3 -p udp --dport $Port_of_Service -j DNAT --to-destination 192.168.1.3:$Port_of_Service
iptables -t nat -A POSTROUTING -o $LAN_Interface -d 192.168.1.3 -p tcp --dport $Port_of_Service -j SNAT --to-source $Internal_IP_of_Server
iptables -t nat -A POSTROUTING -o $LAN_Interface -d 192.168.1.3 -p udp --dport $Port_of_Service -j SNAT --to-source $Internal_IP_of_Server

This will take any TCP or UDP traffic that is coming in to the server to port $Port_of_Service and (port) forward it to 192.168.1.3 where the traffic will be handled as if it were originally destined to the internal system.



Grant. . . .

