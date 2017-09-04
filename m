From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Possible nftables U32 equivalent to read packet's data contents
Date: Mon, 4 Sep 2017 22:55:21 +0200
Message-ID: <20170904205521.GA14891@salvia>
References: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
 <20170901103004.GA16773@salvia>
 <c57ba9690f0d4ec680ce16599e8b15da@nalasexr02h.na.qualcomm.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c57ba9690f0d4ec680ce16599e8b15da@nalasexr02h.na.qualcomm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raul Martinez <mraul@qti.qualcomm.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Raul,

On Fri, Sep 01, 2017 at 04:39:35PM +0000, Raul Martinez wrote:
> Hi Pablo,
> 
> Ultimately my use would be to read the first byte of a ESP IP 
> packet's data payload. So IP layer is where I would want the 
> expression to work in.
> 
> The packets I am working with are identical and need to be 
> routed to one of two interfaces based on if the first byte of 
> the data contents is non-zero. 

OK, so it's just an arbitrary byte. Not anything in a standard header
that needs to be matched.

I'm asking because we could add the protocol definition for what you
need, so we don't need to use raw expressions.
