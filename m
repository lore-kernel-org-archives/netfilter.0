From: Patrich =?ISO-8859-1?Q?Bj=F6rklund?= <patrich@as8-6-1.pe.g.bonet.se>
Subject: Re: bandwidth monitoring
Date: Fri, 07 Jan 2005 06:48:42 +0100
Message-ID: <1105076924.29832.3.camel@vhost.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi, there. I dont really know if you just wanna know what ips gets
to/through your interfaces? I have a prog called tcpick. It show like
this:

root # tcpick -i eth0 -C
Starting tcpick 0.1.19
tcpick: listening on eth0
SYN-SENT       192.168.0.2:45190 > 217.215.148.17:pop3
SYN-RECEIVED   192.168.0.2:45190 > 217.215.148.17:pop3
ESTABLISHED    192.168.0.2:45190 > 217.215.148.17:pop3
FIN-WAIT-1     192.168.0.2:45190 > 217.215.148.17:pop3
FIN-WAIT-2     192.168.0.2:45190 > 217.215.148.17:pop3

>Hello
>
>Does somebody know a program for monitoring bandwidth by ip? I have
>one 
>internet interface and I must monitor many ips adresses on this
>interface. I 
>tried Ipac-ng and, I worked a lot to do this config but it seems not
>working 
>this way.
>
>thanx



------------------------------



