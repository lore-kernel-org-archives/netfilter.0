From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 08:11:36 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310300809300.18142-100000@localhost.localdomain>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57905@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57905@OST_EXCH_USR5>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Thu, 30 Oct 2003, Knight, Steve wrote:

> Hi rob
> 
> As a total newbie :) at least to iptables, I think what you have there is
> great.
> 
> Just my 0.02, if it's worth that much considering I cant even get DNS
> lookups from my fw working.....

i saw your earlier postings, haven't looked closely at the symptoms,
but based on my little tutorial, i'm not sure why it wouldn't work
if, as i did, you:

1) allow pretty much everything out
2) allow all RELATED,ESTABLISHED stuff back in

  what i posted is based on protecting a single host.  it sounds
like you have a separate firewall protecting an internal network,
is that right?

rday


