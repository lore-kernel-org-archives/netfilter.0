From: Samuel =?iso-8859-1?Q?D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: Why is this not working???
Date: Wed, 26 Apr 2006 13:42:26 +0200 (CEST)
Message-ID: <52275.195.55.244.106.1146051746.squirrel@www.arcoscom.com>
References: <200604251615.03991.stratism@gmail.com>
Reply-To: samueldg@arcoscom.com
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
Content-Type: text/plain; charset="iso-8859-1"
To: Stratos Margaritis <stratism@gmail.com>
Cc: netfilter@lists.netfilter.org

Perhaps did you need something as:

-A FORWARD -m state --state RELATED,ESTABLISHED \
           -j ACCEPT
-A FORWARD -m state --state NEW \
           -p tcp \
           -i eth0 -s xxx.xxx.xxx.xxx/28 \
           -o eth1 -d yyy.yyy.yyy.yyy \
           -j ACCEPT

?

Take care in "FORWARD" chain and the "-m state" in the second rule.


--=20
Samuel D=EDaz Garc=EDa
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

Tlfn.: 956 70 13 15
Fax:   956 70 34 83


El Mar, 25 de Abril de 2006, 15:14, Stratos Margaritis escribi=F3:
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
> -A FORWARD -p tcp -i eth0 -s xxx.xxx.xxx.xxx/28 -o eth1 -d yyy.yyy.yyy.yyy
> -j
> ACCEPT
> -A FORWARD -j LOG
>
> Where xxx.xxx.xxx.xxx is a real network that should be allowed to contact
> the
> server yyy.yyy.yyy.yyy both of which are having real IP's.
>
>
> --
> Stratos
> stratism@gmail.com
>



