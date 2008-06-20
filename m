From: Patrick McHardy <kaber@trash.net>
Subject: Re: How to SNAT in PREROUTING table for local machine
Date: Fri, 20 Jun 2008 12:22:50 +0200
Message-ID: <485B84FA.9080204@trash.net>
References: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tobias Krummen <tobias.krummen@t-online.de>
Cc: netfilter@vger.kernel.org

Tobias Krummen wrote:
> So, is there a way to change the source ip-address of incoming packets 
> with the given possibilities of netfilter, or are there other tools to 
> get this done?

You need to add an INPUT chain to the NAT table to do this
and adjust the HOOK2MANIP macro to deal with this.


