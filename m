From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Flag SYN not necessarily state NEW?
Date: Fri, 14 Jun 2002 13:17:15 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141315450.17402-100000@blackhole.kfki.hu>
References: <3CD8C99B.E81155B5@mazda.at>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CD8C99B.E81155B5@mazda.at>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ing. Christian Ogris" <ogris@mazda.at>
Cc: netfilter@lists.samba.org

On Wed, 8 May 2002, Ing. Christian Ogris wrote:

> I connect from Box A via SSH to Box B, where the firewall runs, and i
> get the state "NEW" on the first packet.
> Then - the first connection is still established - i connect AGAIN from
> Box A to Box B and do NOT get the state "NEW" anymore. (So obviously
> it's already accepted by the ESTABLISHED,RELATED -j ACCEPT rule).
> Is this behavior correct?

No. But so far nobody has reported such an ill-behaviour. I assume
something is wrong in your setup/logging.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


