From: =?UTF-8?B?UmVtemkgQUtZw5xa?= <linuxliste@gmail.com>
Subject: Re: how to access port forwarded server through internet ?
Date: Wed, 16 Mar 2011 09:33:02 +0200
Message-ID: <4D8067AE.5050609@gmail.com>
References: <20110315175928.4dbbe83c@debian>	<4D7F66A2.1080804@gmail.com>	<20110315192201.7b139b3f@debian> <20110316125003.47cb0bad@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Pasrp+PyDzqohx8iWH3g9ztKR/C4+Z7VGwdrkymnv+g=;
        b=N3NgxAwwJJjf5BDStPPh2i17/TKDgIngVzxwLJGNFu+auvR76y8OpdjAB3vJv4tZUS
         QbIm/ooKwn2am2eskKgYrxC4XwKYrjYEJhOwzE1mM6y3iy0Bu6yrfT3d+6aKwhbBx6b1
         W6gesjUXbFDbH3eGLu6UMzvnvBD8M773/YdxM=
In-Reply-To: <20110316125003.47cb0bad@debian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Bakshi;

input interface maybe invalid.
can you try this;

iptables -t nat -I PREROUTING -i wan_intarface  -p tcp --dport 81 -j=20
DNAT --to 192.168.1.2:8080

iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dport 81 =
-i wan_intarface -j ACCEPT

if this is failure, can you send  yours active iptables rules ? (iptabl=
es-save>  ipt_gw.txt )




On 03/16/2011 09:20 AM, J. Bakshi wrote:
> Any clue please ?
>
>
> On Tue, 15 Mar 2011 19:22:01 +0530
> "J. Bakshi"<joydeep@infoservices.in>  wrote:
>
>> Hello Remzi,
>>
>> Thanks for your kind response. Yes the forwarding is enable as I hav=
e it in my script
>>
>> `````````````````
>> echo 1>   /proc/sys/net/ipv4/ip_forward
>> `````````````````````
>>
>> But no luck :-( here is the modified rule
>>
>> iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
>> iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j D=
NAT --to 192.168.1.2:8080
>> iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dport =
81 -i ${LAN_IFACE} -j ACCEPT
>>
>>
>> On Tue, 15 Mar 2011 15:16:18 +0200
>> Remzi AKY=C3=9CZ<linuxliste@gmail.com>  wrote:
>>
>>> Hello,
>>> forwarding is enable?
>>> can you try this;
>>>
>>> #sysctl -w net.ipv4.ip_forward=3D1
>>> #iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dpor=
t 81
>>> -i ${LAN_IFACE} -j ACCEPT
>>>
>>>
>>> On 03/15/2011 02:29 PM, J. Bakshi wrote:
>>>> Dear list,
>>>>
>>>> Here is a port forwarding issue.  I have a linux router which have=
 two NIC; one facing WAN and the other facing LAN. IP forwarding is act=
ive and this box is working as a gateway. This box has LAN IP 192.168.1=
=2E1
>>>>
>>>> There is another box (webserver) 192.168.1.2 within the internal n=
etwork and the router box has port forwarding to access the webserver.
>>>>
>>>> ```````````````````````````
>>>> iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
>>>> iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j=
 DNAT --to 192.168.1.2:8080
>>>> iptables -A FORWARD -p tcp -m state --state NEW --dport 81 -i ${LA=
N_IFACE} -j ACCEPT
>>>> ````````````````````````````
>>>>
>>>> So within LAN I can access the 192.168.1.2 web server through  192=
=2E168.1.1:81 as port forwarding is there. But I can not access the sam=
e through internet. If I point at<domain-name>:81 throught internet ; t=
he browser simply reports it can't connect to the service; though the o=
ther services running at that very server are quite accessible through =
internet. Have I missed something in my firewall rule ? Could anyone gi=
ve any clue please ?
>>>>
>>>> Thanks
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

