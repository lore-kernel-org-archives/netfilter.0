From: Jason Opperisano <opie@817west.com>
Subject: Re: Balancing Web Traffic
Date: Tue, 29 Mar 2005 16:45:05 -0500
Message-ID: <20050329214505.GA11669@bender.817west.com>
References: <1112108665.1136.48.camel@Knoppix>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1112108665.1136.48.camel@Knoppix>
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

On Tue, Mar 29, 2005 at 05:04:25PM +0200, Miguel Amador wrote:
> Hi all
> 				
> I have:	
> 				      ___ WWW1 __
> Inet <--> [Iptables/Netfilter Box ---|	         |- BD
> 				     |___ WWW2 __|
> 					
> My question is, somebody know anyway to balanced the traffic to the
> Webservers with iptables ?
>  I know that if i repeat Nat's rules for different ip's (ip's of web
> services) iptables does a primitive balanced... but anybody know other
> way ?

you can do bone-headed round-robin load-balancing with "-j DNAT --to
destination $WWW1_IP --to-destination $WWW2_IP"

for intelligent load-balancing, look at:

http://www.linuxvirtualserver.org/

-j

--
"I saw weird stuff in that place last night. Weird, strange, sick,
 twisted, eerie, godless, evil stuff. And I want in."
         --The Simpsons

