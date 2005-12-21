From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: problem related to  ftp
Date: Wed, 21 Dec 2005 13:57:43 +0100 (CET)
Message-ID: <49254.193.173.147.3.1135169863.squirrel@webmail.sterenborg.info>
References: <000501c60572$04613d50$0100000a@server>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000501c60572$04613d50$0100000a@server>
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
To: ammad <ammads@khi.comsats.net.pk>
Cc: netfilter@lists.netfilter.org

On Tue, December 20, 2005 15:31, ammad wrote:
> i have problem and getting this a bug.(may be)
>
> i am using linux box as firewall+forwarding clients requests to
> internet. my problem is that a server of windows ftp2003,  and
> clients are unable to browse ftp site, while they are able to connect

Do you have a passive/active ftp problem ? Did you try to switch from
passive to active (active to passive) and see if it works ?

> any linux base ftp server on net. i am also using squid. all of that
> there isn't any restriction in squid or iptables.
> i can connect from linux box  to windows 2003 ftp server.
> i flushed all rules, deleted all chains. and default policy to
> ACCEPT.
>
> and atleast i used this rule but still getting error from client
> side, when i check on client
> c:\> netstat -a
>  tcp   172.16.0.22:1044     202.145.23.3:ftp    SYN_SENT
>
>
> and at least  connection time  out
> i am using these two rules only (two)
>
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p tcp --dport 21 -j ACCEPT

Do you load "ip_conntrack_ftp" ?
After reading your email I'm not sure if you need ip_nat_ftp : which
is behind the (iptables) firewall, the client or the server ?


Gr,
Rob



