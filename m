From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Dropping Malicious Packets in -t mangle
Date: Tue, 12 Aug 2003 14:01:27 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0308121358290.3362-100000@blackhole.kfki.hu>
References: <1059631347.4280.27.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059631347.4280.27.camel@jasiiitosh.nexusmgmt.com>
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

Hi,

On 31 Jul 2003, John A. Sullivan III wrote:

> Our idea was to filter malicious packets - spoofs, ping floods,
> suspicious tcp flags - in the mangle table.  We were concerned that we
> wanted to intercept these packets before they hit the connection
> tracking table for DNAT'd devices in case someone initiated a valid
> session and then tried to turn it foul.  We also noticed that the mangle
> table was the first all packets hit.

conntrack has no table and it precedes all the other netfilter
subsystems, including the mangle table. If you want to do such
optimizations then use the raw table from patch-o-matic.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


