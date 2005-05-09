From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Re: Redirecting traffic to my ftp site?
Date: Mon, 9 May 2005 20:36:46 +0200
Message-ID: <200505092036.46847.chadley@pinteq.co.za>
References: <200505092013.56681.chadley@pinteq.co.za>
	<20050509182716.GA6029@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050509182716.GA6029@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Monday 09 May 2005 20:27, Jason Opperisano wrote:
> On Mon, May 09, 2005 at 08:13:56PM +0200, Chadley Wilson wrote:
> > Greetings
> >
> > My firewall / router has two interfaces.
> > bond0 == internal
> > eth0 == external
> >
> > I have an ftp server setup on the same box. If anyone on the internal
> > network tries to access http 80 or ftp 20:21 I would like to route them
> > regardless of the url entered to my ftp site.
> >
> > :} "evil I know"
>
> um--it's called "transparent proxying" and i wouldn't refer to it as
> "evil."  that being said--the daemon listening on port 80/21 needs to
> support transparent proxying (like squid), otherwise it's well..."evil"
> wouldn't be *my* choice of words.
>
> > iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 80 -j DNAT \
> > --to-dest 192.168.0.1 (ftp??)
>
>   iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 80 \
>     -j REDIRECT --to-ports $PROXY_PORT
>
>   iptables -A INPUT -i bond0 -p tcp --dport $PROXY_PORT -j ACCEPT
>
> you'd also need rules to allow the firewall itself to go fetch the
> content for the end user.
>
Thanks I have never attempted this before, an as a matter of fact never even 
thought it could be done. One of my colleagues suggested it o me. :)




-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================


