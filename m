From: "David Leangen" <dleangen@canada.com>
Subject: [OT?] URL rewriting
Date: Wed, 12 Oct 2005 16:07:08 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAIENCBIAB.dleangen@canada.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


This may be a little off topic, but...

Can iptables do URL rewriting? I don't think so, but I thought I'd check
anyway.


What do you use for this? I'm interested in hearing about "best practices".



I was thinking about using Squid for this... or I guess there's mod_apache
as well.

What do you recommend?


Generally, I want to have one URL space as a public interface to my network.
Services will be provided internally from various ports at different IP
addresses, but all accessible publicly through the same URL space. IIUC,
this is "reverse proxying".


Thanks for the advice!!



Dave


