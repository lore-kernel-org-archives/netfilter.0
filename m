From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack userspace nat via NFQUEUE
Date: Mon, 4 Jun 2012 14:20:11 +0200
Message-ID: <20120604122011.GA15680@1984>
References: <4FCBD18F.2020607@distrotech.co.za>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FCBD18F.2020607@distrotech.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory Nietsky <gregory@distrotech.co.za>
Cc: netfilter@vger.kernel.org

On Sun, Jun 03, 2012 at 11:05:19PM +0200, Gregory Nietsky wrote:
> 
> Greetings
> 
> I have been working on userspace nat via NFQUEUE i have it working
> but something does not make
> sense to me.

So, you're implementing NAT in user-space with NFQUEUE, right?

> the code below is to build the conntrack and attach the nat attributes.
> 
> i cannot get it working unless i use the following
> 
> nfct_set_attr_u8(ct, ATTR_TCP_STATE, TCP_CONNTRACK_ESTABLISHED);

Yes, this is mandatory to create a new conntrack entry, with and without
NAT.

> the documentation and examples suggest this is not correct however this way
> it works no other options function.
> 
> as the documentation is not extensive perhaps someone will be able
> to comment on this.
> 
> am i correct to only use this for TCP connections.
> 
> the code for this is available @
> http://pbx.distrotech.co.za/svn/taploop/trunk/ in the framework
> directory.

I have a patch here to improve integration between ctnetlink and
nfnl_queue, but you'll have to wait to see that in mainstream.
