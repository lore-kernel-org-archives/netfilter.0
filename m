From: Jason Opperisano <opie@817west.com>
Subject: Re: dnat problem
Date: Sat, 22 Jan 2005 14:45:37 -0500
Message-ID: <1106423137.4779.6.camel@hubcap.ljm.dom>
References: <20050122155935.GA20433@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050122155935.GA20433@omega.lacnic.net.uy>
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

On Sat, 2005-01-22 at 10:59, Pablo Allietti wrote:
> hi all
> 
> i have a problem with dnat i have this struc.
> 
> 
> 		|
> 		|internet
> 		|
> 		Firewall 200.20.43.2
> 		|
> 		|
> 		|
> 		Server 192.168.1.143
> 
> 
> and i have this rule in the firewall.
> 
> iptables  -t nat -A PREROUTING -i eth0 -p tcp --dport 2244  -j DNAT
> --to-destination 192.168.1.143:22
> 
> i supouse this rule make a dnat to server 192.... to ssh but nothing
> happends
> 
> i do ssh -p2244 200.20.43.2  but nothing respond
> 
> what i miss ? :(

and you have a FORWARD rule that looks like:

  iptables -A FORWARD -i eth0 -p tcp -d 192.168.1.143 --dport 22 \
    -j ACCEPT

yes?

-j

--
"Kids, you tried your best and you failed miserably. The lesson is,
 never try."
	--The Simpsons


