From: Florian Westphal <fw@strlen.de>
Subject: Re: Nftables + ALG + Linux =?utf-8?B?Ni4x?=
 =?utf-8?B?LjAtMTAtYW1kNjQg4oCmPy4uLg==?= is it a kown Problem?
Date: Tue, 1 Aug 2023 22:11:48 +0200
Message-ID: <20230801201148.GB32288@breakpoint.cc>
References: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
 <20230731133608.GA21425@breakpoint.cc>
 <b47e1dc20a97eb4e6972d5cbfd2cf9dcaaab7e06.camel@mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b47e1dc20a97eb4e6972d5cbfd2cf9dcaaab7e06.camel@mail>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: toml <toml@thlu.de>
Cc: netfilter@vger.kernel.org

toml <toml@thlu.de> wrote:
> Am Montag, dem 31.07.2023 um 15:36 +0200 schrieb Florian Westphal:
> > You need to assign the helper to use in your nftables ruleset.
> > 
> 
> > You might need to do this from output too if you need
> > this to work from the machine itself as well.
> 
> That is my test rule. My Server is both, FTP-Server (Web-Cams) and FTP-
> Client for various uploads.
> 
> If I understand correctly, incoming packets (as FTP-Server) will first
> activate the helper in prerouting. The input rules then allow the
> control channel port 21 and the helper the (related) data channel port
> n.
>
> For outgoing packets (as FTP-Client) first the helper is activated in
> the output chain, then port 21 is allowed again, the helper handles the
> related data channel. 
> 
> Have I understood this correctly?

Sounds about right, helper assignment looks correct to me.
