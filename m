From: Hitesh Ballani <hb69@cornell.edu>
Subject: Re: tunneling and iptables
Date: Wed, 10 Mar 2004 03:15:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
References: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu> <1078902997.2564.18.camel@anduril.intranet.cartel-securite.
 net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078902997.2564.18.camel@anduril.intranet.cartel-securite.
 net>
References: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


>
> > Also,  the mark extension allows you to mark packets with 16-bits marks
> > which is big enough to encode the port number, but if i try to add policy
> > routing on the fly using the ip rules command then i get screwed because
> > the table-id (for specifying which table has the rules to route this
> > packet) is only 8-bits and so, I cannot encode the port numbers in there
> > ... i know this is not a clear description but if you know anything about
> > this problem, i would be more than happy to spell the details out...
>
>-Do you really need the full 16 bits space ? I mean that you'll need it
>-if you have 16^2 different routes (one mark per route) which should not
>-the case.

thanks for your comments on tunnels ... actually i am working on a model 
for anycast deployment and need to have the 16 bits so that i can support 
256*(2^16) services using a single /24 block .. by the way, how heavy are 
tunnels - i.e how many can the kernel support .... but i have almost given 
up on using the standard iptables interface - i am thinking of writing a 
module that uses a netfilter hook.... while i think i have the details 
figured out, any word of advice will be highly appreciated !

Thanks again,

Hitesh 


