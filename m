From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: conntrack problem
Date: Thu, 8 Mar 2007 18:59:30 +0100
Message-ID: <20070308185930.6e0bab44.mailinglists@lucassen.org>
References: <20070308142948.00f38080.mailinglists@lucassen.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070308142948.00f38080.mailinglists@lucassen.org>
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

On Thu, 8 Mar 2007 14:29:48 +0100
richard lucassen <mailinglists@lucassen.org> wrote:

> # conntrack -L -p udp --orig-port-dst 1194
> Operation failed: invalid parameters
> 
> According to an example in the "Changelog" this should work.
> 
> Am I missing something crucial? Anyone a hint?

Forget it. 2.6.20.1 works fine.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

