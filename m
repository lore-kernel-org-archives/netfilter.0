From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Skipping connection tracking for certain traffic types?
Date: 29 May 2003 14:51:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054212682.749.34.camel@tux.rsn.bth.se>
References: <20030528115842.S20519@poliisi.iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030528115842.S20519@poliisi.iki.fi>
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
To: Ville Mattila <vm@iki.fi>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-05-28 at 11:03, Ville Mattila wrote:

> This problem would be solved if it was possible with
> Netfilter/iptables to skip connection tracking for some
> rules (servers sending dns queries and replies to them in
> our case), or better yet, not to track every connection by
> default but only when requested per rule. Is this kind
> of selective connection tracking possible already or will
> it possibly become supported in future conntrack versions?

This has been supported for a long time. Look at userspace/raw.patch
in patch-o-matic.

-- 
/Martin

