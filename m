From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT problem /  question
Date: Fri, 18 Jun 2004 17:14:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181714.41952.Antony@Soft-Solutions.co.uk>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net> <20040618180601.7488d0b0.leslie.polzer@gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040618180601.7488d0b0.leslie.polzer@gmx.net>
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
To: netfilter@lists.netfilter.org

On Friday 18 June 2004 5:06 pm, Patrick Leslie Polzer wrote:

> On Fri, 18 Jun 2004 17:45:20 +0200
>
> "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com> wrote:
> > Could you please check my config, if I execute this I can not ping my
> > internal lan ip of this host 172.25.239.208 any more. I think this is
> > really wierd.
>
> Why? These lines:
> > $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT
> > --to-destination 11.0.0.16
> > $IPTABLES -t nat -A OUTPUT -d
> > 172.25.239.220/27 -j DNAT --to-destination 11.0.0.16
>
> are doing everything to keep ALL packets away from you ;)
> All outgoing packets (statement 2) are redirected to 11.0.0.16
> and all incoming are as well (statement 1)!
> How do you expect ping to work with that? :-O

Good point, but surely a ping packet sent to 172.25.239.220 (let's overlook 
the netmask for the time being...) would get redirected to 11.0.0.16, and 
provided that machine responds to the ping (and the reply goes back through 
netfilter's NAT table) the origianting client might see the reply?

However, I am certainly highly confused by what Bert is trying achieve here - 
perhaps the answers to a few questions would help:

1. How many interfaces does the netfilter machine have?   What are their IP 
addresses?

2. Where is machine 11.0.0.16?   How are packets routed to that frm the 
netfiler machine?

3. What address are you sending the ping packets from (and to)?   How is that 
client routed to the netfilter box?

4. What, in simple terms, are you trying to achieve with the two rules which 
Patrick has queried above?

Regards,

Antony.

-- 
"It would appear we have reached the limits of what it is possible to achieve 
with computer technology, although one should be careful with such 
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the list;
                                                           please don't CC me.


