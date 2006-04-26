From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Why is this not working???
Date: Wed, 26 Apr 2006 13:49:33 +0200 (CEST)
Message-ID: <64056.193.173.147.3.1146052173.squirrel@webmail.sterenborg.info>
References: <200604251615.03991.stratism@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604251615.03991.stratism@gmail.com>
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

On Tue, April 25, 2006 15:14, Stratos Margaritis wrote:
> Can someone help me find out why is this rule does not work?
>
> *filter
> :INPUT DROP [1803:271102]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
> -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -p tcp -j REJECT --reject-with tcp-reset
> -A INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
> -A FORWARD -p tcp -i eth0 -s xxx.xxx.xxx.xxx/28 -o eth1 -d yyy.yyy.yyy.=
yyy -j
> ACCEPT
> -A FORWARD -j LOG
>
> Where xxx.xxx.xxx.xxx is a real network that should be allowed to conta=
ct the
> server yyy.yyy.yyy.yyy both of which are having real IP's.

And exactly *what* is not working ? Error messages ?

AFAICS you set OUTPUT to drop but you don't allow ESTABLISHED and RELATED
connections out.

-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


Gr,
Rob



