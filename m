From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: Log MARK value
Date: Thu, 25 Sep 2008 07:13:48 +1000
Message-ID: <48DAAD8C.2080302@standarduniversal.com.au>
References: <66c343c00809240856n58cdcfd4qd255b4deb80d0ed4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <66c343c00809240856n58cdcfd4qd255b4deb80d0ed4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: julien vehent <julien@linuxwall.info>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>



julien vehent wrote:
> Hi There,
>
> I'm trying to debug some rules and would like to LOG the mark value
> assigned to a packet.
> The LOG target doesn't give this information, even in debug level. I
> tried ULOG but apparently it's the same thing.
> /proc/net/ip_conntrack shows a "mark" field that stays at zero,
> whatever I change in my rules.
>
> I found a commit from Patrick McHardy on this subject :
> http://kerneltrap.org/mailarchive/git-commits-head/2008/4/19/1508664
>
> Has this been commited yet ? If yes, how can I use it ?
> My current kernel version is Linux 2.6.18-6-686.
>
> The test rule : iptables -t mangle -A INPUT -p tcp --dport 22 -j MARK
> --set-mark 0x5
>
> What's seen on the system :
>
> arael:/proc/net# cat ip_conntrack|grep dport=22
> tcp      6 431999 ESTABLISHED src=[IP SRC] dst=[IP DST] sport=3874
> dport=22 packets=2585 bytes=165320 src=[IP SRC] dst=[IP DST]  sport=22
> dport=3874 packets=2483 bytes=637896 [ASSURED] mark=0 use=1
>
> arael:/proc/net# iptables -L -v -t mangle
> Chain INPUT (policy ACCEPT 1074K packets, 448M bytes)
>  pkts bytes target     prot opt in     out     source               destination
>   360 27348 MARK       tcp  --  any    any     anywhere
> anywhere            tcp dpt:ssh MARK set 0x5
>
> arael:/proc/net# tail -n 1 /var/log/syslog
> Jul 18 20:27:07 arael kernel: IN=eth0 OUT=
> MAC=00:0c:29:f8:19:1a:00:15:60:98:aa:6b:08:00 SRC=[IP SRC] DST=[IP
> DST] LEN=92 TOS=0x00 PREC=0x00 TTL=128 ID=21023 DF PROTO=TCP SPT=3874
> DPT=22 WINDOW=63732 RES=0x00 ACK PSH URGP=0
>
>
> Regards,
> Julien
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
you need to save the mark for it to appear in the ip_conntrack list.

	iptables -t mangle -A INPUT -p tcp --dport 22 -j MARK --set-mark 0x5
	iptables -t mangle -A INPUT -p tcp --dport 22 -j CONNMARK --save-mark

you need patch and compile kernel source to see it in syslog

patch net/ipv4/netfilter/ipt_LOG.c like this... 

@@ -56,6 +56,8 @@
        printk("SRC=%u.%u.%u.%u DST=%u.%u.%u.%u ",
               NIPQUAD(ih->saddr), NIPQUAD(ih->daddr));

+       printk("FWMARK=%u ", (unsigned int)skb->mark);
+
        /* Max length: 46 "LEN=65535 TOS=0xFF PREC=0xFF TTL=255 ID=65535 " */
        printk("LEN=%u TOS=0x%02X PREC=0x%02X TTL=%u ID=%u ",
               ntohs(ih->tot_len), ih->tos & IPTOS_TOS_MASK,
 
regards

b
