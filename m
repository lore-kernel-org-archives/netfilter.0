From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: TCP 4 way handshake or TCP Split Handshake Attack
Date: Fri, 24 Jan 2020 22:54:11 +0300
Message-ID: <b7975d59-04d7-4163-beda-94269ef68903@gmail.com>
References: <33c1b81b-cb3d-e277-334f-5a8daaf8dd73@gmail.com>
 <20200124162417.GW795@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6xdOZu4XXiOfRJhqsCFEJQkZXOlKlj9tQY72hpHSBI8=;
        b=qdBKkK5wgzFTmxdmh4xj76YlUaVC1kT0XuAr2EDoK7SjyXLuxo3FHuIvNXsVM3kns5
         SkiGdV9ipjUlLSTlq6mjeOqB/H6TppX39rBGAmL/nDjVndaw9mmGy1inuHXTj9bAVtQj
         wnPOhQGlRPYCOMrTc/fOFxoB9AJRdjTtTHM1fjeZIt3XDCQVzolEENWjmhJCU8K+QH+V
         /7bpYhb/KKjJPfMKPBPgP2Nc++g4hmk0REDaeH0ojIOHBLaMp9XQbuPGI/dvVunIlBcz
         2Nmf8y8cdoa0/tmg+GbxgdjT9vALwchvBYuqLpczY9hMlIEEsxNz6oRlBKe0dAHZ/ifF
         dVLg==
In-Reply-To: <20200124162417.GW795@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org


Fatih USTA

On 24.01.2020 19:24, Florian Westphal wrote:
> Fatih USTA <fatihusta86@gmail.com> wrote:
>> Hello,
>> I am trying to protect my network from the tcp split handshake attack!
>> (4-way handshake rejection or 3-way handshake enforcement).
>> I tested the sample code. (link below) And passed the firewall(iptables).
> Why wouldn't it?  Its valid tcp, your ruleset allows connections to happen
> and there is a socket expecting a connection.

Actually there isn't real open socket(sample code) on the clients. Only 
sending and receiving packet. There is no listen port on the system. (If 
I understand correctly)
>> I can't find any solution on the internet for Linux.
> nft add rule filter forward tcp flags & (syn | ack) == syn ct direction reply counter drop

fw1

-A FORWARD -p tcp -m tcp --tcp-flags SYN,ACK SYN -m conntrack --ctdir 
REPLY -j LOG --log-prefix "SPLIT FWD " --log-level 6
-A FORWARD -p tcp -m tcp --tcp-flags SYN,ACK SYN -m conntrack --ctdir 
REPLY -j DROP

kernel: : [3074700.968937] SPLIT FWD IN=eth12 OUT=eth11 
MAC=8a:15:53:25:4e:94:72:43:c2:9f:07:cb:08:00 SRC=172.16.2.2 
DST=10.0.0.2 LEN=60 TOS=0x00 PREC=0x00 TTL=61 ID=206 DF PROTO=TCP 
SPT=5555 DPT=5555 WINDOW=29200 RES=0x00 SYN URGP=0


I wrote this rule on fw1, but not dropped. Is this rule correct?
Here is the test topology.
host1 <> fw1 <> router <> fw2 <> host2

host1=10.0.0.2
fw1= 10.0.0.1
fw1= 172.16.1.2(MASQ)
router=172.16.1.1
router=172.16.2.1
fw2= 172.16.2.2 (MASQ)
fw2=10.0.1.1
host2=10.0.1.2

host1 command
./tcp-4way.py 172.16.2.2 5555 hello
host2 command
./tcp-4way.py 172.16.1.2 5555 world

host1 result
connected to 172.16.2.2:5555
received message: [world]

host2 result
connected to 172.16.1.2:5555
received message: [hello]

> But why would you want to disallow this behaviour?

There isn't defined port forwarding to clients on the iptables. Clients 
sends packets to "remote Real IP" address. I think this is security 
issue. isn't?
>> Link1: https://tech.labs.oliverwyman.com/blog/2016/11/07/4-way-tcp-handshake-and-firewalls/
> This is simultaneous connect, at least thats what can be seen in the
> tcpdump, syns cross on wire, both ends send syn/ack.  WHy do you
> consider this an "attack"?
I know this is RFC defined feature.
Some one says attack some one says issue.
This issue reported by the nss labs. Global firewall vendors patched 
their software.

What's your comments for this report?
https://www.nsslabs.com/press/2011/5/10/network-firewall-vendors-address-tcp-split-handshake-issues-found-by-nss-labs/

Other links.
https://kb.juniper.net/InfoCenter/index?page=content&id=JSA10476&cat=SECURITY_PRODUCTS&actp=LIST
https://www.hackmageddon.com/2011/04/17/tcp-split-handshake-attack-explained/
https://www.secplicity.org/2011/04/15/what-is-the-tcp-split-handshake-attack-and-does-it-affect-me/
