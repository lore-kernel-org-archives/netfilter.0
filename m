From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Tue, 20 Apr 2004 16:16:40 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0404201608280.14290-100000@blackhole.kfki.hu>
References: <4083E680.9020309@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4083E680.9020309@linuxmail.org>
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

> when will ipset be available in 2.6?

It needs more, exhaustive testing. ippool was tested more widely than
ipset.

> I presume ippool is going to become obsolete?

Originally ipset was planned to be released as a new version of ippool.
Unfortunately backward compatibility could not be preserved, so a new name
had to be found. It extends ippool, yes, but that does not mean ippool is
obsolete.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


