From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables stateful inspection and H.323
Date: Thu, 20 Feb 2003 12:41:11 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302201238570.13017-100000@blackhole.kfki.hu>
References: <1045561728.1515.25.camel@kolisko>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045561728.1515.25.camel@kolisko>
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
To: - = k o l i s k o = - <kolisko@penguin.cz>
Cc: netfilter@lists.netfilter.org

On 18 Feb 2003, - = k o l i s k o = - wrote:

> What is the current state of stateful inspection and H.323 protocol
> (netmeeting).
>
> I would like to know if will H.323 work:
>
> --state NEW,REL..,EST..  - OUT
> --state REL..,EST..  - IN

It works - depending on what kind of features you use and on your luck.
There are success and total failure reports as well.

Being the patch a complete hack, it might even not deserve to exist...

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


