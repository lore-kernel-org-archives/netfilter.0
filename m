From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Redirect ports on localhost
Date: Tue, 23 Mar 2004 18:52:50 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403240252.i2O2qesV018945@server5.bandwidthco.com>
References: <jbm.20040323200102.07b7ea44@alkaid.pc9>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <jbm.20040323200102.07b7ea44@alkaid.pc9>
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
To: forum@users.pc9.org, netfilter@lists.netfilter.org

I remember struggling with this a while.  Beat my head against the wall for
a month.  I finally discovered (after enabling bind debugging mode) the
problem was in my named.conf file:

##########################
# PORTS
##########################
# The listen-on record contains a list of local network interfaces to listen
on. Optionally the port can be
# specified. Default is to listen on all interfaces found on your system.
The default port is 53.
	listen-on port 53 { 192.168.1.1; };
	query-source address * port 53;

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
forum@users.pc9.org
Sent: Tuesday, March 23, 2004 6:01 PM
To: netfilter@lists.netfilter.org
Subject: Re: Redirect ports on localhost

> I'm trying to redirect traffic on my DNS server. I have bind listening 
> on port 5300 (UDP) instead of 53. I've got it working from the 
> internal network but seem to have problem on redirecting localhost 
> traffic. I've tried changing both PREROUTING and OUTPUT chains in the 
> nat table but it doesn't seem to help.
> 
> iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT 
> --to-ports 5300

Absolutely incredible, within the past 15 minutes I have been trying to do
the exact same thing with you -- also, with no luck. Using tcpdump I know
that the port 53 packets are there, but from the DNS server logs I know that
the packets never arrive at port 5300. I tried (unsuccessfuly) to add
essentially the same PREROUTING rule.

Since this worked on my external interfaces but not lo, I'm thinking that
maybe PREROUTING doesn't apply to lo? I don't know. The caveat I had
encountered when doing this for another interface was making sure that the
packet is accepted on that port in the INPUT chain, but that's not the case
here for me.

-- 
forum@users.pc9.org





