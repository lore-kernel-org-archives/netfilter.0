From: Patrick McHardy <kaber@trash.net>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 12:27:32 +0200
Sender: linux-net-owner@vger.kernel.org
Message-ID: <4098C194.8090609@trash.net>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20040504211557.GA236@schottelius.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nico Schottelius <nico-linux-net@schottelius.org>
Cc: Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org, gregor-net@paasch.name, linux-net@vger.kernel.org

Nico Schottelius wrote:

> Wouldn't this work fine, if we have the virtual device like freeswan had
> or is netfilter broken with this?
> 
> I mean I cannot practicly setup an IPSec only access point with the current
> netfilter and ipsec in Linux 2.6, or am I deadly wrong?

Check out the ipsec-* patches and the policy match in netfilter pom-ng.

Regards
Patrick
