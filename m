From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: query regarding hashlimit using ipset src,dst tuple
Date: Mon, 16 Oct 2006 09:00:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0610160858240.15459@blackhole.kfki.hu>
References: <001001c6f07e$9c290f80$0201a8c0@synapse.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001001c6f07e$9c290f80$0201a8c0@synapse.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Jain <manish.jain@globallogic.com>
Cc: netfilter@lists.netfilter.org

On Sun, 15 Oct 2006, Manish Jain wrote:

> Say there are 2 source IPs - src1 and src2, and 2 destination IP - dst1,
> dst2.
> I need to limit src1->dst1 as well as src2-dst2 communication but want
> unlimited src2->dst1 communication.
> I have a ipset KNOWN, which contains src1, src2, dst1, dst2

What type of set is it?

> Now i write a rule as follows -
> iptables -A INPUT_CHAIN --match hashlimit --hashlimit 1000/s
> --hashlimit-mode srcipdstip --hashlimit-name foo -m set --set KNOWN
> src,dst -j ACCEPT
>
> But this will limit the src2->dst1 communication as well, which I dont want.
>
> 1. Is there a way to add ip1,ip2 as a tuple in a ipset the way we can do for
> ip1%port?

No, such type of set currently does not exist.

> 2. Is there a mode which can help me do this, using a single iptable rule as
> above?

I don't think so.

> 3. Is there a way to specify multiple ipsets in 1 iptable rule?

Yes, you can specify as many same kind maches as you want, but please keep
in mind that the matches are AND-ed.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

