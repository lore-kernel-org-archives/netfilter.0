From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Wed, 21 Jan 2004 16:44:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040121154420.GH27986@torres.ka0.zugschlus.de>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <20040121153748.GA2715@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040121153748.GA2715@openoffice.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 21, 2004 at 04:37:48PM +0100, Valentijn Sessink wrote:
> Yes you can. Re-read my post, and be creative.

That will work for incoming packets. And how do I protect myself
against configuration errors sending out unencrypted packets? I'd need
to put the mark on the packets for destination networks, which is
error prone.

The idea is nice, but it looks like an ugly hack. And it _is_ an ugly
hack.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

