From: Harald Welte <laforge@gnumonks.org>
Subject: Re: Netfilter after kernel 2.4.3 ??
Date: Thu, 27 Jun 2002 16:47:32 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627144732.GG9003@naboo.rchrd.phub.net.cable.rogers.com>
References: <001001c21c16$b00597d0$6e01a8c0@raptor>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001001c21c16$b00597d0$6e01a8c0@raptor>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Hansen <luffe@diku.dk>
Cc: netfilter@lists.samba.org

On Tue, Jun 25, 2002 at 09:05:23AM +0200, Jacob Hansen wrote:
> Now I ask, what changes have been made since 2.4.3, that apparently
> breaks functionality of the module? Any ideas?

one could maybe write a 100-page document about the changes in the
netfilter/iptables code after 2.4.3.  It's actually easier to ask what
has not changed.

The netfilter hooks howerver, haven't changed that much. The API has not
changed at all.  The only change I can recall was the skb_linearize()
stuff needed after zero copy tcp was added.

> Best regards, 
> Jacob

-- 
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
============================================================================
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M- 
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)

