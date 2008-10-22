From: "Karel Rericha" <karel@maxtel.cz>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.8 released
Date: Wed, 22 Oct 2008 14:24:11 +0200
Message-ID: <5b19ed110810220524q4f5520a3r58bc02d89ccb69a2@mail.gmail.com>
References: <48FE2CA5.3050004@netfilter.org>
	 <5b19ed110810220325y2c44e00dhbb42dddf56ff88bc@mail.gmail.com>
	 <48FF0A29.90708@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FF0A29.90708@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2008/10/22 Pablo Neira Ayuso <pablo@netfilter.org>:

> When you mean "delete all marks", you refer to resetting the connection
> marks to zero? This command should be enough.

Yes, resetting all marks to zero, sry for not being clear enough.

> # conntrack -U -m 0

Works great from conntrack-tools 0.9.7 (0.9.6 complains about missing
parameters), "man conntrack" does not show -U command and thats why I
missed it. "conntrack --help" shows much more information.

Thanks for help Pablo

Karel
