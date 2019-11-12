From: Pigi <pigi@frumar.it>
Subject: Re: Trouble getting SYNPROXY to work.
Date: Tue, 12 Nov 2019 19:31:54 +0100
Message-ID: <2490043.Bzh1xko5Hd@topolinux>
References: <3018728.1mgFJ8EcOk@topolinux> <3abdbb03-e10c-938f-bfb1-5e10764e1a3f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=frumar.it;
        s=scnd; h=DKIM-Filter:From:To:Subject:Date:Message-ID:User-Agent:
        In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
        Content-Type; bh=ScFPgMWicPKaLF9Av8JEyvlY2uI=; b=i/pKfS4mNSWhlfA
        6C9ZE9V2Bl1JIl/Bgs3mL6mDW8iW1tlHq7K3OboL4wZpz2GSPRL9IaCmFE6oMFuL
        vvCoxQZvbYsbfWI+vhx+rcCb0kCpKxwaGYSwunxInprAt7IvoZJugRaNc9vtaEw8
        iWToXrbfCIrfllfgHg/yV1feac7s=
DKIM-Filter: OpenDKIM Filter v2.10.3 orca.frumar.it xACIWiZS003328
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=frumar.it; s=orca;
        t=1573583569; bh=dWQAn7wnOArZCd+dLVxQuGrkfMo=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=cCkDwbiHbq3sSFLoD4fJ6QQM5g4E/Cyo80rpD+zTDmZ94y6zShxpHJMIJBbKfCSdA
         ICiCai3/9JpgGSwcfj7Zddj5+6GM39+UQGCZoIneb9xS67HrPG0COVcLWClPUb6Ofo
         N6RYoO2xSQt+wXVPlF47YJ0FrDyL5A87hrpml6Go=
In-Reply-To: <3abdbb03-e10c-938f-bfb1-5e10764e1a3f@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

On Tuesday 12 November 2019 11:37:29 Fatih USTA wrote:
> Hi Pierluigi,
> 
> If you don't have ip address on br0 interface.


But, Fatih, I do have an IP address on br0:

root@firewall:~# ifconfig br0                                                                                                                                                                                     
br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500                                                                                                                                                         
        inet 10.0.1.51  netmask 255.255.255.0  broadcast 10.0.2.255                                                                                                                                               


> If you have a IP address on br0 interface then you should check 
> net.ipv4.ip_forward sysctl parameters. (value should be 1)

Routing is enabled:
root@firewall:~# sysctl -a| grep net.ipv4.ip_forward
net.ipv4.ip_forward = 1

> 
> My other advice to you.
> 1- Use external Ethernet for SYN Proxy.
> /usr/sbin/iptables -A INPUT -m physdev --physdev-in $external_iface_eth0 
> -p tcp -m tcp -m conntrack --dport 81 --ctstate INVALID,UNTRACKED -j 
> SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1323

I will try this, but, as told in my mail, I have tried the SYNPROXY on either physical ( eth0 eth1 eth2, all with ip address ) than bridge interfaces.

> 2- If you set 0 this parameters then you take the better performance.
> 
> net.ipv4.tcp_timestamps = 1

Already on.

root@firewall:~# sysctl -a| grep net.ipv4.tcp_timestamps
net.ipv4.tcp_timestamps = 1


> 
> 3- Last advice.
> If you are using HTTPS connection then don't set wscale. And you may use 
> mss 1460.
>

I will try with this, but I suspect it will not change my problem.

Thanks for your time.

Pireluigi

