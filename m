From: =?iso-8859-1?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Subject: Re: packets dropped when using MASQ and QUEUE
Date: 05 Sep 2002 13:07:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m34rd43dag.fsf@isengard.firemission.org>
References: <m3znv08kup.fsf@isengard.firemission.org>
	<008801c25446$89c61820$3303a8c0@p951>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008801c25446$89c61820$3303a8c0@p951>
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
To: sufcrusher <sufcrusher@zonnet.nl>
Cc: netfilter@lists.samba.org

"sufcrusher" <sufcrusher@zonnet.nl> writes:

> I've had the exact same problem. I did a google search on this and found out
> pretty quickly that this is how it's supposed to be. For a really technical
> explanation you might want to do a google search yourself, but it comes down
> to the fact that the userspace program can only completely ACCEPT or
> DENY/REJECT a packet. It can *not* let the packet continue traversing the
> chains/tables.

Cannot continue traversing that particular chain (FORWARD, in my case),
or any chain? My MASQ rules are on the POSTROUTING chain.

And if it's a design flaw i QUEUE, how come it works for some of
the packets, but not all?

Kind regards,
        Mattias

