From: Jason Opperisano <opie@817west.com>
Subject: Re: Simple Blackberry Enterprise configuration
Date: Wed, 17 Nov 2004 14:17:05 -0500
Message-ID: <20041117191705.GA11797@bender.817west.com>
References: <29F6FAF7F2C0D41190980002A513591E0E93BA73@FSNSAB30>
	<OF7FC3DD38.EC276557-ON85256F4F.00658DF0-85256F4F.00689762@informed.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF7FC3DD38.EC276557-ON85256F4F.00658DF0-85256F4F.00689762@informed.net>
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
To: netfilter@lists.netfilter.org

On Wed, Nov 17, 2004 at 01:30:03PM -0500, mclinden@informed.net wrote:
> The external interfaces on the Linux box is managed by TCPWRAPPERS but I'd 
> like to have the service restricted even more so that only the Blackberry 
> Enterprise Server can FORWARD through the firewall and ONLY to the 
> Blackberry site:
> 
> The internal server Blackbery  IP is:   172.16.8.39
> The internal firewall (eth1) is:                172.16.11.242
> The external firewall (eth0) is:                aaa.bbb.ccc.ddd
> 
> My configuration is:
> 
> -A FORWARD -i eth1 -p tcp -m tcp --sport 3101 --dport 3101 -j ACCEPT 
> -A FORWARD -i eth0 -o eth1 -p tcp -m tcp --sport 3101 --dport 3101 -m 
> state --state RELATED,ESTABLISHED -j ACCEPT 
> -A FORWARD -j REJECT --reject-with icmp-port-unreachable 

i *highly* doubt that the source port of the traffic is 3101.  try:

  -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
  -A FORWARD -p tcp --sport 1024:65535 --dport 3101 -j ACCEPT

as your "open, testing" policy.  source/destination IP restrictions can
be added later as you get more comfortable with the configuration.

> (I started out with a relatively open configuration so as not to introduce 
> too many problems). 
> 
> This doesn't seem to be doing it.
> 
> Thanks for all your help.
> 
> Sean

-j

--
"I bet Einstein turned himself all sorts of colors before he invented
 the light bulb."
        --The Simpsons

