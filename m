From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Packet chain traversals
Date: Mon, 28 Oct 2002 22:18:50 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210282212420.13890-100000@laptop1.agatha>
References: <20021028083249.ZXO18329.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021028083249.ZXO18329.mta06-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Hi Antony,

On Mon, 28 Oct 2002, Antony Stone wrote:

> On Sunday 27 October 2002 6:52 pm, Oskar Andreasson wrote:
> 
> > Forgot to attach the script in question....
> 
> Hi Oskar.
> 
> Just a small point which has me puzzled about the diagram:
> 
> Why do you have a routing decision between OUTPUT and NAT ?   What "decision" 
> is there to be made ?

When you bring it to light... I don't know... The statement is an artifact 
from the really really early stages of the tutorial, something like the 
second release I made. To my recollection someone mentioned it to me in a 
mail, but I am not sure. 

Noone has complained so far, and I haven't actually thought about it 
either so.... it's still there. 

Because of your mail, I started checking it out... and I can't actually 
find any "routing" decisions being made after NF_IP_LOCAL_OUT or before 
the IP_NF_POST_ROUTING, nor do any documents I found (so far) point any 
such point out, more than mine... ugly... really ugly.

I will check some more in the source code and see if I am really that off 
base. Comments are more than welcome!

----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net


