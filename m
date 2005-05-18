From: varun_saa@vsnl.net
Subject: Re: RE: smtp/pop and NAT only
Date: Wed, 18 May 2005 16:43:40 +0500
Message-ID: <190811a190cfab.190cfab190811a@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org



----- Original Message -----
From: Rob Sterenborg <rob@sterenborg.info>
Date: Wednesday, May 18, 2005 3:54 pm
Subject: RE: smtp/pop and NAT only

> > Hello,
> >      My server is on FC3 (fedora3)
> > eth0 is WAN ---> DSL router ----> ISP
> > eth1 is LAN
> 
> Not sure I understand the ASCII art : is your server the DSL router ?
The server has two ethernet card. eth0 is basically WAN.
> 
> > I would like to that 2 client 192.168.0.253 and 192.168.0.248 
> > are connected to " fedora3 server "
> > via NAT.
> 
> So that they can do "anything" ?

Yes that is correct.
> 
> > And all other clients connected to "fedora3 server"
> > are able to only send / recieve mail.
> > 
> > Howto do that
> 
> Something like :
> 
> $IPT -P FORWARD DROP
> 
> $IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.248 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.253 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 25 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 110 -j ACCEPT
> 
> $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT \
>  --to-source <inet_ip>

No static IP
> 
> Maybe Oscars IPTables tutorial is something useful :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> 
> Gr,
> Rob

Thanks a lot

I shall give it a try.

Varun
> 
> 
> 


