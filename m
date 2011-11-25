From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 11:59:50 +0800
Message-ID: <4ECF12B6.50001@gmail.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <4ECEEC11.5010701@cn.fujitsu.com> <4ECF0E75.7030000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1vCt+R9fuj9yBs8IINKHiOWZt+B88UkHMLmlHJuAr5g=;
        b=YJGI01s0uMGvBQHSXdcXnuZYk1s0CoZQBWJDgxM2HWQ3YYXK9YKx7Pej1vMoN2Y2Sm
         bm6ggDT2GKn5KClK1LRzS/KP96SdX4eS9yCVtH8pBfLt66V2vKpCHiBrmzOxyllTBKH4
         S9eb7hjYBSGeNnglIIrerRI4BkiAFeZKbxp3w=
In-Reply-To: <4ECF0E75.7030000@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Gao feng <gaofeng@cn.fujitsu.com>
Cc: netfilter@vger.kernel.org, "Brian J. Murrell" <brian@interlinx.bc.ca>

And the following document for conntrack-tool all talked about:
"established TCP connections can be cut or blocked by removed entrance=20
in /proc/net/ip_conntrack"

http://conntrack-tools.netfilter.org/about.html
http://conntrack-tools.netfilter.org/manual.html

However I removed the entrance by timeout or manually by conntrack -D,=20
none worked.

I am just wondering whether conntrack only works for tracing event, no=20
functionality for filtering at all?


On 2011-11-25 11:41, lu zhongda wrote:
> Hi, Gao Feng:
>     First thanks for your response!
>     I set the two timeout to their corresponding value:
>     echo 60 >=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
>     echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose
>
>     The ESTABLISHED item for port 9999 was inserted after connection=20
> created and removed after 60 seconds timeout.
>     Using tool conntrack supplied by iptables also proved this:
>
>     conntrack -E
>     [DESTROY] tcp      6 src=3D192.168.2.194 dst=3D192.168.2.166=20
> sport=3D41570 dport=3D9999 packets=3D4 bytes=3D218 src=3D192.168.2.16=
6=20
> dst=3D192.168.2.194 sport=3D9999         dport=3D41570 packets=3D3 by=
tes=3D166
>
>     However netstat indicated that the physical connection was still=20
> there and the communication between two endpoints was not blocked or=20
> dropped.
>
>     netstat -an | grep 9999
>     tcp        0      0 192.168.2.166:9999         =20
> 192.168.2.194:41570         ESTABLISHED
>
>     The state related rule set in my configuration did not work at al=
l:
>
>     -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
>     -A INPUT -p tcp -m state --state ESTABLISHED -j LOG --log-prefix=20
> "conn established::"
>     -A INPUT -p tcp -m state --state INVALID -j DROP
>     -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state=
=20
> --state NEW -j LOG --log-prefix "DROP invalid::"
>     -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state=
=20
> --state NEW -j DROP
>
>     The communication was not affected by the rules and no log in=20
> /var/log/iptables.log.
>     For an explanation, I redirected my Linux kernel log to=20
> /var/log/iptables.log
>
>     However other rule in /etc/sysconfig/iptables did logged file, lo=
g=20
> found in /var/log/iptables.log
>     -A INPUT -p tcp -m tcp --dport 9999 -j LOG --log-prefix "ACCEPT=20
> 9999::"
>
>     I attached my iptables rule set for reference.
>     Hope you can give me another hint and related rule set.
>     Thanks for your support.
>
>
> On 2011-11-25 9:14, Gao feng wrote:
>> =E4=BA=8E 2011=E5=B9=B411=E6=9C=8824=E6=97=A5 17:46, lu zhongda =E5=86=
=99=E9=81=93:
>>>      The timeout is defined in=20
>>> //proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established/=
=20
>>> , which is defaulted to 5 days, I change it to a short value for=20
>>> testing, such as 1 min.
>>>      the linux shell command is: echo "60"> =20
>>> //proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established/
>>>      The timeout for ESTABLISHED type item does works, and the item=
=20
>>> is removed after timeout, however the connection is not blocked or=20
>>> dropped at all.
>> Hi zhongda.
>>
>> How about echo 0>  /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loo=
se
>>
>

