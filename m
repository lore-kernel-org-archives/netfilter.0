From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iprange match processing overhead
Date: Tue, 6 May 2003 09:21:47 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0305060918130.2984-100000@blackhole.kfki.hu>
References: <1052144634.1861.16.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052144634.1861.16.camel@jasiiitosh.nexusmgmt.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On 5 May 2003, John A. Sullivan III wrote:

> 	Thanks for the reply.  If that's the only overhead, I don't think we'll
> notice it.  Is that all the additional overhead incurred?

Yes.

[...]
> 	Does the iprange patch in effect create multiple standard
> source/destination rules or is its processing as efficient as the
> standard source/destination rules once it has passed the any address
> evaluation? Thanks in advance for the clarification - John

No, it does not convert internally the given range into CIDR blocks. It's
a natural range evaluation. Have a look at
net/ipv4/netfilter/ipt_iprange.c in the source tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


