From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: Re: IPSET issue ???
Date: Wed, 30 Mar 2005 17:09:58 -0500
Message-ID: <424ADD66.23629.6DAE69D5@localhost>
References: <4249A831.26741.68F66E4C@localhost>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.58.0503300947090.4659@blackhole.kfki.hu>
Content-description: Mail message body
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
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Hi Jozsef

Thanks for your reply, last question regarding IPSET..

Can I define the protocol in portmap set type, I means, Can I do 
that?

ipset -N ports portmap
ipset -A ports tcp/53
ipset -A ports udp/53
ipset -A ports tcp/25
ipset -A ports tcp/110
......
If no, there is any way to do that?

Thanks in advanced.



On 30 Mar 2005 at 9:57, Jozsef Kadlecsik wrote:

> Hi,
> 
> On Tue, 29 Mar 2005, Jorge Agrelo wrote:
> 
> > I want to block the offensive network list supplied by dshield
> > (http://feeds.dshield.org/block.txt) using IPSET match, anybody tell me if the
> > following stuff is correct.
> >
> > ipset -N bogons-nets nethash
> > ipset -A bogons-nets 81.208.28.0/24
> > ipset -A bogons-nets 141.50.163.0/24 ..........
> > iptables -N blocklist
> > iptables -A bogons-nets -m set --set bogons-nets scr,dst -j drop
> > iptables -A INPUT -i ! lo -m state ! --state ESTABLISHED -j blocklist
> > iptables -A FORWARD -m state ! --state ESTABLISHED -j blocklist
> > iptables -A OUTPUT -o ! lo -m state ! --state ESTABLISHED -j blocklist
> >
> > I want to block the source and destination traffic from/to this
> > networks, I'm not sure regarding how to use the tokens src and dst and
> > the set type (nethash) in IPSET???
> 
> No, assuming you want to block access from and to the networks in the
> set bogons-net:
> 
> iptables -A bogons-nets -m set --set bogons-nets scr -j drop
> iptables -A bogons-nets -m set --set bogons-nets dst -j drop
> 
> Multiple 'src' and 'dst' tokens can be used when you bind set elements to
> other sets and want to follow the bindings, for example when you want to
> to represent your servers by ipset:
> 
> ipset -N servers ipmap ....
> ipset -A servers x.x.x.x
> ...
> ipset -N services portmap...
> ipset -A services ssh
> ...
> ipset -N clients iphash
> ipset -A clients y.y.y.y
> ...
> # Glue the corresponding set elements together with bindings
> ipset -B servers x.x.x.x -b services
> ipset -B services ssh -b clients
> 
> # Restrict access to "all" servers on "all" service ports
> # from "all" allowed clients in one iptables rule
> iptables -A FORWARD -m set --set servers dst,dst,src -j ACCEPT
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary



