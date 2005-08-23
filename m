From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Forward udp and tcp to another external IP address.
Date: Tue, 23 Aug 2005 12:53:09 +0100
Message-ID: <200508231253.09659.gdh@acentral.co.uk>
References: <4309F8B1.1060309@webifi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4309F8B1.1060309@webifi.com>
Content-Disposition: inline
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

On Monday 22 August 2005 17:09, John Kielkopf wrote:
> We're planning on moving a server to another location and to ease to
> move we'd like to for forward all TCP and UDP traffic coming in on a
> particular IP address at location A to a different address at location
> B.  Note that these addresses are from two different hosts.

Here's a standard recipe I've used for doing this..

# Make the firewall act as a non-caching TCP proxy. Useful for machine moves 
whilst DNS propogates.

$IPTABLES -t nat -A PREROUTING -p tcp --dport 80 -d 194.200.209.137 -j DNAT 
--to 213.2.4.33
$IPTABLES -A FORWARD -p tcp --dport 80 -d 194.200.209.137 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp --dport 80 -d 213.2.4.33 -j SNAT --to 
194.200.209.137

In this case, a web server was runnning on 194.200.209.137 that we were 
physically moving to a new location at 213.2.4.33...

These rules were loaded onto the firewall at 194.200.209.254...

Cheers,
Gavin.

