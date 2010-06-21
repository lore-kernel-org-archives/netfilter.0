From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: newbie question on netfilter-conntrack
Date: Mon, 21 Jun 2010 11:50:52 +0200
Message-ID: <4C1F35FC.6080801@netfilter.org>
References: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>	<alpine.LSU.2.01.1006201415260.26430@obet.zrqbmnf.qr>	<AANLkTinsKIGo4Rh76F7qDF2HpRZZeEqfAxNzDWnMJtWJ@mail.gmail.com> <AANLkTim-u04UoPqvo6fHkjPqVvCtHgYLJFy_Xk6Ekrpe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim-u04UoPqvo6fHkjPqVvCtHgYLJFy_Xk6Ekrpe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

Pete Kay wrote:
> Hi,
> 
> Sorry for posting multiple times.  This should be my last one.
> 
> I modified the conntrack_create_nat.c to redirect udp traffic coming
> from a specific IP:port to another IP, but the program gives error,
> the result of ret is (-1).  Does anyone know what's wrong?

# ./a.out
TEST: create conntrack (OK)
decadence:/tmp# conntrack -L -p udp
udp      17 92 src=192.168.1.12 dst=192.168.1.102 sport=5060 dport=5060
packets=0 bytes=0 [UNREPLIED] src=192.168.1.102 dst=192.168.1.13
sport=5060 dport=5060 packets=0 bytes=0 mark=0 secmark=0 use=2
conntrack v0.9.14 (conntrack-tools): 1 flow entries have been shown.

It works fine here with 2.6.34 and libnetfilter_conntrack 0.0.101
