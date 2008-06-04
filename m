From: Steven Ayre <steveayre@gmail.com>
Subject: Re: Difficulty with iptables script to only allow 3 ports across the  firewall
Date: Wed, 4 Jun 2008 14:13:59 +0100
Message-ID: <36480D80-E875-4BD8-8318-E8FCDCD1ABC4@gmail.com>
References: <W424637935269591212542985@webmail15>
Mime-Version: 1.0 (iPhone Mail 4A102)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:in-reply-to:x-mailer
         :subject:content-transfer-encoding:references:message-id
         :content-type:mime-version:date:cc;
        bh=bzmZJjNvfKN08eXhhRPrAb8bIQ4+8O2ajUFVKAuxmwo=;
        b=r4oSabNXA7hlzbWd89d7b5cel5I2BSSCpKnDofVhgzxe6Xg8JeX7fdhxiLnoXoXoml
         LRnvDtdNVDz3PSwsiqghLBuMMGFPQayMddbkRL7CRjqgF7xRp06RNkOb4vM4zYvKSgOb
         qYhMhjRFZ58df9eeko5DozTeSohRGddJiEY+4=
In-Reply-To: <W424637935269591212542985@webmail15>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: "john@langherd.com" <john@langherd.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

As a suggestion, I always place the ESTABLISHED,RELATED rules first.  
It has to check every packet against each rule in turn. Since most  
packets will be part of an established connection placing that rule  
first minimizes the amount of processing needed.

Steve on iPhone

On 4 Jun 2008, at 02:29, john@langherd.com wrote:

> First, thanks for taking the time to look.
>
> I've been poking at this for almost 2 weeks and am quite stuck.
>
> Here's the nutshell version of what I'm trying to do:
>
> Client machine has an IP address of 192.168.100.101.  The only way I  
> want this client to be able to communicate with machines on the  
> 10.138.x.x network is via HTTPS (443), plus make DNS lookup  
> requests.  I don't want PING, or any windows SMB type connections to  
> succeed.  Just HTTPS and DNS.  Also, the linux box provides dhcp  
> services to the 192.168.200.x network.
>
> I think my fundamental understanding of iptables is wrong.
>
> I 'think' the INPUT is what's allowed to the local machine (i.e.  
> firewall box)
> FORWARD is what's passed from NIC to NIC.
> OUTPUT is what's allowed off the NIC.
>
> Would anybody please give me a hand here?  I learn quickly by  
> examples.  I've poked at a large number of websites, but am not  
> making much headway.
>
> Respectfully,
>
> John
>
> Here's my script as it sits.  It's driving me nuts that I can  
> connect via SMB from the clients on the 192 network to windows SMB  
> shares on the 10. network.
>
>
> IPT="/sbin/iptables"
>
> # THE NETWORK CONTAINING THE SITE SYSTEMS
> DMZ_IP="10.138.2.117"
> DMZ_IFACE="eth0"
> DMZ_BROADCAST="10.138.2.255"
>
> # THE IP RANGE FOR CLIENT COMPUTERS (disconnected network)
> CLIENTS_IP="192.168.200.1"
> CLIENTS_IP_RANGE="192.168.200.0/24"
> CLIENTS_IFACE="eth1"
>
> $IPT --flush
> $IPT --table nat --flush
> $IPT --delete-chain
> $IPT --table nat --delete-chain
>
> $IPT -A INPUT -j LOG --log-prefix "INPUT_PACKETS: "
> $IPT -A FORWARD -j LOG --log-prefix "FORWARD_PACKETS: "
> $IPT -A OUTPUT -j LOG --log-prefix "OUTPUT_PACKETS: "
>
> $IPT --policy INPUT DROP
> #$IPT --policy OUTPUT DROP
>
>
> $IPT -A INPUT -p tcp --dport 22 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 80 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 443 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 53 -j ACCEPT
> $IPT -A INPUT -p udp --dport 53 -j ACCEPT
>
> #$IPT -A INPUT -p udp -j ACCEPT
> #$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> #$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> #$IPT -A FORWARD -p tcp --dport 80 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 443 -j ACCEPT
> $IPT -A FORWARD -p udp --dport 53 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 445 -j DROP
> $IPT -N LOGDROP
> $IPT -A LOGDROP -j LOG
> $IPT -A LOGDROP -j DROP
> $IPT -A INPUT -j LOG
> $IPT -A FORWARD -j LOG
>
> $IPT --table nat --append POSTROUTING --out-interface $DMZ_IFACE -j  
> MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
