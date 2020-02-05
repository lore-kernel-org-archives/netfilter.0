From: Florian Westphal <fw@strlen.de>
Subject: Re: BNF for nftables?
Date: Wed, 5 Feb 2020 12:42:04 +0100
Message-ID: <20200205114204.GE26952@breakpoint.cc>
References: <416a106d-c649-7a99-0241-389ba6efdafe@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <416a106d-c649-7a99-0241-389ba6efdafe@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> wrote:
> Failing a formal lint(1) program, is there a complete BNF description of the
> language?

No, but it should be possible to extract it from the bison grammar
(src/parser_bison.y in nftables source code).
