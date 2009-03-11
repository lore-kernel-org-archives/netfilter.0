From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd2 / IPFIX
Date: Wed, 11 Mar 2009 10:18:25 +0100
Message-ID: <49B781E1.2020208@netfilter.org>
References: <200903110947.10044.andy-lists@bourges.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200903110947.10044.andy-lists@bourges.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Bourges <andy-lists@bourges.de>
Cc: netfilter@vger.kernel.org

Andreas Bourges wrote:
> Hi,
> 
> ..I just compiled ulogd-2.0.0.beta3 and tried to figure out if IPFIX support 
> is already included (as mentioned on the web). Unluckily I couldn't find any 
> documentation on this topic.
> 
> Is IPFIX export (udp is sufficient) currently supported? If yes - can someone 
> point me to a piece of documentation?
> 
> What I currently get:
> 
> root@hal:/usr/local/sbin# ./ulogd --info ../lib/ulogd/ulogd_output_IPFIX.so
> Wed Mar 11 09:45:34 2009 <7> ulogd.c:599 load_plugin: 
> '../lib/ulogd/ulogd_output_IPFIX.so': ../lib/ulogd/ulogd_output_IPFIX.so: 
> undefined symbol: list_add
> root@hal:/usr/local/sbin#
> 
> ?? seems to be broken?

Yes, that problem is known, the IPFIX plugin is not finished yet, it
will be fixed in the next release.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
