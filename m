From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Sun, 23 Nov 2008 15:36:26 +0100
Message-ID: <49296A6A.1070208@netfilter.org>
References: <49216734.9080505@netfilter.org> <49255C80.8215.1C8E5CB2@pageexec.freemail.hu> <492967A9.90105@netfilter.org> <20081123142911.GJ7976@bla.fasel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081123142911.GJ7976@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Wolfram Schlich wrote:
> * Pablo Neira Ayuso <pablo@netfilter.org> [2008-11-23 15:25]:
>> [...]
>> Thanks for the detailed report and your time. I'm going to push the
>> following patches to git. One of them is a rudimentary test file for
>> automated checking of unset function pointers, this should be better
>> that the big-fat-comment elsewhere :)
> 
> Thanks, Pablo! :)
> I'll add the patches to our Gentoo ebuild for 0.9.8.
> When do you plan to release a new version?

I'll release one libnetfilter_conntrack including these fixes soon,
probably along this week.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
