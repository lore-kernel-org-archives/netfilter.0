From: Harald Welte <laforge@gnumonks.org>
Subject: Re: DCC Nat Trouble
Date: Thu, 27 Jun 2002 16:51:18 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627145118.GI9003@naboo.rchrd.phub.net.cable.rogers.com>
References: <1024401382.3010.7.camel@force>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1024401382.3010.7.camel@force>
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
To: Frederik Bijlsma <frederik@killesberg.org>
Cc: netfilter@lists.samba.org

On Tue, Jun 18, 2002 at 01:56:22PM +0200, Frederik Bijlsma wrote:
> Dear list,
> 
> I've got trouble setting up DCC Transfers using netfilter modules. 
> ip_nat_irc ip_conntrack_irc are both loaded and assigned to the right
> ports.

no idea. it works for a lot of people. maybe you can compile them with
debugging enabled and see where the problem is.

it's also interesting if /proc/net/ip_conntrack shows the correct
expectation(s) at the bottom.

-- 
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
============================================================================
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M- 
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)

