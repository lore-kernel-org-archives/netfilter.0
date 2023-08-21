From: Carl Lei <me@xecycle.info>
Subject: Re: nft tproxy failed to redirect on one system
Date: Mon, 21 Aug 2023 15:48:07 +0800
Message-ID: <196291AF4921A1FE+20230821154807.270690a5@xcws1>
References: <20230811120043.0c3c6302@xcws1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230811120043.0c3c6302@xcws1>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Btw: sent to wrong address, re-sent to list...

On Fri, 11 Aug 2023 12:00:43 +0800
Carl Lei <me@xecycle.info> wrote:

> Sorry for being incomplete, but I added nftrace before these rules and
> saw packets went through the same chain of rules, first hitting tproxy
> in mangle, then meta mark 42 counter accept in input-new-isolated.
> But on one system it works for local programs AND network-received
> packets, on another system it works only for local programs.  On the
> bad system the packets instead gets directed to whatever program
> originally listening on the original port, or rejected; e.g. I have
> an nginx listening on 0.0.0.0:80 but no programs on 443, then curl
> http in a vm connected to vbr0 goes to my nginx, and curl https gets
> rejected.  I expect them to go to that program listening on 1081.  

Looked closer at the trace, I found that on the bad system, when the
packet goes back to input rules, its trace id changed; on the good
system it does not change.  Perhaps this explains it, but I don't know
why it was changed?

Thank you.



