From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: POSTROUTING
Date: Thu, 19 Feb 2004 00:45:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040219004520.18352b71.arnt@c2i.net>
References: <BFEIJHPOPCCMOPEKHHMOAEEHCOAA.giovanni.costagliola@nexusat.it>
	<4033AE6E.4010008@divx.team.lv>
	<200402181825.35022.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402181825.35022.Antony@Soft-Solutions.co.uk>
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

On Wed, 18 Feb 2004 18:25:34 +0000, 
Antony Stone <Antony@Soft-Solutions.co.uk> wrote in message 
<200402181825.35022.Antony@Soft-Solutions.co.uk>:

> On Wednesday 18 February 2004 6:26 pm, capsx wrote:
> 
> > !
> >
> > I want as source to specify a chain
> > not -s 10.0.0.0/27 but something like -s LOCAL_NET_CHAIN
> 
> You can't do that.   -s takes an address or network range.   -i takes
> an interface name.   You cannot specify anything else as the 'source'
> of a packet.
> 
> Tell us why you want to do this and we might be able to suggest an
> alternative 

..I suspect he means he wants " -s $LOCAL_NET " or somesuch, such
variables needs first be defined like ' LOCAL_NET="10.0.0.0/27" ', 
for larger sites, it's possible to script these definitions, check the 
http://tldp.org/LDP/abs/html/ over at http://tldp.org/guides.html for
ideas.

> (MARKing packets comes to mind, for example).

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



