From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Need to replace a SonicWall firewall with an iptables firewall.
Date: Tue, 31 Aug 2004 01:02:50 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040831000249.GH20169@metastasis.org.uk>
References: <7C9884991ADAE0479C14F10C858BCDF56794C2@alderaan.smgtec.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56794C2@alderaan.smgtec.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Aug 30, 2004 at 03:23:58PM -0700, Daniel Chemko wrote:

> > Not knowing what split-dns was, I googled it. If I understand it
> > correctly it seems that this is only needed when you use a single,
> > common domain for both internal and external systems. All our
> > external systems (both between the firewall and the router, and in
> > the DMZ) are in "domain.com" and all our internal systems are in
> > "sub.domain.com", so we don't need split-dns, right?

Probably a good idea anyway - you probably don't want external users
using your DNS server in the same way that internal hosts do - i.e.
making recursive lookups.  Also while it isn't much of an information
leak, stopping Internet users looking up hosts in sub.domain.com won't
do any harm.

Also with the use of "view" this is pretty easy to do with BIND 9.  If
you don't have a copy of "DNS and BIND" you should be able to find
something useful via Google or equivalent search engine.

Sorry, a little off-topic....

-- 
mors omnia vincit

