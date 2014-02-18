From: Mark Fox <mark.fox@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 20:02:37 +0000 (UTC)
Message-ID: <loom.20140218T205158-486@post.gmane.org>
References: <loom.20140218T183628-993@post.gmane.org> <5303B490.6070606@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Leonardo Rodrigues <leolistas <at> solutti.com.br> writes:
>      There's no right or wrong on how your FORWARD default rule should 
> be. Being DROP or ACCEPT depends on your network security policies.
> 
>      Being ACCEPT the default action for FORWARD, your linux router will 
> forward anything from one side to the other, unless it's explicity 
> DROPped on the rules. Being DROP the default action, everything will be 
> dropped, except explicitely ACCEPTed by your rules.
> 
>      Which one fullfit you demands ? So that's the right one for you ! 
> No one can tell you, giving only the information you wrote, that DROP or 
> ACCEPT is right or wrong. There's really no right or wrong here, there's 
> what fullfilts your demands/needs and what doesnt.

Thanks for the reply, Leonardo. I'm not asking someone else to tell me what
is the right thing to do. What I'm wondering is what kind of damage someone
else on the network could use a machine with a permissive forwarding policy
to do. Spoofing obviously, but anything else?

With that better understanding, I'll be equipped to make that call.

In the larger context, the fact that several popular Linux distributions
come configured with a firewall that allows all forwarding, all incoming
connections and all outgoing connections is somewhat surprising.

Mark



