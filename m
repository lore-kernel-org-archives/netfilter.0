From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.8 released
Date: Wed, 22 Oct 2008 13:10:33 +0200
Message-ID: <48FF0A29.90708@netfilter.org>
References: <48FE2CA5.3050004@netfilter.org> <5b19ed110810220325y2c44e00dhbb42dddf56ff88bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b19ed110810220325y2c44e00dhbb42dddf56ff88bc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

Karel Rericha wrote:
> Hi Pablo and list,
> 
> is there any way to delete mark from connection (all marks from all
> connections) without deleting connection itself ?
> 
> We are using iptables with
> 
> ...  -m mark ! --mark 0 -j CONNMARK --save-mark
> 
> but we would like few times a day delete all marks from all
> connections to let connections are marked again (with different marks
> based on time). Conntrack-tools would have been fine tool for it, if
> such option had been included. Or is there any other way to do it?

When you mean "delete all marks", you refer to resetting the connection
marks to zero? This command should be enough.

# conntrack -U -m 0

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
