From: Jason Opperisano <opie@817west.com>
Subject: Re: Internal PC/external Gateway
Date: Sat, 14 May 2005 12:41:44 -0400
Message-ID: <20050514164144.GA24669@bender.817west.com>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1116087634.18707.2.camel@debianbox>
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

On Sat, May 14, 2005 at 07:20:33PM +0300, Sadus . wrote:
> The Multi routing doc is another scenario that includes sharing or load
> balancing between 2 providers to the same machine, that's not what i
> want.
> 
> I tried using iproute2 and iptables (SNAT), but i just don't know what
> to set as default gw for PC2, since PC2 can't see Provider 2 unless the
> gateway of PC2 is the Linux GW (since it got ipforward).
> 
> thanks

something like:

  echo 201 T1 >> /etc/iproute2/rt_tables
  echo 202 T2 >> /etc/iproute2/rt_tables

  ip route add default via $P1 table T1
  ip route add default via $P2 table T2

  ip rule add from $PC1 table T1
  ip rule add from $PC2 table T2

  ip route flush cache

with this packets from $PC1 will be routed via $P1, and packets from
$PC2 will be routed via $P2.  you can set the default gateway of the
linux GW to whichever you prefer.

i am assuming in this scenario that both PC1 and PC2 are being SNAT-ed
to the IP of Linux GW's eth0 interface, and that is OK with P1 and P2.

the default gateway of both PC1 and PC1 is just the internal IP of Linux
GW, in any case.

-j

--
"Brian: Peter, did you read the fine print on this loan contract?
 Peter: If by "read", you mean "imagine the naked lady", then yes."
        --Family Guy

