From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Mon, 19 Apr 2004 14:03:42 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0404191400460.8154-100000@blackhole.kfki.hu>
References: <4083A3B2.7020808@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4083A3B2.7020808@linuxmail.org>
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
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter@lists.netfilter.org

On Mon, 19 Apr 2004, Feizhou wrote:

> I don't know if such a question has been asked before and the archive
> didn't provide a search button...
>
> I have a whole bunch of ips/cidrs that I want to apply the rule to.
>
> Is there any way to insert one rule where the -s would be able to look
> up a table (btree/hash/cdb whatever) that contains those ips/cidrs
> instead of insert gazillion rules?

Yes, you can use either the ippool or the ipset extensions. ippool is
capable to store up to the number of IP addresses of a full B class network.
ippool can store network addresses as well and supports random
adressess/networks too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


