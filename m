From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: PREROUTING AND SECURITY
Date: Fri, 28 Jun 2002 06:55:48 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <003101c21e9a$be395360$020aa8c0@matttm9svd8lrh>
References: <20020628101729.37c34c29.guillaume.devoyon@integro-networks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Guillaume Devoyon <guillaume.devoyon@integro-networks.com>, netfilter@lists.samba.org

I wouldn't jump to any conclusions about an attack just yet.  If these two
machines are similarily configured (same network card, etc) , it's very
likely that this is just a hardware or driver problem. Do a search for that
error on groups.google.com and you'll see what I mean.  Goodluck,

Matt

----- Original Message -----
From: "Guillaume Devoyon" <guillaume.devoyon@integro-networks.com>
To: <netfilter@lists.samba.org>
Sent: Friday, June 28, 2002 3:17 AM
Subject: PREROUTING AND SECURITY


> hello,
>
> on the firewall at my office, i do preroutings tasks in order to forward
ports.
> In order to do that, i use the following rule :
>
> /sbin/iptables -t nat -A PREROUTING -s $CLIENT_PUBLIC_IP -p tcp -i
$EXTERNAL_INTERFACE\
>  --dport 80 -j DNAT --to $INTERNAL_MACHINE:80
>
> As you can see, I use the "-s" option  to allow only  one person to use my
forwarding port.
>
> Yesterday, I had an attack on the firewall .
> I had this in my /var/log/messages :
>
>
> Jun 27 14:44:39 cofw01 kernel: FIREWALL_80IN=eth0 OUT=
MAC=00:30:48:51:08:f0:00:20:6f:11:34:7b:08:00 SRC=xxx.xxx.xxx.xxx
DST=192.168.1.2 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=47214 DF PROTO=TCP
SPT=3033 DPT=80 WINDOW=8192 RES=0x00 SYN URGP=0
> Jun 27 14:51:49 cofw01 kernel: eth0: card reports no resources.
> Jun 27 14:51:49 cofw01 last message repeated 15 times
> Jun 27 14:51:49 cofw01 kernel: eth0: Too much work at interrupt,
status=0x4050.
> Jun 27 14:51:49 cofw01 kernel: eth0: card reports no resources.
> Jun 27 14:51:49 cofw01 last message repeated 19 times
> Jun 27 14:51:49 cofw01 kernel: eth0: Too much work at interrupt,
status=0x4050.
> Jun 27 14:51:49 cofw01 kernel: eth0: card reports no resources.
> Jun 27 14:51:49 cofw01 kernel: eth0: Too much work at interrupt,
status=0x4050.
> Jun 27 14:51:49 cofw01 kernel: eth0: Too much work at interrupt,
status=0x4050.
> Jun 27 14:51:49 cofw01 kernel: eth0: card reports no resources.
> Jun 27 14:51:49 cofw01 last message repeated 8 times
> Jun 27 14:51:49 cofw01 kernel: eth0: Too much work at interrupt,
status=0x4050
>
> so i saw that xxx.xxx.xxx.xxx had attacked my firewall.
>
> After this i had to reboot my firewall
>
> 1) how is it possible that my firewall switched of my eth0 card ?
>    Is it because I do a log of this translation rule ? (made my system
heavy if there are many connections ?)
>    Is it because for others rules i do an reject instead of an drop ?
>
> Next, I had a look at my apache server behind the firewall, and I found
the following messages in my /var/log/messages
>
> Jun 27 14:51:24 coupf01 kernel: eth0: card reports no resources.
> Jun 27 14:51:24 coupf01 kernel: eth0: Too much work at interrupt,
status=0x4050.
>
>
> whow !!
> the attack had also touched my server behind the firewall..
> How is it possible ? I put an "-s" option in my prerouting..
> Is it enough or should I put an drop rule for others connections? (other
than my client : -s $CLIENT_PUBLIC_IP)
>
>
> Guillaume Devoyon
>



