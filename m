From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Thu, 03 Feb 2011 14:27:28 +0100
Message-ID: <4D4AAD40.1060204@netfilter.org>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203120052.GA4217@buero.cygnusnet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helmut Grohne <h.grohne@cygnusnetworks.de>
Cc: netfilter@vger.kernel.org

On 03/02/11 13:00, Helmut Grohne wrote:
> Thanks to Florian Westphal (fw on Freenode) for helping me sort this
> out.
> 
> On Tue, Jan 25, 2011 at 01:54:27PM +0100, Helmut Grohne wrote:
>> I was wondering what nflog_unbind_pf actually does. The doxygen comment
>> suggests it to be a harmless setup function acting on a given handle:
>>
>> libnetfilter-log src/libnetfilter_log.c:
>> | /**
>> |  * nflog_unbind_pf - unbind nflog handler from a protocol family
>> |  * \param h Netfilter log handle obtained via call to nflog_open()
>> |  * \param pf protocol family to unbind family from
>> |  *
>> |  * Unbinds the given nflog handle from processing packets belonging
>> |  * to the given protocol family.
>> |  */
> 
> This comment is indeed very misleading.

Let's fix it then :-)

> Actually the passed handle plays
> no role in the modification apart from providing access. The NFLOG
> iptables target has different ways to log packets. Currently the only
> logger is netlink. The state can be observed by examining
> /proc/net/netfilter/nf_log. This file maps protocol numbers to loggers.
> So nflog_{,un}bind_pf really modifies a global and persistent kernel
> data structure. The default logger is "NONE" or "NULL" which means no
> logging, so it has to be set up once. Trying to do so in parallel will
> result in race conditions.

Please, would you send me a patch so others can benefit for this
conclusion in the official documentation? I'd appreciate it.

> Furthermore I'd like to remark that if you handle lots of packets the in
> kernel buffer might be too small. This can result in packets being
> dropped which is signaled by ENOBUFS being returned from recv. The
> socket can be used normally after this error. To avoid this situation
> the receive buffer size can be increased using setsockopt
> SO_RCVBUFFORCE.

There is other things that you can do to avoid ENOBUFS, it is documented
in libnetfilter_queue but it also applies to libnetfilter_log:

http://www.netfilter.org/projects/libnetfilter_queue/doxygen/

See performance, the last two items do not apply to libnetfilter_log.
Another patch for this would be great.
