From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 7 Aug 2008 13:43:47 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de>
References: <g7da9g$21r$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <g7da9g$21r$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Duffy <Charles_Duffy@messageone.com>
Cc: netfilter@vger.kernel.org

On Wed, 6 Aug 2008, Charles Duffy wrote:

> Unfortunately, the current behavior of NETMAP -- translating the source
> address in POSTROUTING and the destination in PREROUTING -- doesn't appear to
> work for this purpose: I still need the original destination intact when
> routing to decide which bridge packets should go out.
> 
> 
> How do 'yall suggest resolving this?

Perhaps setting a mark based on the destination address at pre-routing,
use netmap, and then route based on the mark?
(Using one routing table a'la 'common-dest/mask -> bridgeX' per mark)

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around
it. (John Gilmore on http://www.cygnus.com/~gnu/)
