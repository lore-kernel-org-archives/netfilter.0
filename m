From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables port forwarding not working
Date: Fri, 27 Jun 2003 16:07:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030627200745.GF11167@cannon.eng.us.uu.net>
References: <3EFC878D.50304@cdf123.com> <20030627183259.GE11167@cannon.eng.us.uu.net> <3EFC9618.5070706@cdf123.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3EFC9618.5070706@cdf123.com>
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
To: Chris Frederick <cdf123@cdf123.com>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Fri, Jun 27, 2003 at 02:08:08PM -0500, Chris Frederick wrote:

> I'm running  SuperScan 3.00 on a Windows 2000 box and scanning all ports 
> 1-1000 to test the firewall.
> 
> Are you saying to change the:
> $IPTABLES -A FORWARD -p tcp -i $INET_IFACE -d $INET_IP --dport 80 -j ACCEPT
> to:
> $IPTABLES -A FORWARD -p tcp -d 2.2.2.3 --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp -s 2.2.2.3 --sport 80 -j ACCEPT
> or do both?  Or did I miss the point?

The first one.

The second one is not needed if you already have ESTABLISHED rule.

> 
> If a packet was forwarded to the new destination correctly, but the 
> reply couldn't get through (due to the error you pointed out), would 
> that show up as a closed port on the scanner?  That would explain why 
> it's not showing as open.  When I get home I'll test it again with 
> tcpdump and nmap.
> 
> And for the https, couldn't I use a cert made for the router(2.2.2.2) on 
> ther apache server(2.2.2.3), and fool the client browsers to think that 
> they're the same machine?  This is only for a test environment, so if 
> the cleints testing it get invalid cert errors it's no big deal.

Certs are based on DNS.

Ramin

> 
> Thanks for the info, I'm gona read up on the FORWARD rules a bit more. 
> I think I misunderstood how they worked.
> 
> Chris Frederick
> 

