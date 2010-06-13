From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Using conntrack to create new expectation entry
Date: Mon, 14 Jun 2010 01:24:06 +0200
Message-ID: <4C156896.1000600@netfilter.org>
References: <4C120872.4040308@cea.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C120872.4040308@cea.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: GLAUME Vincent <vincent.glaume@cea.fr>
Cc: netfilter@vger.kernel.org

GLAUME Vincent wrote:
> Hi there,
> 
> I'm currently trying to figure out how the whole libnetfilter_conntrack
> works, and more precisely the expect part of the lib.
> My aim is to be able to create new expectation entries with this lib in
> an application that would inspect packets (either coming from a
> pcap-based sniffer or from netfilter via the nfqueue mechanism) : thus
> I'd like to allow connections related to the inspected (and already
> allowed) connections.
> 
> My various tests make me think that to create such an expectation entry,
> a kernel module related to the master connection is required: am I right?
> For instance, the "expect_create" app in the libnetfilter_conntrack
> "utils" subdirectory works fine, unless I modify the destination port of
> the master conntrack structure... then it's no longer related to the FTP
> conntrack mechanism...
> Same thing happens when using the conntrack app. from the conntrack-tools.
> 
> So, I'd like to know how to do this the right way, without coding the
> whole inspection thing in a kernel module (if this is possible). Is
> there any generic tcp conntrack system that could help here?
> As I'm not too sure to fully understand the whole mechanism of expected
> connection creation, any hint is welcome!
> I hope this is not too confused... Thanks,

IIRC, this requires a couple of patches for the kernel to fully support
conntrack helpers in user-space, which seems to be what you need. So
this is not support until the appropriate patches go into the kernel.
