From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: DNAT problem /  question (nfcan: addressed to exclusive sender for this address)
Date: Fri, 18 Jun 2004 12:29:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040618162902.GE1243@salty>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net> (from +nfcan+jimlaur+89aa08404c.Bert.Arnauts#fujitsu-siemens.com@spamgourmet.com on Fri, Jun 18, 2004 at 11:45:20 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.06.18 11:45, Arnauts Bert  - Bert.Arnauts@fujitsu- 
siemens.com wrote:
> Hello all,
> 
> I am still stuck with my DNAT. I updated the information
> that was requested. Could you please check my config, if  
> I execute this I can not ping my internal lan ip of this  
> host 172.25.239.208 any more. I think this is really  
> wierd. I included all kinds of information, hopefully  
> enough for you guys to take a look at.
> 
> Cheers,
> 
> Bert
> 
> $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27
> -j DNAT --to-destination 11.0.0.16

> $IPTABLES -t nat -A  OUTPUT -d 172.25.239.220/27
> -j DNAT --to-destination 11.0.0.16
>

The dest ip address/mask pattern looks odd.
I am not sure how this address matching works,
but the way I imagine it to work is that a mask
is generated and applied to an address to test
and then this is compared to the address given.
That is, I think the address given is not
masked. If this is so, then there might be a
failure to match destination addresses.

I think a /27 mask is meant to select a
contiguous group of 27 addresses, that is
5 bits. I think masking the 5 low bits of
a number like 220 or 208 gives 192 (xC0)
and a rule like .192/27 would match addresses
in the range 192-223 (xC0-xDF),
where .220/27 might match nothing.

Of course, the code might be written another
way, where this would not be a problem.

You could try logging what is happening
or looking at the counts to see if the
rules are matching. I think this will do it:

iptables -L -t nat -nvx

Jim

