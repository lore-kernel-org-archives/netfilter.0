From: "Warren P" <warren-cpt@webmail.co.za>
Subject: Re: ip_conntrack
Date: Mon, 27 Oct 2003 21:23:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-13621304@mail03.infosat.net>
References: <001501c37bf1$bab38d90$0f640a0a@acamarpeng>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c37bf1$bab38d90$0f640a0a@acamarpeng>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: pengjie <bill.peng@ocamar.com>, Warren P <weatherman@webmail.co.za>, netfilter@lists.netfilter.org

hi

I've upgraded the server to Redhat 8 ... I seem to be worst
off now ... I'm getting the error "kernel: ip_conntrack:
table full, dropping packet." every few days now instead of
every few months as with Rehar 7.3

Question1: What are the dangers of increasing
/proc/sys/net/ipv4/ip_conntrack_max (I've currently got
1gig of RAM in my server and the current value of
ip_conntrack_max is 65528).

Question2: Do i really need ip_conntrack? Since I'm only
using it for my transparent proxy.

Question3: If i don't need it in order to user IP Tables,
how do i get rid of it safely? Will rmmod ip_conntrack.o be
sufficient and save?

Regards,
Warren P

------------------------------------------------------------


On Tue, 16 Sep 2003 09:27:44 +0800
 "pengjie" <bill.peng@ocamar.com> wrote:
> try the 2.4.21.
>   ----- Original Message ----- 
>   From: Warren P 
>   To: netfilter@lists.netfilter.org 
>   Sent: Friday, September 12, 2003 4:19 AM
>   Subject: ip_conntrack
> 
> 
>   hi
> 
>   does anyone know how to clear/flush the ip_conntrack
> table. Every 4 to 6 months i need to reboot my server
> because it drops packets and complains that the table is
> full ...
> 
>   Regards,
>   Warren P

Regards,
Warren P
___________________________________________
 Look Good, Feel Good www.healthiest.co.za


