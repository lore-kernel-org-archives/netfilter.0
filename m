From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirect Question
Date: Fri, 4 Mar 2005 23:05:10 +0000
Message-ID: <200503042305.10834.gdh@acentral.co.uk>
References: <27594E8BA9D5CA458F5EF87D88B6B48F1CC2@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F1CC2@pxtvjoexd01.pxt.primeexalia.com>
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

On Friday 04 March 2005 22:59, Gary W. Smith wrote:
> We have a client moving offices and will need to migrate their DNS (and
> some of their DNS entries) over at some point in time.  But for a variety
> of reasons we cannot do that.  They have 16 IP's at their current location
> and will get another 16 at their new location.
>
> What we would like to do is to have the firewall rewrite or redirect all
> traffic coming in on two IP's and redirect them to two destination IP's on
> the new firewall.

Here, this should help, since I had to do exactly the same thing, although for 
a single IP address (one machine moving co-lo premises)

# Make the firewall act as a non-caching TCP proxy. Useful for machine moves 
whilst DNS propogates.
$IPTABLES -t nat -A PREROUTING -p tcp --dport 80 -d 194.200.209.137 -j DNAT 
--to 213.2.4.33
$IPTABLES -A FORWARD -p tcp --dport 80 -d 194.200.209.137 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp --dport 80 -d 213.2.4.33 -j SNAT --to 
194.200.209.137

In this case the old IP is 194.x.x.x and the new one is 213.x.x.x

All traffic will then appear to come from the machine on the 194.x.x.x network 
doing the redirecting...

gdh

