From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: How to block a range of IPs?
Date: Tue, 29 Apr 2003 09:55:22 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0304290953500.32263-100000@blackhole.kfki.hu>
References: <1051546485.1427.7.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051546485.1427.7.camel@jasiiitosh.nexusmgmt.com>
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

On 28 Apr 2003, John A. Sullivan III wrote:

> You can  use the tool at http://subnetcreator.sourceforge.net/ to easily
> determine which subnets are contained in your IP address range.  The
> same logic is being built into the iptables+ management tool being
> developed in http://iscs.sourceforge.net/ .  However,even better,it
> appears there is a patch available in patch-o-matic that allows one to
> enter a range directly in iptables.  I haven't tried it yet but hope to
> do so soon to replace that logic in ISCS.  Good luck - John

As Martin pointed out, there is an iprange match in patch-o-matic by which
one can specify IP address ranges.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


