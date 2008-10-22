From: "Karel Rericha" <karel@maxtel.cz>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.8 released
Date: Wed, 22 Oct 2008 12:25:19 +0200
Message-ID: <5b19ed110810220325y2c44e00dhbb42dddf56ff88bc@mail.gmail.com>
References: <48FE2CA5.3050004@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FE2CA5.3050004@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org

2008/10/21 Pablo Neira Ayuso <pablo@netfilter.org>:
> Hi!
>
> The netfilter project proudly presents another development release of
> the conntrack-tools. This release includes important updates, fixes and
> improvements. Moreover, a new user manual has been released,
> contributions to improve are welcome! Detailed changelog is attached.
>

Hi Pablo and list,

is there any way to delete mark from connection (all marks from all
connections) without deleting connection itself ?

We are using iptables with

...  -m mark ! --mark 0 -j CONNMARK --save-mark

but we would like few times a day delete all marks from all
connections to let connections are marked again (with different marks
based on time). Conntrack-tools would have been fine tool for it, if
such option had been included. Or is there any other way to do it?

Thanks, Karel
