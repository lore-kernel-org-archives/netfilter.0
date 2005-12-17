From: Eric Leblond <eleblond@inl.fr>
Subject: Re: Set mark in -j QUEUE?
Date: Sat, 17 Dec 2005 21:37:34 +0100
Message-ID: <1134851854.13202.13.camel@porky>
References: <000001c60332$36cd7340$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c60332$36cd7340$2801a8c0@MBRC40>
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
To: "Michael D. Berger" <m.d.berger@ieee.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 2005-12-17 at 12:49 -0500, Michael D. Berger wrote:
> Using iptables-1.2.11-3.1.RHEL4.
> 
> In the mangle table, in an otherwise successful -j QUEUE
> I get the correct result of 2 in the filter table.
> 
> Is there any way to make this work in the -j QUEUE processor?

If I understand your problem, you wanna set the mark with the QUEUE
target. To do so you have to apply a patch to ipq and kernel if you use
kernel prior to 2.6.14 :
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-ip_queue_vwmark

After 2.6.14 the new NFQUEUE target and libnetfilter_queue are able to
do marking without any patch.

By the way, if you need a code example of port to libnetfilter_queue,
you can use nufw code (http://www.nufw.org) (directory src/nufw/)

BR,
-- 
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org


