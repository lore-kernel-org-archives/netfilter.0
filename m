From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Mon, 24 Nov 2008 14:28:25 +0100
Message-ID: <492AABF9.7010603@netfilter.org>
References: <20081113100309.GH26975@bla.fasel.org>, <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>, <492967A9.90105@netfilter.org> <4929E128.11125.2E348CE3@pageexec.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4929E128.11125.2E348CE3@pageexec.freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pageexec@freemail.hu
Cc: netfilter@vger.kernel.org, Wolfram Schlich <lists@wolfram.schlich.org>

pageexec@freemail.hu wrote:
> On 23 Nov 2008 at 15:24, Pablo Neira Ayuso wrote:
> 
>> Thanks for the detailed report and your time. I'm going to push the
>> following patches to git. One of them is a rudimentary test file for
>> automated checking of unset function pointers, this should be better
>> that the big-fat-comment elsewhere :)
> 
> just one comment on this: the memcpy in copy_attr_helper_name should
> probably use a symbolic constant or sizeof instead of a hardcoded value.

I actually did after I sent the patch that I pushed to git yesterday :)

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
