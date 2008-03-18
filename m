From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: conntrack can't delete more conntrack records
Date: Tue, 18 Mar 2008 11:42:05 +0000 (UTC)
Message-ID: <slrnftvajs.soe.petr.pisar@album.ics.muni.cz>
References: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz> <47D67370.6000103@netfilter.org> <slrnftde87.u6d.petr.pisar@album.ics.muni.cz> <47D94D87.8050506@netfilter.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2008-03-13, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Petr Pisar wrote:
>> cc1: warnings being treated as errors
>> In file included from sync-mode.c:27:
>> ../include/network.h:64: warning: declaration of `conf' shadows a global declaration
>> ../include/conntrackd.h:144: warning: shadowed declaration is here
>
> Already applied a patch for that, please get a working copy from SVN 
> which includes these fixes. Let me know if it's OK for you.
>
No, revision 7407 of conntrack-tools, the same error. Actually, svn log
doesn't mention anything about the patch.

-- Petr


