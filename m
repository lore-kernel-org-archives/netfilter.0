From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packet chain traversals
Date: Mon, 28 Oct 2002 21:37:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021028213720.KZLQ459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210282212420.13890-100000@laptop1.agatha>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210282212420.13890-100000@laptop1.agatha>
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

On Monday 28 October 2002 9:18 pm, Oskar Andreasson wrote:

> Hi Antony,
>
> On Mon, 28 Oct 2002, Antony Stone wrote:
> >
> > Why do you have a routing decision between OUTPUT and NAT ?   What
> > "decision" is there to be made ?
>
> When you bring it to light... I don't know...
>
> Because of your mail, I started checking it out... and I can't actually
> find any "routing" decisions being made after NF_IP_LOCAL_OUT or before
> the IP_NF_POST_ROUTING, nor do any documents I found (so far) point any
> such point out, more than mine...

The only thing I can think of is "which interface should this packet go out 
of", however that's certainly not the same sort of "decision" as there is 
between PREROUTING and INPUT or FORWARD, and I'm not even sure it belongs 
quite where it is shown...

The main reason I commented on it is that I would expect something labelled a 
"decision" to have more than one possible outcome (eg the first routing 
decision leads on to either INPUT or FORWARD depending on the destination 
address), whereas even for the question of which interface to use, this is 
not relevant to netfilter - there are no choices involved.

Anyway, just my 2c, as the saying goes...

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

