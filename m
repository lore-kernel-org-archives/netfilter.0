From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: how to forward packets to another gateway, if i'm one
Date: Tue, 17 Dec 2002 17:07:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFF4BAD.6080306@istitutocolli.org>
References: <ISPFE7vXn10A5fpk965000657df@mail.takas.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ISPFE7vXn10A5fpk965000657df@mail.takas.lt>
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
To: netfilter@lists.netfilter.org

Saulius Menkevicius wrote:
>   Now, I want to make some traffic that comes from some client and 
> that should go through gateway 10.0.0.1 to be forwarded to 10.0.0.2 
> (without any changes). The need is to make the forwarding transparent 
> to both 10.0.0.2 and the client.

in 10.0.0.1

ip rule add from YOUR_CLIENT [to DESTINATION] table fbsd.out
ip route add default via 10.0.0.2 dev $DEV table fbsd.out

I think this should do the job (for more information http://lartc.org/)
you create a routing table (fbsd.out) that will use 10.0.0.2 as gateaway 
for packets comming from your client.

I did not test this config, since I'm marking packets in the FORWARD 
chain of the mangle table and use
ip rule add fwmark to route them.

hope this helps.
andrea


