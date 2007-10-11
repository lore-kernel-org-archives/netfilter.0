From: Patrick McHardy <kaber@trash.net>
Subject: Re: nfq_unbind_pf() fails with kernel 2.6.23
Date: Thu, 11 Oct 2007 10:27:30 +0200
Message-ID: <470DDE72.507@trash.net>
References: <470DBFB0.1090600@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470DBFB0.1090600@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "S. Sakar" <serkan.sakar@gmx.net>
Cc: netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@lists.netfilter.org>

S. Sakar wrote:
> hi,
> I don't seem to be able to run the nfqnl_test code with kernel 2.6.23
> (amd64).
> It prints the following:
> 
>> opening library handle
>> unbinding existing nf_queue handler for AF_INET (if any)
>> NFNETLINK answers: Invalid argument
>> error during nfq_unbind_pf()


Yeah, we've added a check to prohibit unregistering other handlers.
The entire unregistration stuff is a horrible hack, the only reason
why it (still) exists is because registration of the same handler
returns EEXIST instead of silently ignoring it. The best fix for
now is to ignore the return value of nfq_unbind_pf().


