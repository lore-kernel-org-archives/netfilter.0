From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sun, 22 Sep 2002 08:35:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0c0601c2623c$f82fd7c0$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020921215923.PLBQ27185.mta03-svc.ntlworld.com@there> <0a9401c261c4$bc771400$c6b22543@repligate> <20020922082118.EQR13996.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, September 22, 2002 3:21 AM
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits


> On Sunday 22 September 2002 12:15 am, Jim Fleming wrote:
> 
> > IPv4 has a 0100 in the first four bits of the 160 bits that come screaming
> > at you down the wire... ...correct ?
> 
> Yes.   Otherwise you wouldn't know it's IPv4.
> 
> > Have you ever set the 16 bits of the Identification Field ?....and used
> > those for Extended Addressing ?
> 
> No, I haven't.   That would be using part of the IPv4 header in a manner 
> different from the standard specification.....

The 0100 is quite wasteful to have it in every packet. In some systems, one could
asssume that by plugging into the right jack, a certain version is being used. Have
you ever calculated how much bandwidth is wasted each year with 4 of the 160 bits
in every packet as useless ? Could those bits be removed and not sent down the wire
to save bandwidth ?...and added in as they go up into the stack ?

As for the "standard specification", part of the purpose of "Netfilter" is to allow people
to process ALL 160 bits in the header. Modules can be added to do all sorts of things.
Do you think NAT is part of the "standard specification" ? Other than 160 bits and
what happens when those are presented to the global core transport, what is the
standard specification ?

What happens to the "standard specification" when you add a programmable engine
to the stack ?...that can be loaded with programs which process the packet flows ?
Have you ever done that ? Can that "Mangle Packets" ? Does that mean the standard
specification is mangled ?

http://www.netfilter.org/

http://ipv8.dyn.ee/INFO/Papers/VPC/


