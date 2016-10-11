From: frank <frank@undermydesk.org>
Subject: Re: ulogd2 / segfault in ulogd_raw2packet_BASE.c with kernel 4.8.1
Date: Tue, 11 Oct 2016 09:16:22 +0200
Message-ID: <a3d68560-143a-7907-0440-6d6ce9698bdb@undermydesk.org>
References: <de2d542d-c543-d254-beae-990a988effcf@undermydesk.org>
 <1476055564.5747.1.camel@regit.org>
 <d5fd9a36-7aaf-9a49-c359-4636c5535e53@undermydesk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d5fd9a36-7aaf-9a49-c359-4636c5535e53@undermydesk.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Eric,
dear list,

just a short update on this issue...

There's someone over at LKML with the same issue and there
seems to be fix for this on the way.
Your earlier assumption about the kernel changes were true:

http://www.gossamer-threads.com/lists/linux/kernel/2538445?do=post_view_threaded

cheers,
frank\


-- 
43rd Law of Computing:
         Anything that can go wr
fortune: Segmentation violation -- Core dumped
