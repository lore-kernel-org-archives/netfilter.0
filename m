From: Mohammad Khan <mkhan@lextranet.com>
Subject: Re: Let me understand *RETURN*
Date: Fri, 18 Feb 2005 13:01:25 -0500
Message-ID: <1108749685.9509.25.camel@localhost.localdomain>
References: <1108743358.9509.12.camel@localhost.localdomain>
	<20050218173442.GA32562@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050218173442.GA32562@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Fri, 2005-02-18 at 12:34, Jason Opperisano wrote:
> On Fri, Feb 18, 2005 at 11:15:58AM -0500, Mohammad Khan wrote:
> > I have couple of chains and rules for filter table
> > 
> > -N TCP_IN
> > -N TCP_OUT
> > -N UDP_IN
> > -N UDP_OUT
> > -N ICMP_IN
> > -N ICMP_OUT
> > 
> > -N P1_IN
> > -N P1_OUT
> > -N P2_IN
> > -N P2_OUT
> > 
> > -A FORWARD -d IP_OF_P1 -j P1_IN
> > -A FORWARD -s IP_OF_P1 -j P1_OUT
> > 
> > -A FORWARD -d IP_OF_P1 -j P1_IN
> > -A FORWARD -s IP_OF_P1 -j P1_OUT
> 
> why do you have the above 2 rules twice?
Sorry, copied and pasted .. 
should be 
-A FORWARD -d IP_OF_P1 -j P1_IN
-A FORWARD -s IP_OF_P1 -j P1_OUT
-A FORWARD -d IP_OF_P2 -j P2_IN
-A FORWARD -s IP_OF_P2 -j P2_OUT

> 
> 
> > -A FORWARD -j LOG --log-prefix "NOT_FORWARDED "
> > -A FORWARD -j DROP
> > 
> > -A P1_IN -t TCP -j TCP_IN
> > -A P1_IN -t UDP -j UDP_IN
> > -A P1_IN -t ICMP -j ICMP_IN
> > -A P1_IN -j RETURN
> > 
> > -A TCP_IN -t TCP --dport 80 -J ACCPET
> > -A TCP_IN -j RETURN
> 

Sorry again.. for the typo

should be:
-A P1_IN -p TCP -j TCP_IN
-A P1_IN -p UPD -j UDP_IN
-A P1_IN -p ICMP -j ICMP_IN
-A P1_IN -j RETURN
 
-A TCP_IN -p TCP --dport 80 -j ACCEPT
-A TCP_IN -j RETURN

> the option to specify the protocol is "-p" not "-t" (that specifies the
> table to operate on)
> 
> > For any tcp packet that going to P1 and don't have destination port 80: 
> > 
> > returned to P1_IN chain from TCP_IN chain, then after
> > returned to FORWARD chain from P1_IN, and finally
> > dropping the packet after kept log.
> > 
> > Am I right?
> 
> yes, assuming the IP P1 is not local to the gateway in question.

IP_OF_P1 is local IP.
I didn't typed rules for P2_IN and P2_OUT


I am just trying to understand *RETURN* .

Thanks
Mohammad





