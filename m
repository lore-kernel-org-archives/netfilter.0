From: Evan Borgstrom <evan@fatbox.ca>
Subject: Re: conntrackd: segfault at ignore_pool.c:37
Date: Wed, 02 Jul 2008 02:15:07 -0400
Message-ID: <486B1CEB.8090800@fatbox.ca>
References: <486B144A.8070707@fatbox.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486B144A.8070707@fatbox.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> Both nodes are set with CacheWriteThrough on. When I run Sync in FTFW 
> mode the segfault usually takes a little while to occur. If I switch to 
> NOTRACK or ALARM mode the segfault happens almost immediately.
> 
> In all instances the segfault looks the same and happens at the same 
> point at ignore_pool.c. 

Go figure... after spending awhile trying to solve this before I sent 
the first message, I finally got it within 5 minutes of sending it.

On the node that was having this issue the nf_conntrack_ipv4 module was 
not loaded. Once I loaded that module everything is up and running and 
there hasn't been a segfault in about 45 minutes.

-Evan

-- 
Evan Borgstrom <evan@fatbox.ca>
FatBox Inc.
255 Richmond St East, Suite 1213
Toronto, Ontario, M5A 4T7
t:416.833.3763 | f:888.829.5963
msn: evan@fatbox.ca | aim: evan@fatbox.ca
