From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: asymetric routing
Date: Mon, 5 May 2003 10:02:31 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0305051000030.607-100000@blackhole.kfki.hu>
References: <084a01c30d77$9c0b4740$0c0a0a0a@JOHNNY>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <084a01c30d77$9c0b4740$0c0a0a0a@JOHNNY>
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
To: John Berntsen <john@pepco.no>
Cc: netfilter@lists.netfilter.org

Hi,

On Mon, 28 Apr 2003, John Berntsen wrote:

> Everything worked fine, except for the pptp vpn against that one server.
>
> Clients trying this are nt4 boxes, and traffic works like this as far
> as i can understand: client - linux-gateway - cisco router - pptp
> server and back like: pptp server - nated ip on cisco - client

That is the problem I think: the linux gateway does not see the reply
packets, which is needed for conntrack/NAT to work properly.

[Please wrap your lines.]

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


