From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: What does nflog_unbind_pf actually do?
Date: Tue, 25 Jan 2011 13:54:27 +0100
Message-ID: <20110125125426.GA7749@buero.cygnusnet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I was wondering what nflog_unbind_pf actually does. The doxygen comment
suggests it to be a harmless setup function acting on a given handle:

libnetfilter-log src/libnetfilter_log.c:
| /**
|  * nflog_unbind_pf - unbind nflog handler from a protocol family
|  * \param h Netfilter log handle obtained via call to nflog_open()
|  * \param pf protocol family to unbind family from
|  *
|  * Unbinds the given nflog handle from processing packets belonging
|  * to the given protocol family.
|  */

However the example suggests that the command indeed is not as harmless:

libnetfilter-log util/nfulnl_test.c:
| #ifdef INSANE
|         /* norally, applications SHOULD NOT issue this command,
|          * since it detaches other programs/sockets from AF_INET, too ! */
|         printf("unbinding from AF_INET\n");
|         nflog_unbind_pf(h, AF_INET);
| #endif

So far so good, but why does util/nfulnl_test.c call nflog_unbind_pf in the
setup code then?

Trying to find out what it actually does I dug into the kernel and discovered
that nf_log_unbind_pf in fact does not operate on a handle but on some global
state! (See linux net/netfilter/nf_log.c) Still I have no idea what it is
supposed to do.

As a result I experimented a bit to see what happens. Leaving out the
nflog_unbind_pf in util/nfulnl_test.c results in the nflog_bind_pf to
fail. I'd attribute this to some double binding. Removing both
nflog_unbind_pf and nflog_bind_pf simply results in no packets being
received at all.

Why am I interested in this you may ask. I am trying to start multiple
logging daemons, one for each nflog group. The rationale behind this
design is that the kernel will not report packets for multiple groups in
one recv from the netlink socket. Processing multiple groups in one
daemon therefore has no benefit when it comes to reducing system calls.
Using multiple daemons however can distribute the load to multiple CPUs
which is a clear benefit. (Note that threads are not an option, because
the library is not thread safe.) Now when I start multiple daemons
simultaneously they randomly fail and the culprit seems to be the
interference of the pf binding and unbinding calls.

Helmut
