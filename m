From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Thu, 3 Feb 2011 13:00:52 +0100
Message-ID: <20110203120052.GA4217@buero.cygnusnet.de>
References: <20110125125426.GA7749@buero.cygnusnet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110125125426.GA7749@buero.cygnusnet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks to Florian Westphal (fw on Freenode) for helping me sort this
out.

On Tue, Jan 25, 2011 at 01:54:27PM +0100, Helmut Grohne wrote:
> I was wondering what nflog_unbind_pf actually does. The doxygen comment
> suggests it to be a harmless setup function acting on a given handle:
> 
> libnetfilter-log src/libnetfilter_log.c:
> | /**
> |  * nflog_unbind_pf - unbind nflog handler from a protocol family
> |  * \param h Netfilter log handle obtained via call to nflog_open()
> |  * \param pf protocol family to unbind family from
> |  *
> |  * Unbinds the given nflog handle from processing packets belonging
> |  * to the given protocol family.
> |  */

This comment is indeed very misleading. Actually the passed handle plays
no role in the modification apart from providing access. The NFLOG
iptables target has different ways to log packets. Currently the only
logger is netlink. The state can be observed by examining
/proc/net/netfilter/nf_log. This file maps protocol numbers to loggers.
So nflog_{,un}bind_pf really modifies a global and persistent kernel
data structure. The default logger is "NONE" or "NULL" which means no
logging, so it has to be set up once. Trying to do so in parallel will
result in race conditions.

Furthermore I'd like to remark that if you handle lots of packets the in
kernel buffer might be too small. This can result in packets being
dropped which is signaled by ENOBUFS being returned from recv. The
socket can be used normally after this error. To avoid this situation
the receive buffer size can be increased using setsockopt
SO_RCVBUFFORCE.

Helmut
