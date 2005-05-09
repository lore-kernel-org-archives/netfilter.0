From: varun_saa@vsnl.net
Subject: Re: mails not going thru'
Date: Mon, 09 May 2005 11:01:47 +0500
Message-ID: <fccabefcb284.fcb284fccabe@vsnl.net>
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
To: netfilter@lists.netfilter.org



----- Original Message -----
From: varun_saa@vsnl.net
Date: Monday, May 9, 2005 9:23 am
Subject: Re: mails not going thru'

> 
> 
> ----- Original Message -----
> From: Jason Opperisano <opie@817west.com>
> Date: Saturday, May 7, 2005 8:17 pm
> Subject: Re: mails not going thru'
> 
> > On Sat, May 07, 2005 at 10:14:49AM +0500, varun_saa@vsnl.net wrote:
> > > *filter
> > > :FORWARD ACCEPT [0:0]
> > > :INPUT DROP [0:0]
> > > :OUTPUT ACCEPT [0:0]
> > > -A INPUT -s 127.0.0.1 -j ACCEPT
> > > -A INPUT -p tcp -m tcp -i eth1 --dport 3128 --sport 1024:65535 -
> j 
> > ACCEPT> -A INPUT -p udp -m udp -i eth1 --dport 3128 --sport 
> > 1024:65535 -j ACCEPT
> > > -A INPUT -s 62.0.0.0/255.0.0.0 -i eth0 -j REJECT
> > > -A INPUT -p tcp -m tcp -s 217.81.0.0/255.255.0.0 -i eth0 -j REJECT
> > > -A INPUT -i eth0 -j DROP
> > > -A INPUT -p tcp -m tcp -i eth1 --sport 80 -j DROP
> > > -A INPUT -m state -i eth1 --state ESTABLISHED,RELATED -j ACCEPT
> > > -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > -A FORWARD -p tcp -i eth1 -o eth0 --dport 25 --sport 1024: -j 
> > ACCEPT  --syn 
> > > -A FORWARD -p tcp -i eth1 -o eth0 --dport 110 --sport 1024: -j 
> > ACCEPT  --syn 
> > > -A FORWARD -p tcp -i eth1 -o eth0 --dport 1863 --sport 1024: -j 
> > ACCEPT  --syn 
> > > -A FORWARD -p tcp -i eth1 -o eth0 --dport 5050 --sport 1024: -j 
> > ACCEPT  --syn 
> > 
> > the policy of your FORWARD chain is set to ACCEPT, so even if 
> there's> traffic you haven't accounted for in these rules--it will 
> still be
> > allowed through.  you have a rule that allows SMTP (TCP 25) out--
> so i
> > bet if you type:
> > 
> >  telnet 64.233.185.27 25
> 
> [varun@saamail varun]$ telnet 64.233.185.27 25
> Trying 64.233.185.27...
> 
> No response
> > 
> > which is the IP of gmail's preferred MX, you'd get connected.  if 
> > you'reFORWARD policy was DROP, i'd say that the reason you can't 
> > send mail from
> > a client machine is because you have no rule allowing DNS traffic 
> out:> 
> >  -A FORWARD -i eth1 -o eth0 -p udp --sport 1024: --dport 53 -j 
> ACCEPT>  -A FORWARD -i eth1 -o eth0 -p tcp --syn --sport 1024: --
> dport 53 \
> >     -j ACCEPT
> > 
> > but since those packets will be accepted by the chain policy, my 
> only> guess is that you do not have any valid DNS servers 
> configured on your
> > client machines--on a *nix box:
> > 
> >  cat /etc/resolv.conf
> 
> [varun@saamail varun]$ cat /etc/resolv.conf
> search saice.edu
> nameserver 203.145.184.13
> 
> # ppp temp entry
> 
> > 
> > -j
> > 
> 
> Strange, I can browse but I can't ping ISP gateway
> and ISP DNS.
> 
> I can ping ISP gateway and ISP DNS from server.
> 
> 
> Varun
> 
> 
>  watch -d iptables -nvL -> gives the following


 Every 2.0s: iptables -nvL                                                                       Mon May  9 11:36:33 2005

Chain INPUT (policy ACCEPT 25339 packets, 3067K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 289 packets, 20494 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 7895 packets, 1313K bytes)
 pkts bytes target     prot opt in     out     source               destination


If yhat helps.

Varun



