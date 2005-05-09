From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: mails not going thru'
Date: Mon, 09 May 2005 01:19:30 -0500
Message-ID: <427F00F2.5000308@riverviewtech.net>
References: <fcd674fcd901.fcd901fcd674@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fcd674fcd901.fcd901fcd674@vsnl.net>
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

> Well my server in on Mandrake10.1
> with eth0 as WAN with static IP
> eth1 as LAN 192.168.0.xxx.
> 
> Clients connect to eth1 of the server.
> 
> I hope this help

Yes this does help.

Try setting up a DNAT rule that will take any port 25 (SMTP) connections received on eth1 from your LAN and DNAT them to an SMTP server on the net that will relay for your network.  You would do this with something along the following lines:

iptables -t nat -A PREROUTING -i eth1 -s 192.168.0.0/24 -d $IP_Address_of_Firewall -p tcp --dport 25 -j DNAT --to-destination $IP_Address_of_SMTP_server

This should take any port 25 traffic (SMTP) that is inbound to your server and redirect it to an SMTP server on the net.



Grant. . . .

