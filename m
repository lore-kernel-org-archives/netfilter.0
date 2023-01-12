From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nft] src: allow for updating devices on existing netdev chain -
 Test result
Date: Thu, 12 Jan 2023 13:06:13 +0100
Message-ID: <Y7/3tau2t+5fe2GK@salvia>
References: <DD658C3B-2FB9-451E-893C-EE37ABDC678A@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DD658C3B-2FB9-451E-893C-EE37ABDC678A@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: 20230106010251.27038-1-pablo@netfilter.org, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

On Fri, Jan 06, 2023 at 05:17:51PM +0200, Martin Zaharinov wrote:
> Hi Pablo
> 
> Patch look good and work but in my test after try to add ppp0 on
> over chain 1024 receive : Error: Could not process rule: Argument
> list too long

You are hitting the maximum number of hooks per device (1024). I think you
perhaps would like to do something like:

for i in `seq 2 9999`; do echo "add chain netdev qos int { devices = { ppp$i } ; }" >> /tmp/ruleset.nft; done

instead?
