From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: I need help , please
Date: Thu, 4 Jul 2002 20:48:31 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070420483100.06327@Lms>
References: <001e01c22321$e86018a0$2400a8c0@inq7.net> <00fc01c22352$6a2168a0$8703000a@aid.inf.cu> <20020704182042.XIE16050.mta01-svc.ntlworld.com@there>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020704182042.XIE16050.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Thursday 04 July 2002 20:20, Antony Stone wrote:
> On Thursday 04 July 2002 1:00 pm, david wrote:
> > I amtrying to set a dns and proxy server
>
> I assume this means you want to run DNS and an http proxy such as squid on
> the machine running the Firewall.   If this is not correct, post again and
> tell us what iptables rules you are trying to set up (which is what I was
> trying to ask).
>
> Anyway, if that is the correct assumption, how about a set of rules such as
> this ?
>
> # Standard default policies
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
> # Allow in DNS requests
> iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -p udp --dport 53 -j ACCEPT
> # Allow out DNS requests
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> # Redirect http requests to local proxy
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT 127.0.0.1:80

Anthony, just for my understanding: is this any different from:

iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT   ?

Jan Humme.

