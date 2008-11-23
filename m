From: pageexec@freemail.hu
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Mon, 24 Nov 2008 00:03:04 +0200
Message-ID: <4929E128.11125.2E348CE3@pageexec.freemail.hu>
References: <20081113100309.GH26975@bla.fasel.org>, <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>, <492967A9.90105@netfilter.org>
Reply-To: pageexec@freemail.hu
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <492967A9.90105@netfilter.org>
Content-description: Mail message body
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, Wolfram Schlich <lists@wolfram.schlich.org>

On 23 Nov 2008 at 15:24, Pablo Neira Ayuso wrote:

> Thanks for the detailed report and your time. I'm going to push the
> following patches to git. One of them is a rudimentary test file for
> automated checking of unset function pointers, this should be better
> that the big-fat-comment elsewhere :)

just one comment on this: the memcpy in copy_attr_helper_name should
probably use a symbolic constant or sizeof instead of a hardcoded value.

