From: Florian Westphal <fw@strlen.de>
Subject: Re: Creating a map programmatically using the C library libnftnl
Date: Thu, 30 Mar 2023 21:55:53 +0200
Message-ID: <20230330195553.GC22079@breakpoint.cc>
References: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
 <20230328150941.GB25361@breakpoint.cc>
 <CAOg40qhR5vXo=tkNThLTbZ3nK0MZDf=VwONarYBg4KFokYCqcg@mail.gmail.com>
 <20230330160954.GA22225@breakpoint.cc>
 <CAOg40qjrXRQyMic-KSEA16rxfT4zBPRmPEOkLx-49x9EQPtZew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOg40qjrXRQyMic-KSEA16rxfT4zBPRmPEOkLx-49x9EQPtZew@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Kiernan George <kbg98@vt.edu> wrote:
> That works to create the map, but when I go to add an element through
> the command line it fails with this error:
> 
> root@laptop:/tmp# nft add element netdev example test2 { 1.1.1.1 .
> 1111 : 2.2.2.2 }
> Error: Could not process rule: File exists 
> add element netdev example test2 { 1.1.1.1 . 1111 : 2.2.2.2 }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
> Do you have any insight?

Worksforme.  'File exists' hints that you are adding the same element
again.  The key has to be unique, so:

add element netdev example test2 { 1.1.1.1 . 1111 : 2.2.2.2 }
add element netdev example test2 { 1.1.1.1 . 1111 : 2.2.2.3 } // Fails even if value is different
