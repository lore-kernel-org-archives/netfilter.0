From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Access Interfaces Wan
Date: Fri, 30 Sep 2011 12:29:36 -0300
Message-ID: <CAMTjHrz0o4TyRnLu8doTCo_ej8XBjBADJpMLM5FDzbGPbqEWzg@mail.gmail.com>
References: <CAMTjHrznU95sGq-0e1CPYetKdXpzprHAo_E3q_R6NdfFFDrLpw@mail.gmail.com>
	<1586563365.76.1317391377548.JavaMail.root@mercurio.contatogs.com.br>
	<CAMTjHrxHk8y_p6NhjabOu8+6XUKDpt76bair=NQZ9Dg2fTbBLw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrxHk8y_p6NhjabOu8+6XUKDpt76bair=NQZ9Dg2fTbBLw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Sorry, please discard my before messenge.


yes Paulo. I wish access my outside ip from my inside network. this
flow must be through firewall because there is others issue in my
network. I can't work around with DNS as your suggest.


 Interface out
                |
                | 200.247.222.1
  	 --------
  	| Firewall |
  	 --------
  	  | bond0 128.2.7.16=09
          |
      _  |______________
     /  |  Switch
( ) /   |_______________
 | /
 |/					          ______=09
/ \                                             |
Ip address 128.2.20.71               | FTP Server
 GW 128.2.7.16                           -----------
                                                       ip Adress
128.2.8.214
access ftp://200.247.222.1                 GW 128.2.7.16




thanks











> 2011/9/30 Paulo Ricardo Bruck <pauloric@contatogs.com.br>:
>> Hi Maicon
>>
>>
>> ----- Mensagem original -----
>>> De: "Usu=E1rio do Sistema" <maiconlp@ig.com.br>
>>> Para: "Mail List - Netfilter" <netfilter@vger.kernel.org>
>>> Enviadas: Sexta-feira, 30 de Setembro de 2011 10:52:35
>>> Assunto: Access Interfaces Wan
>>> Hello everyone,
>>>
>>>
>>> I'm needing that my inside network accesses some IPs which are in t=
he
>>> my firewall wan interfaces. for exemplo, in the firewall there is t=
he
>>> IP 200.247.222.1 on the wan interface. those has a destination NAT =
to
>>> a inside network machine for FTP protocol. so from Internet to
>>> ftp://200.247.222.1 it's Working! but from my inside network to
>>> ftp://200.247.222.1 isn't Working.
>>>
>>> I've done some rules as follow:
>>>
>>
>> I am writing in english for the rest of guys to undersatnd us...8)
>>
>> First could you draw your network in ASCI for us to completely under=
stand your problem?
>>
>> If I got correctly you want from inside your LAN access a FTP which =
is inside yout lan. Is it correct???
>>
>> If it's what you want, the easiest way is to mount a internal dns se=
rver pointing a internal ip for your dns and let all your internal mach=
ines to access your ftp without passing through firewall...8)
>>
>> best regards
>>
>>>
>>> iptables -t nat -I PREROUTING -s 128.2.0.0/24 -d 200.247.222.1 -p t=
cp
>>> --dport 21 -j DNAT --to-destination 128.2.8.214
>>>
>>> iptables -t nat -I POSTROUTING -s 128.2.0.0/24 -d 200.247.222.1 -o
>>> bond0 -j SNAT --to-source 128.2.7.16
>>>
>>> iptables -I FORWARD -s 128.2.0.0/24 -d 200.247.222.1 -j ACCEPT
>>>
>>>
>>> 128.2.0.0/24 is my inside network
>>>
>>> bond0 is the inside interface
>>>
>>> I've done tcpdump on the ftp machine and shows me :
>>>
>>> access from 128.2.20.71 to ftp://200.247.222.1
>>>
>>> 09:44:03.719062 IP 128.2.20.71.35768 > 128.2.8.214.21: S
>>> 395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 728976
>>> 0,nop,wscale 7>
>>> 09:44:03.719273 IP 128.2.20.71.35768 > 128.2.8.214.21: R
>>> 395591609:395591609(0) win 0
>>> 09:44:06.730331 IP 128.2.20.71.35768 > 128.2.8.214.21: S
>>> 395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 729278
>>> 0,nop,wscale 7>
>>> 09:44:06.735412 IP 128.2.20.71.35768 > 128.2.8.214.21: R
>>> 395591609:395591609(0) win 0
>>>
>>> seems that the source NAT isn't working becuase is appear 128.2.7.1=
6
>>> instead 128.2.20.71
>>>
>>> when access direct ftp://128.2.8.214 ( bypass the firewall ) show :
>>>
>>> 09:44:37.499007 IP 128.2.20.71.34638 > 128.2.8.214.21: S
>>> 931391232:931391232(0) win 14600 <mss 1460,sackOK,timestamp 732355
>>> 0,nop,wscale 7>
>>>
>>> 09:44:37.499210 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack
>>> 2427650415 win 115 <nop,nop,timestamp 732355 1042489571>
>>>
>>> 09:44:37.500931 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack 35 win
>>> 115 <nop,nop,timestamp 732355 1042489573>
>>>
>>> 09:44:37.523867 IP 128.2.20.71.34638 > 128.2.8.214.21: P 0:16(16) a=
ck
>>> 35 win 115 <nop,nop,timestamp 732357 1042489573>
>>> 09:44:37.525707 IP 128.2.20.71.34638 > 128.2.8.214.21: P 16:42(26) =
ack
>>> 69 win 115 <nop,nop,timestamp 732357 1042489596>
>>> 09:44:40.469622 IP 128.2.20.71.34638 > 128.2.8.214.21: F 42:42(0) a=
ck
>>> 91 win 115 <nop,nop,timestamp 732652 1042492541>
>>>
>>> there is ack TCP! and it's work!
>>>
>>> How can I access my ip outside 200.247.222.1 from my inside network=
 ??
>>> what is missing in my rules. pay attention in bond0 ( bind eth0 and
>>> eth1 ) maybe it's the problem ?
>>>
>>>
>>>
>>> thanks
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> The Firewall is a Red-Hat
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>> --
>> Paulo Ricardo Bruck
>> Consultor Linux
>> cel 011 9235-4327 tel 011 3596-4881/4882
>> http://www.contatogs.com.br
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
