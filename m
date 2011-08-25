From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 11:51:10 +0100
Message-ID: <4E56291E.6000903@tolaris.com>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>	<CAA2qdGXek91jQ0Z7LRzGm4i8WQpp4ruTkqSg9GEf1Yh3UGdn_g@mail.gmail.com> <CA+f1OFpKdobWsnTrf3QhAJPGp=4GvDDAiAwg3x2Zi_Le_N0u6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+f1OFpKdobWsnTrf3QhAJPGp=4GvDDAiAwg3x2Zi_Le_N0u6Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Adishesh M <adisheshsm@gmail.com>
Cc: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

Adishesh,

This is not a netfilter issue. This is an issue with RHEL 6.1, and the =
fact
that it is unloading and reloading the netfilter module when you invoke
"restart".

Instead, just do this:

iptables-restore /etc/sysconfig/iptables

Regards,
Tyler

On 2011-08-25 11:34, Adishesh M wrote:
> Hi,
>=20
> I was doing other tests and come cross this issue.
> we have not observed this issue on fedora 14.  Only in RHEL 6.1 this
> issue is observed.
> Solution for this issue may be available in latest netfiler versions
> but not yet integrated in RHEL 6.
>=20
>=20
> Thanks and regards,
> Adishesh
>=20
>=20
> On Thu, Aug 25, 2011 at 3:45 PM, Pandu Poluan <pandu@poluan.info> wro=
te:
>> Why do you need to restart iptables?
>>
>> iptables is *not* a daemon-based service. It's always on in the
>> kernel. All invocation of the iptables command act *immediately*
>>
>> Rgds,
>>
>>
>> On 2011-08-24, Adishesh M <adisheshsm@gmail.com> wrote:
>>> Hi,
>>> When we insert below rules into the ip tables, ssh sessions are
>>> hanging ( infact all tcp connection are terminated).
>>>
>>> =93iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SY=
N -m
>>> state --state NEW -j DROP=94.
>>>
>>> what is the problem with this above rule. we used this rule to drop
>>> bad tcp packets. when firewall is restarted using "service iptables
>>> restart", ssh sessions are hanging.
>>>
>>>
>>> Rule used for testing.
>>>
>>> ssh session hangs
>>> <set 1>
>>> --------------------------
>>> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -=
m
>>> state --state NEW -j DROP
>>> iptables -A INPUT -d 10.255.13.157 -m state --state
>>> RELATED,ESTABLISHED  -j ACCEPT
>>> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCE=
PT
>>> iptables -A  INPUT -d 10.255.13.157   -j DROP
>>>
>>>
>>> ssh session hangs
>>> <set 2>
>>> ----------------------------
>>> iptables -N TEST_LAN_1
>>> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -=
m
>>> state --state NEW -j DROP
>>> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
>>> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
>>> RELATED,ESTABLISHED  -j ACCEPT
>>> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j=
 ACCEPT
>>> iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP
>>>
>>>
>>>
>>> ssh session does not hang
>>> <set 3>
>>> ---------------------------------------
>>> iptables -N TEST_LAN_1
>>> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
>>> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
>>> RELATED,ESTABLISHED  -j ACCEPT
>>> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j=
 ACCEPT
>>> iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP
>>>
>>>
>>> ssh session does not hang
>>> <set 4>
>>> ---------------------------------------
>>> iptables -A INPUT -d 10.255.13.157 -m state --state
>>> RELATED,ESTABLISHED  -j ACCEPT
>>> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCE=
PT
>>> iptables -A  INPUT -d 10.255.13.157   -j DROP
>>>
>>>
>>> steps to reproduce the this issue
>>> -----------------------------------------------
>>>     iptables -F
>>>     iptables  -X
>>>     <Insert any one set of rules from set 1 or set 2 >
>>>     service ip6tables stop
>>>     service iptables save
>>>     iptables -L -n
>>>     service iptables restart
>>>     iptables -L -n
>>>
>>> Thanks and regards,
>>> Adishesh
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>>
>> --
>> --
>> Pandu E Poluan - IT Optimizer
>> My website: http://pandu.poluan.info/
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
"The bourgeoisie are hated from both ends: by the proles, because they
have all the money, and by the intelligentsia, because of their
tendency to spend it on lawn ornaments."
   -- Neal Stephenson, Cryptonomicon
