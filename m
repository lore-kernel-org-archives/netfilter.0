From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: weird netfilter problem
Date: Tue, 29 Jun 2004 14:12:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291412.02320.Antony@Soft-Solutions.co.uk>
References: <BAY4-F21sPlRDETxXK20008facb@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY4-F21sPlRDETxXK20008facb@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 29 June 2004 2:02 pm, Mike O wrote:

> Im trying to track down a problem Im having with iptables. For some reason
> the internal machines cannot reach the internet until I ping them from the
> iptables box. I check the conntrack tables and there still valid entries in
> there for that machine. if I reboot it works for about 5 minutes then
> stops. I tried upgrading the kernel to 2.4.26 and iptables 1.2.11 and the
> same problem happens. Any ideas? this was working fine for over 6 months
> then just starts doing this.

Sounds like the client machines can't do ARP resolution for the IP address of 
the gateway.

I would suspect:

1. The NIC on the firewall.
2. The switch on your LAN.

Wait until one of the clients cannot get to the Internet, then examine its ARP 
cache ("arp -an" on Linux, not sure about other O/Ss), and see if it has a 
complete entry for the IP address of the firewall's internal interface.

Then do your ping and repeat the ARP check.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


