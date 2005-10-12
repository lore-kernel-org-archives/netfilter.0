From: Lore <skizzo82@yahoo.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Thu, 13 Oct 2005 00:31:32 +0200 (CEST)
Message-ID: <20051012223132.61522.qmail@web52807.mail.yahoo.com>
References: <Pine.LNX.4.61.0510122305270.31374@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510122305270.31374@filer.marasystems.com>
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org


--- Henrik Nordstrom <hno@marasystems.com> ha scritto:


> In the simplest case where only the media changes
> but the IP network is 
> the same no changes at all is required other than to
> bring up/down the 
> different network connections.
> 
> For the more complex case where one has to be able
> to move between 
> different IP networks with preserved connectivity
> one normally implements 
> something like this by using tunnelling by IPIP,
> GRE, IPSec, OpenVPN or 
> similar.
> 
> How does your approach compare to these
> alternatives?
> 
> Regards
> Henrik
> 

I'm trying to do this in a transparent way. every
program that uses tcp will be able to work with this
daemon without being aware of its existence.
Is there anything that works like this?

Then a question about the simpliest case:
What happens if I remove the device where the network
is attached (and I care to bring up another device
with the same ip as the former)???
I thought that linux uses to link the socket to an
interface, is it wrong?

Thank you.
Lore


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

