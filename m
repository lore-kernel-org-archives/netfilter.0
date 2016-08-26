From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Add element in set when element already present.
Date: Fri, 26 Aug 2016 11:09:58 +0200
Message-ID: <20160826090958.GA2050@salvia>
References: <e145e82f-0b0f-50df-c9ce-d1c2446f9543@laposte.net>
 <20160824145338.GA8282@salvia>
 <1f604982-a2b1-e56b-1ebb-e769fde81710@yamaworld.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f604982-a2b1-e56b-1ebb-e769fde81710@yamaworld.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yamakaky <yamakaky@yamaworld.fr>
Cc: netfilter@vger.kernel.org

On Wed, Aug 24, 2016 at 05:25:54PM +0200, Yamakaky wrote:
[...]
> I forgot to tell, but if I remember correctly there is the same problem for
> maps.

This will also work with maps:

# nft add table x
# nft add map x y { type ipv4_addr : ipv4_addr\; }
# nft add element x y { 1.1.1.1 : 2.2.2.2 }
# nft add element x y { 1.1.1.1 : 2.2.2.2 }
# nft create element x y { 1.1.1.1 : 2.2.2.2 }
<cmdline>:1:1-41: Error: Could not process rule: File exists
create element x y { 1.1.1.1 : 2.2.2.2 }

If you specify a different right hand side on the mapping, this hits
EBUSY at this moment if it differs from the initial value:

# nft add element x y { 1.1.1.1 : 2.2.2.3 }
<cmdline>:1:1-38: Error: Could not process rule: Device or resource busy
add element x y { 1.1.1.1 : 2.2.2.3 }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For sets with timeouts, it should be possible to support timeout
refresh in a follow up patch too.

Thanks!
