From: Jeff Jensen <jjensen@unyalli.com>
Subject: Re: Help with ftp helper please
Date: Sun, 25 Apr 2010 05:50:37 -0600
Message-ID: <j2ib376a78e1004250450m375b41d0n8a48215fcf9667f4@mail.gmail.com>
References: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com>
	 <4BD3E5F3.4070907@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD3E5F3.4070907@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: mart.frauenlob@chello.at

Ok got it, I wasn't sure how much help the helper would provide. I
have to fully handle the control channel, the helper handles the data
channel both active and passive. Thanks.



On Sun, Apr 25, 2010 at 12:49 AM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 24.04.2010 18:48, Jeff Jensen wrote:
>> Hello netfilter people,
>>
>> =C2=A0 =C2=A0I have an email conversation from Jan 9, 2010 between
>> mart.frauenlob@chello.at and margoandtodd@gmail.com with the subject
>> "passive mode ftp high ports driving me nuts". I have studied this
>> intensely and found out about this "helper" thing.
>>
>> On a test ubuntu 9.04 box I have these rules and nothing else plus I
>> have added nf_conntrack_ipv4 and nf_conntrack_ftp to /etc/modules.
>>
>> # Local host
>> iptables -A INPUT =C2=A0-i lo -j ACCEPT
>> iptables -A OUTPUT -o lo -j ACCEPT
>> # DNS
>> iptables -A OUTPUT -o eth0 -p udp -m state --state NEW,ESTABLISHED
>> --dport 53 -j ACCEPT
>> iptables -A INPUT =C2=A0-i eth0 -p udp -m state --state ESTABLISHED =
--sport
>> 53 -j ACCEPT
>> # FTP Helper Chain
>> iptables -N FTPChn
>> iptables -A FTPChn -j LOG --log-prefix "FTP "
>> iptables -A FTPChn -j ACCEPT
>> # FTP
>> iptables -A OUTPUT -o eth0 -m helper --helper ftp -j FTPChn
>> iptables -A INPUT =C2=A0-i eth0 -m helper --helper ftp -j FTPChn
>> iptables -A OUTPUT -o eth0 -p tcp -m state --state NEW --dport 21 -j=
 FTPChn
>> # Log All Else
>> iptables -A INPUT =C2=A0 -j LOG --log-prefix "Filter Input =C2=A0 "
>> iptables -A OUTPUT =C2=A0-j LOG --log-prefix "Filter Output =C2=A0"
>> iptables -A FORWARD -j LOG --log-prefix "Filter Forward "
>> # And Reject
>> iptables -A INPUT =C2=A0 -j REJECT --reject-with icmp-host-prohibite=
d
>> iptables -A OUTPUT =C2=A0-j REJECT --reject-with icmp-host-prohibite=
d
>> iptables -A FORWARD -j REJECT --reject-with icmp-host-prohibited
>>
>> when I ftp to mirror.anl.gov this shows up in the log (trimmed for e=
asy reading)
>>
>> FTP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IN=3D OUT=3Deth0 SRC=3D=
192.168.128.20 DST=3D146.137.96.15
>> PROTO=3DTCP SPT=3D36826 DPT=3D21 WINDOW=3D5840 SYN URGP=3D0
>> Filter Input =C2=A0 IN=3Deth0 OUT=3D SRC=3D146.137.96.15 DST=3D192.1=
68.128.20
>> PROTO=3DTCP SPT=3D21 DPT=3D36826 WINDOW=3D5792 ACK SYN URGP=3D0
>> Filter Output =C2=A0IN=3D OUT=3Deth0 SRC=3D192.168.128.20 DST=3D146.=
137.96.15
>> PROTO=3DTCP SPT=3D36826 DPT=3D21 WINDOW=3D5840 SYN URGP=3D0
>>
>> Any idea what I'm missing?
>>
>> Thank you
>>
>> Jeff
>
> you don't allow sport 21 back incoming traffic.
> btw: nf_nat_ftp is also loaded?
>
