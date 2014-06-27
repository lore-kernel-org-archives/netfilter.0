From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 11:29:17 -0700
Message-ID: <CALPbv18b4ZnynXOUW59tu1aq2=uMi54M4ZUMUhacijCN1VVcbg@mail.gmail.com>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
	<53AD4B1F.1000705@plouf.fr.eu.org>
	<CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>
	<53ADAF27.5070505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Y5z9jrmqOggGjS1zA6umG4n56HMw6O0fwSMe/6Zzrq0=;
        b=FCz6+Z6dHxBdmtuQuQn8GSNQH0FTXw0+S7oVFFxqQqsldTjTkgik5Uj5E7UTXSrGdy
         2s/C0NPf6+1sylle6BHB0mwnIidzQS577LCPR++2kl+IwmHGhSwBTcT2wPHRAb4ABSQ6
         mRAF1TKDOQByJi6svTkbGG8Qogp3lA02Exe/1dp0nW1PefmsjXdFMGLhofrpVRuwM39K
         SEkT1Lox5XuyfYpdJgJHoFs0c/Cnc43s6/mbZaZMvgQCoxtCzPOdSU9fLPDyiQn4cPTE
         jixqol7ybk0gJEbEZxgDZ+GPrtnYvFANCFwlBVlmJP4UGs2wR3AUwfHKKsEGwXL0suSa
         4wVw==
In-Reply-To: <53ADAF27.5070505@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I did that but still not working. the telnet [telnet 10.4.38.182 2300]
command is stuck for a long time

# iptables -t nat --list
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere             tcp
dpt:2300 to:192.168.10.2:2300

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  192.168.10.0/24      anywhere

also with -d 10.4.38.182
# iptables -t nat --list
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             10.4.38.182          tcp
dpt:2300 to:192.168.10.2:2300

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  192.168.10.0/24      anywhere

# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
default         10.4.39.254     0.0.0.0         UG    0      0        0=
 eth1
10.4.38.0       *               255.255.254.0   U     0      0        0=
 eth1
192.168.10.0    *               255.255.255.0   U     0      0        0=
 br0

// Ping from host to veth is fine
# ping 192.168.10.2
PING 192.168.10.2 (192.168.10.2): 56 data bytes
64 bytes from 192.168.10.2: seq=3D0 ttl=3D64 time=3D0.559 ms

# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.fe5585cf0c11       no              veth2

On Fri, Jun 27, 2014 at 10:51 AM, Pascal Hambourg
<pascal@plouf.fr.eu.org> wrote:
> Vijay Viswanathan a =C3=A9crit :
>> I cannot use the host network for container/veth IPs, so it looks li=
ke
>> I need a NAT.
>
> Indeed.
>
> Enable IP forwarding on the host (sysctl net.ipv4.ip_forward=3D1).
> Set default route in the container (seems to be set already).
> Set port forwarding (DNAT) on the host to the container.
>
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 2300 \
>   -j DNAT --to 192.168.10.2:2300
>
> Optionally, set masquerading (SNAT) on the host for the containers.
>
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.10.0/24 \
>   -j MASQUERADE
>
