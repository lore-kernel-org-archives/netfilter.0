From: Pablo Allietti <pablo@lacnic.net>
Subject: Re: dnat problem
Date: Sat, 22 Jan 2005 21:26:41 -0300
Message-ID: <20050123002641.GA32546@omega.lacnic.net.uy>
References: <20050122155935.GA20433@omega.lacnic.net.uy>
	<1106423137.4779.6.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1106423137.4779.6.camel@hubcap.ljm.dom>
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
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Sat, Jan 22, 2005 at 02:45:37PM -0500, Jason Opperisano wrote:
> On Sat, 2005-01-22 at 10:59, Pablo Allietti wrote:
> > hi all
> > 
> > i have a problem with dnat i have this struc.
> > 
> > 
> > 		|
> > 		|internet
> > 		|
> > 		Firewall 200.20.43.2
> > 		|
> > 		|
> > 		|
> > 		Server 192.168.1.143
> > 
> > 
> > and i have this rule in the firewall.
> > 
> > iptables  -t nat -A PREROUTING -i eth0 -p tcp --dport 2244  -j DNAT
> > --to-destination 192.168.1.143:22

thanks that is the solution.! :)    jaja nice signature.! Homer say
that.. i love homer


> > 
> > i supouse this rule make a dnat to server 192.... to ssh but nothing
> > happends
> > 
> > i do ssh -p2244 200.20.43.2  but nothing respond
> > 
> > what i miss ? :(
> 
> and you have a FORWARD rule that looks like:
> 
>   iptables -A FORWARD -i eth0 -p tcp -d 192.168.1.143 --dport 22 \
>     -j ACCEPT
> 
> yes?
> 
> -j
> 
> --
> "Kids, you tried your best and you failed miserably. The lesson is,
>  never try."
> 	--The Simpsons
> 
---end quoted text---

-- 


Pablo Allietti
LACNIC
--------------


