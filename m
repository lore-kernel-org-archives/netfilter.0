From: =?iso-8859-1?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Subject: Re: packets dropped when using MASQ and QUEUE
Date: 08 Sep 2002 19:21:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m3r8g4e6rv.fsf@isengard.firemission.org>
References: <m3znv08kup.fsf@isengard.firemission.org>
	<008801c25446$89c61820$3303a8c0@p951>
	<m34rd43dag.fsf@isengard.firemission.org>
	<003101c255c3$bf468a10$3303a8c0@p951>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003101c255c3$bf468a10$3303a8c0@p951>
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
To: Jannes Faber <jafaber@zonnet.nl>
Cc: netfilter@lists.samba.org

"Jannes Faber" <jafaber@zonnet.nl> writes:

> I experimented again with the scripts I wrote to do this, but it really
> doesn't work. If you NF_ACCEPT a packet without altering it, there is no
> problem and the masquerading works ok. But as soon as you try to NF_ACCEPT
> an altered packet it gets lost.
>
> On the other hand when you send a packet to the box itself (so there is no
> NAT), it works perfectly: including the altered packets.
> 
> I tried to refind the articles I read about it a few months back, but I
> couldn't find them again.
> 
> I think what you need is a new target that can alter the packets in
> kernel-space for you. Like the TOS target can alter the TOS bits, you need
> something like a REPLACE target or maybe even a REGEXP target. There already
> exists a string match extension (in patch-o-matic I think) that lets you
> search through the packet contents, but as far as I know not something to
> alter the packets.
> 

I'm in no need of any new targets. I don't want to alter any packets,
but rather only delay and occansionally drop packets. QUEUE would
work fine, if I only could get it to really work.

Kind regards,
        Mattias

