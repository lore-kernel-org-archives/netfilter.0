From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack: table full, dropping packet. - Anyone?????
 Frustrating!
Date: Mon, 3 Jun 2002 12:12:33 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031207470.4553-100000@blackhole.kfki.hu>
References: <1456.24.168.132.35.1023044593.squirrel@mail.vistawiz.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1456.24.168.132.35.1023044593.squirrel@mail.vistawiz.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shazad Malik <smalik@vistawiz.com>
Cc: netfilter@lists.samba.org

Hello,

On Sun, 2 Jun 2002, Shazad Malik wrote:

> I have seen other explanations such as incresing your tcp max number as
> your physical mem. increase.  Check you /proc/net/ip_conntrack file for the
> current connections.  But none of these factors have anything to do with
> this error.  I have only 2 connections, doing regular HTTP gets and its
> filling my log file:

You mean, that the command

# wc -l /proc/net/ip_conntrack

results something like "2 /proc/net/ip_conntrack" and you still got
the messages:

> Jun  2 09:50:39 new kernel: ip_conntrack: table full, dropping packet.

Simply unbelievable...

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


