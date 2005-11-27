From: Leonardo Marques <surf3r0@gmail.com>
Subject: Re: Route block CONNECT requisitions for apache
Date: Sun, 27 Nov 2005 10:42:55 -0200
Message-ID: <eb5ae9cc0511270442vc300f4m7706e0d5e850a555@mail.gmail.com>
References: <eb5ae9cc0511270326k56aac640g9141e264471247a4@mail.gmail.com>
	<000101c5f34b$11600790$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000101c5f34b$11600790$0101000a@sterenborg.info>
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
To: Lista IPTABLES <netfilter@lists.netfilter.org>

On 11/27/05, Rob Sterenborg <rob@sterenborg.info> wrote:
> > I have a apache webserver behind a iptables firewall, and some people
> > are trying to abuse from my server probably for spam. I have this
> > information on the log of the apache:
> >
> > 219.80.160.238 - - [27/Nov/2005:08:56:13 -0200] "CONNECT
> > 64.161.246.99:25 HTTP/1.0" 200 6446
> >
> > I have a lot of this lines, with some diferent IPs, I already blocked
> > all those IPs.
> >
> > I want create a rule that block all those type of connections,
> > someone know how can i do?
>
> You say you already block these connections. So why do you ask ?

I asked because i did it manually i want some rule to drop this
connections automaticaly.

>
> - If you have a lot of IP addresses : http://ipset.netfilter.org/ for
> creating a set of ip addresses to match

Ok, i'll read this URL.

> - Use Squid as reverse proxy
>
> > The ideia ir more or less it:
> >
> > "everything witch comes for the htttp_port wich contain 'connect type
> > connections' must be deny or droped'"
>
> You want content filtering and Netfilter is no good for that. You could
> use the string match, but if the string you want to match is divided
> over 2 (or more) packets, it won't work.
> Use Squid as reverse proxy to block something like this.

I dont want use squid, but thanks for the idea.

[]s

>
>
> Gr,
> Rob
>
>
>


--
------------------------------
Leonardo Marques
http://www.analyx.org
------------------------------

