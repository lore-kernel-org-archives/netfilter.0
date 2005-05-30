From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ftp server
Date: Mon, 30 May 2005 12:09:29 +0200
Message-ID: <429AE659.7030809@mnemon.de>
References: <web-768144019@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-768144019@mail01.infosat.net>
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

Hi,

it clown schrieb:

>Hi All,
>
>I have a ftp server running on the box connected to the
>internet with iptables. I would like to allow ftp passive
>connections.I have done the following and it does not want
>to work:
>  
>
Let me summarize this to be sure I got it. On your internet box runs a
ftp server and
iptables and you want to allow passive FTP _to_ your box. Right ?

>iptables -A INPUT -p tcp --sport 21 -m state --state
>ESTABLISHED -j ACCEPT
>iptables -A OUTPUT -p tcp --dport 21 -m state --state
>NEW,ESTABLISHED -j ACCEPT
>iptables -A INPUT -p tcp --sport 1024: --dport 1024: -m
>state --state ESTABLISHED -j ACCEPT
>iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m
>state --state ESTABLISHED,RELATED -j ACCEPT
>  
>
If I'm right you should swap --sport and --dport to something like this:

iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT
iptables -A OUTPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

This should work.

HTH and have a nice time,

Joerg



