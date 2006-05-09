From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: SIP connection tracking
Date: Tue, 9 May 2006 01:33:02 -0700 (PDT)
Message-ID: <20060509083302.14326.qmail@web34209.mail.mud.yahoo.com>
References: <200605090800.08768.mco@fokus.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605090800.08768.mco@fokus.fraunhofer.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Marius-Iulian Corici <marius-Iulian.corici@fokus.fraunhofer.de>
Cc: netfilter@lists.netfilter.org

--- Marius-Iulian Corici
<marius-Iulian.corici@fokus.fraunhofer.de> wrote:

> Only the SIP (signaling traffic) or also the voice
> traffic (RTP traffic - you 
> can see it with tcpdump)?
> Take a short look at the priotitization in OpenWRT
> distribution.
> It prioritizes on some "a little" bit different
> criteria.
> Anyway, usually the SIP is udp
> 

Thanks for the reply.

I can see all packets passing thru the interface
(ppp0).

The issue is the rule does not match to either SIP
(signaling traffic) or RTP traffic at all. 

Does it work for you?

I'll have a look at the OpenWRT.

Thanks again

Sagara


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

