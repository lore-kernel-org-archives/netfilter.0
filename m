From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and pdc microsoft
Date: Thu, 1 Apr 2004 19:09:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011909.49402.Antony@Soft-Solutions.co.uk>
References: <20040401142233.81442.qmail@web14305.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401142233.81442.qmail@web14305.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Thursday 01 April 2004 3:22 pm, Luca Rossi wrote:

> Hi
> is true that wins is not supported that Iptables?

It is true that the Wins peer discovery protocol operates by network 
broadcasts and therefore does not traverse routers.

If you know the IP address of a machine you wish to connect to, however, then 
you can do this across as many routers as you like.

The relevance to netfilter is that netfilter is generally used on a routing 
Linux machine.

Hope this helps,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


