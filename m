From: Frank Reppin <frank@undermydesk.org>
Subject: Re: ulogd2 / segfault in ulogd_raw2packet_BASE.c with kernel 4.8.1
Date: Mon, 10 Oct 2016 23:34:33 +0200
Message-ID: <d5fd9a36-7aaf-9a49-c359-4636c5535e53@undermydesk.org>
References: <de2d542d-c543-d254-beae-990a988effcf@undermydesk.org>
 <1476055564.5747.1.camel@regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1476055564.5747.1.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Eric,
dear list,

On 10.10.2016 01:26, Eric Leblond wrote:
[...]
> From what I can see, it looks possible there is a problem introduced by
> copy range handling change introduce in this kernel.
>
> Is it possible for you to test latest iptables ? It should handle the
> range correctly and this should fix the problem.
Hm - weird - but no success.
I've just tested both - iptables 1.6.0 release and the most current git 
master of iptables - a couple of minutes ago.
Both let ulogd2 (default debian jessie package) segfault - the backtrace
is the same in each case (... and same compared to the one in my initial 
post).

cheers,
frank\

-- 
43rd Law of Computing:
         Anything that can go wr
fortune: Segmentation violation -- Core dumped
