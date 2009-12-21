From: don-nfil2@isis.cs3-inc.com (Don Cohen)
Subject: Re: u32 question
Date: Sun, 20 Dec 2009 22:31:56 -0800
Message-ID: <19247.5724.521673.970517@isis.cs3-inc.com>
References: <20091219231018.B79C41A8193@isis.cs3-inc.com>
	<19245.36072.654916.551426@isis.cs3-inc.com>
	<4B2F0D0F.8030100@ziu.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B2F0D0F.8030100@ziu.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Michal Soltys writes:

 > This match in its current version does plenty of sanity checks, and 
 > moving back using negative offsets don't work (as negative offsets 
 > are not allowed and the data is internally treated as big >0 value 
 > - thus failing the match). You have two options: 

I thought the original version did plenty of checks and specifically 
DID allow negative offsets, which is intentional because, as we see 
from published examples (that no longer work), that's useful.
Is there any reason that capability shouldn't be restored as the
normal version that appears in linux distributions?

 > - patch the xt_u32.c to allow earlier behavior
 > - use match2 from xtables-addons (separate options for matching)

 > For reference:
 > 
 > http://xtables-addons.sourceforge.net/
 > http://marc.info/?t=125219819200001&r=1&w=2

I see that the patch is available here.  It's just relatively
inconvenient to use it compared to things working as intended out of
the box.  I have to say that it's not all that obvious in EITHER of
the two options just what you have to do in order to fix the problem
on your own machine.  Where can I find such instructions?


BTW, in response to some of the comments I see in the second
reference, 
- I would be very surprised to see frames of 2GB any time in the
foreseeable future
- If you're worried about that I suggest that (at least on a 64 bit
machine) you allow 64 bit offsets so on a 64 bit machine
 -3 => 0xfffffffffffffffd.
