From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: FORWARD Chain Question (nfcan: addressed to exclusive sender
	for this address)
Date: Mon, 12 Dec 2005 19:16:56 -0500
Message-ID: <20051213001656.GE1795@salty>
References: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com> (from
	+nfcan+jimlaur+17e0952d2c.gene#poh.com@spamgourmet.com on Mon,
	Dec 12, 2005 at 16:46:09 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.12.12 16:46, Gene Dellinger - gene@poh.com wrote:
> To All:
> I got some helpful information, thanks to those who responded, I am still a
> bit fuzzy though.
> A packet coming in ETH0 destined for a system connected to ETH1, will that
> packet begin in the PREROUTING
> chain on ETH1(sample 1) and then out or go to the FORWARD chain(sample 2)
> and then out.

Neither example matches the structure of netfilter.
There is only one each of prerouting, forward, postrouting.
There is not one chain per interface.
If you need to specify the interface in a rule,
you must use the -i and -o fields in that rule.
One or the other of these fields may not be useable in some chains.

> 
> ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
>          |	           |            |
>        INPUT  	     |         OUTPUT
>          |	          \|/	      |
>       Local Process    |         Local Process
> 		           |
> 	   ----<---<-----|
> 	   |
>         \|/
> ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
>          |			            |
>        INPUT  		          OUTPUT
>          |			            |
>       Local Process		   Local Process
> 
> sample 1
> _________________________________________________________
> 
> ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
>          |	           |          |
>        INPUT  	   |  	    OUTPUT
>          |	          \|/	      |
>      Local Process       |      Local Process
> 		           |
> 		           |
> 		           |
> 		          \|/
> ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
>          |			            |
>        INPUT  		          OUTPUT
>          |			            |
>      Local Process		 Local Process
> 
> sample 2
> _________________________________________________________
> 
> 
> Thanks Again
> Gene D.
> 
> 
> -----Original Message-----
> From: Gene Dellinger [mailto:gene@poh.com]
> Sent: Friday, December 09, 2005 2:40 PM
> To: netfilter@lists.netfilter.org
> Subject: FORWARD Chain Question
> 
> 
> On a multi-homed machine being used as a firewall, if
> a packet is forward'd from one interface to another.
> Does the packet enter the in at PRE-ROUTING portion of iptables
> chain again for that interface? It may seem obvious but
> I just want to make sure I am clear on that aspect of the
> chain traversal.
> 
> Thanks
> Gene D.
> 
> 
>

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

