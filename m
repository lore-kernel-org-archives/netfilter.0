From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: chownat
Date: Mon, 04 Aug 2008 11:42:43 -0500
Message-ID: <48973183.10404@riverviewtech.net>
References: <48971B26.7090905@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48971B26.7090905@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/04/08 10:07, Brent Clark wrote:
> Has anyone played with chownat.

I can't say as I have.

> I haven't played or tested it, but from what I gather, isn't this how 
> skype is works and theoretically breaks / gets past NAT.

I don't know how Skype works so I can't say.  I believe the general 
premise behind things like this is that NAT can fairly easily be 
subverted by having both ends try to initiate an outbound connection to 
each other in such a manner that the outbound connections can end up in 
fashion (a very poor choice of words) ""spliced together by some how 
confusing (?) the NAT table and / or state table so that the NATing 
devices believe that each end is really receiving replies to its own 
outbound connections from the other end.  Thus there is a form of two 
way tunnel between the two end.  I believe that usually a third entity 
in the middle is needed to initiate the connection which once initiated 
falls back to just the two end points.

Take a look at how STUN works for UDP and VoIP.

> In my opinion and proving that people that solely rely on NAT, are in 
> for a surprise.

The thing that you have to remember is 1) this type of tunnel requires 
active support (someone doing something) on both ends, 2) NAT is not a 
security mechanism, and 3) this does not take in to account any form of 
egress filtering that should help stop this.

> I look forward to peoples opinion / thoughts.

*nod*

Please provide more of your opinion / concerns for the sake of discussion.

> Hope im wrong.

I don't think you are wrong.  Things like this can and will be abused. 
There are also cases where things like this are a good thing, i.e. STUN 
for VoIP.  This, or its technology, is a tool and just like any other 
tool, it can be used for both good *and* bad.



Grant. . . .
