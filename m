From: Andre Kalamandeen <x_trodinary@yahoo.com>
Subject: Re: Policy routing with mark not working.
Date: Mon, 22 May 2006 13:38:02 -0700 (PDT)
Message-ID: <20060522203802.76801.qmail@web53307.mail.yahoo.com>
References: <803aaa110605121710s26eaccf6r4a8d9bd78924721b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <803aaa110605121710s26eaccf6r4a8d9bd78924721b@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

hmm,  im getting a new problem with this,

Just a recap of what im doing :
Setting up linux box with transparent squid and
sending special packets (marked) through a different
gateway.

I have 3 ethernet cards connected (1 for local, 2 for
internet - one being set as default route)


now as i've mentioned before i've used iptables mangle
table (OUTPUT) to do a string match, and marked those
packets with 0x4. i've set up an ip rule and route to
handle the marked packets.

The problem i am having is that marked packets are
going through both the default gateway and the other
gateway (i've checked the logs on both routers)the
result being that the client page is never loaded. 

Any suggestions?


> Yes, you are correct about PREROUTING, although
> there was dual-homed
> howto that made no mention of how to handle
> locally-generated traffic
> but just used PREROUTING, and I initially went down
> that dead-end
> That's what I get for taking an example config at
> face value and not
> doing sufficient research.  However, diagrams such
> as the one at
> http://www.docum.org/docum.org/kptd/  show the
> routing decision made
> before the OUTPUT chain, making me believe setting a
> mark there
> wouldn't work.  After further research I discovered
> that the routing
> decision is revisited if the packet is later changed
> (i.e., a mark
> being set in the OUTPUT chain), and that important
> detail seems to be
> left out of the traversal diagrams I've found before
> now (the one
> mentioned above does have some notes below it
> mentioning the
> rerouting, but otherts I found didn't).
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

