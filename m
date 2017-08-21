From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: "Test" mode for nft?
Date: Mon, 21 Aug 2017 23:28:24 +0200
Message-ID: <CAOkSjBgT86Z=R92jHwiuNZT0M5Pdu2aUSK2Yd4L0J8vUtJMGhg@mail.gmail.com>
References: <27b5c43e-a173-b292-3878-e655f53a2dc2@allycomm.com>
 <A9D44313-3B7A-4BD0-A308-AFA150BA50A1@nativemethods.com> <a8dbbb49-6583-f670-78ed-4208b0689288@wagsky.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a8dbbb49-6583-f670-78ed-4208b0689288@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>, J Doe <general@nativemethods.com>

On 21 August 2017 at 19:54, Jeff Kletsky <netfilter@allycomm.com> wrote:
> Thanks, good to know I wasn't missing anything.
>
> The cron job certainly works in a development environment. There is also the
> approach to use a script that captures the current state, loads the new
> rules, then waits for keyboard input for a length of time. If there isn't a
> "yes, keep these" response, it reverts to the previous state.
>

This has been already discussed in Netfilter Workshop 2017 in Faro, Portugal.
So, we are likely getting this feature at some point.

A 'dry' mode has been recently added and will be part of next nftables release.

Reference:
http://git.netfilter.org/nftables/commit/?id=b4953803f26c442cdec4cad78a8261e9b97cd015
