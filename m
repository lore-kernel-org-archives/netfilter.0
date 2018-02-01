From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to get rule handle when adding a rule using libnftnl?
Date: Thu, 1 Feb 2018 18:06:14 +0100
Message-ID: <20180201170614.7aiziqewvivb5eqw@salvia>
References: <CADB9fJF-rpjBo=DXeO7sxeH-9U4y5LytGWba5nUG_xfPkar-qg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADB9fJF-rpjBo=DXeO7sxeH-9U4y5LytGWba5nUG_xfPkar-qg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Grunt <gruntblue@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Feb 01, 2018 at 07:02:09PM +0300, Eric Grunt wrote:
> After adding a rule, one needs it's handle for eg deleting it again.
> On the command line it's aquired via the -a flag (nft list ruleset -a),
> but how is this done outside command line, programmatically?
> 
> As far as I understand, the handle is assigned by the kernel,
> so it should not be accessible before the mnl_socket_sendto() call.
> Can it be accessed using mnl_cb_run() or is a separate netlink command
> needed for this?

Yes.

Set the NLM_F_ECHO flag in the message you send to kernel, the message
coming back from the kernel as reply contains the rule description in
netlink format, including the rule handle has been allocated.

I'm refering to the netlink flags that you pass to
nftnl_nlmsg_build_hdr() when building the netlink header.
