From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 09:11:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506210901510.3630@blackhole.kfki.hu>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620091748a270fc@mail.gmail.com>
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
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Mon, 20 Jun 2005, terry l. ridder wrote:

> while i have reservations concerning posting the output of iptables-save
> i have placed it on my web server:
>
> http://204.238.34.206/iptables-save-20jun2005.txt

Thou salt not filter in the nat table.

It's in the documentation and was also countless times were written to the
list: only the first packet of every connection traverses the nat table.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

