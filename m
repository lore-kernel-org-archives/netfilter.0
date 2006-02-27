From: Philip Craig <philipc@snapgear.com>
Subject: Re: How many ways are there to interact with Linux TCP/IP stack?
Date: Mon, 27 Feb 2006 11:33:59 +1000
Message-ID: <44025707.5030800@snapgear.com>
References: <20060224083724.13182.qmail@web37814.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060224083724.13182.qmail@web37814.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
To: Mayank <linuxblr_in@yahoo.com>
Cc: netfilter@lists.netfilter.org

On 02/24/2006 06:37 PM, Mayank wrote:
> I am new to netfilter world, can someone please
> clarify on how many ways are there to interact with
> the Linux TCP/IP stack, based on google reading,  I
> think it can be achieved in following 3 ways-
>
> 1. Userspace =AC=96 LIBIPQ can be used in
>    conjugation with =96j QUEUE
> 2. Kernal modules- by using nf_register_hook
> 3. IPTABLES match =96 by using register_match
>
> Are there more ways? does anybody has any comparison
> info  in terms of performance etc ? Which one is
> faster?

Basically, the only way is nf_register_hook.  The other 2 are just
infrastructure built on top of that.

That is, iptables registers a netfilter hook, and calls the matches
and targets from this hook.

QUEUE is just a iptables target, so it is called by iptables.

For performance, QUEUE is clearly slower, since it passes the packet
to user space.

Choosing between netfilter hooks or iptables matches should be based
purely on whether you want to use iptables functionality.

