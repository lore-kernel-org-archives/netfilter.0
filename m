From: "John Berntsen" <john@pepco.no>
Subject: Re: asymetric routing
Date: Mon, 5 May 2003 10:31:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005501c312e0$c3dd9980$0c0a0a0a@JOHNNY>
References: <Pine.LNX.4.33.0305051000030.607-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Hi

All the clients were coming from a frame link router on the internal
lan, I adjusted the routing there and it works fine, the linux
firewall never have to deal with these packets.

I tried to set the linux firewall as the deafult route to make it see
the reply packets wich it did, but still this did not work,
maybe the pptp patch where interfering i dont know.

I also tried to create another routing table like this:

ip rule add from 192.168.0.0/16 to $pptpsrv table pptp
ip route add $pptpsrv via 192.168.1.2 table pptp

but still the pptp traffic did not work.

I belive that what I was trying to achive is not possible at
the moment for pptp, with http pop etc. this works fine
but pptp ...................

Thanks for answering though.

Mvh
John Berntsen / Pepco AS
----- Original Message -----
From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
To: "John Berntsen" <john@pepco.no>
Cc: <netfilter@lists.netfilter.org>
Sent: Monday, May 05, 2003 10:02 AM
Subject: Re: asymetric routing


> Hi,
>
> On Mon, 28 Apr 2003, John Berntsen wrote:
>
> > Everything worked fine, except for the pptp vpn against that one server.
> >
> > Clients trying this are nt4 boxes, and traffic works like this as far
> > as i can understand: client - linux-gateway - cisco router - pptp
> > server and back like: pptp server - nated ip on cisco - client
>
> That is the problem I think: the linux gateway does not see the reply
> packets, which is needed for conntrack/NAT to work properly.
>
> [Please wrap your lines.]
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>


