From: dean gaudet <dean@arctic.org>
Subject: Re: per socket nfmark
Date: Wed, 11 Jul 2007 09:14:05 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0707110910550.24929@twinlark.arctic.org>
References: <16.19-30594-1397228818-1184162778@seznam.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <16.19-30594-1397228818-1184162778@seznam.cz>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?us-ascii?Q?=20?= <tomasnull@seznam.cz>
Cc: netfilter@lists.netfilter.org


On Wed, 11 Jul 2007,   wrote:

>  I would like to bring up the question, if there is a way to associate a 
> nfmark with a socket. It would be very helpful as it saves the matching 
> against iptables rules which would have to than match the packet and 
> associate the nfmark.
> 
> The same question was already posted here:
> http://lists.netfilter.org/pipermail/netfilter/2002-October/039074.html

i ended up using IPTOS to do what i wanted... it can't handle nearly as 
many cases, but i ended up just burning a few extra IP addresses to get 
all the traffic shaping classes i needed.

i wrote a mod_iptos for apache so it could set IPTOS appropriately 
depending on response size, or vhost or whatever.

http://arctic.org/~dean/mod_iptos/

i haven't ported it to apache 2.x yet.

-dean


