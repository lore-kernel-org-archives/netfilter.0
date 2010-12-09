From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptable for ssh w/ changed port
Date: Thu, 09 Dec 2010 14:04:01 +0100
Message-ID: <4D00D3C1.6020404@plouf.fr.eu.org>
References: <AANLkTinKoUAP4RPDxc7=f9fL7mQnc=Segu8XZPOsJLv2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinKoUAP4RPDxc7=f9fL7mQnc=Segu8XZPOsJLv2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Henry E. a =E9crit :
> I've been using the following iptable for ssh changed port on Fedora,
> where the pc is not behind a wireless router.
> 1.  How should this table change if the pc now is behind a router?

No change is needed.

> 2.  Are the lines for dport 500, 5353, 631, 137, 138 necessary?

Not for SSH. These are for IPSec, multicast DNS, IPP (CUPS), Netbios
(Samba).

>> *nat
>> :PREROUTING ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> :POSTROUTING ACCEPT [0:0]
>> -A PREROUTING -i eth0 -p tcp --dport ### -j DNAT --to-destination ##=
=2E###.###.###:###
>> COMMIT
>> *filter
>> :INPUT ACCEPT [0:0]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A INPUT -p icmp -j ACCEPT
>> -A INPUT -i lo -j ACCEPT
>> -A INPUT -p ah -j ACCEPT
>> -A INPUT -p esp -j ACCEPT
>> -A INPUT -m state --state NEW -m udp -p udp --dport 500 -j ACCEPT
>> -A INPUT -m state --state NEW -m udp -p udp --dport 5353 -d 224.0.0.=
251 -j ACCEPT
>> -A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT
>>
>> -A INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
>> -A INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
>> -A INPUT -m state --state NEW -m tcp -p tcp --dport ### -j ACCEPT
>> -A INPUT -j LOG --log-prefix firewall:
>> -A INPUT -j REJECT --reject-with icmp-host-prohibited
>> COMMIT

Why do not simply setup sshd to listen on the alternate port instead of
using NAT ?
