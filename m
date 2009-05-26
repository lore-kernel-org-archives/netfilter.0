From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Re: access problem
Date: Tue, 26 May 2009 10:20:17 -0300
Message-ID: <4A1BEC91.1080305@veltrac.com.br>
References: <49BFDC9B.7080602@veltrac.com.br> <49C0DA48.8030701@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49C0DA48.8030701@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi again everyone. Sorry for revivin a old topic, but i solved the=20
problem. just did a SNAT. tks for the help anyway.

    -A POSTROUTING -p tcp -m tcp -d 192.168.1.2 --dport 5222 -j SNAT
    --to-source 192.168.1.1


Brian Austin - Standard Universal escreveu:
> spend $10.
>
> register a domain.
>
> use split DNS as described below.
>
> :-)
>
> b
>
>
> Leonardo Carneiro wrote:
>> Hi Paulo,
>>
>> tks for the tip, i already have a internal DNS, but i don't have a=20
>> external one =3D/
>>
>> anyother ideas?
>>
>>
>> paulobruck1 escreveu:
>>> Em Seg, 2009-03-16 =C3=A0s 16:41 -0300, Leonardo Carneiro escreveu:
>>> =20
>>>> Hi everyone.
>>>>    =20
>>>
>>> Hi Leonardo
>>>
>>> =20
>>>> I'm new in the list and hope have a nice time here.
>>>> First of all, sorry about my poor enlgish, i'm from Brasil.
>>>>
>>>>    =20
>>> welcome...80)
>>>
>>>
>>> =20
>>>> I've got a standard scenario with a private network=20
>>>> (192.168.1.0/24) beeing natted by a internet server (192.168.1.1)=20
>>>> running iptables 1.3.0.
>>>>
>>>> In the private network I have a application server (192.168.1.2)=20
>>>> running a service on port 5222. The port is properly forwarded in=20
>>>> internet server, and users across the internet can access the=20
>>>> service through the public IP of the internet server.
>>>>
>>>> Users on the private network can access the service through the=20
>>>> private IP of the server, but cannot access using the public ip.=20
>>>> Accessing using the public ip would be very usefull, since lots of=
=20
>>>> users have notebooks and they access the service inside and outsid=
e=20
>>>> the private network
>>>>
>>>> those are interface infos and the rules forwarding the port to the=
=20
>>>> application server:
>>>> eth0: public IP
>>>> eth1: private network, 192.168.1.1
>>>>
>>>>    =20
>>> If you like your intenal users use this ip, install a Internal DNS =
for
>>> them  and use at your externat ip use a dns too. Example:
>>>
>>> Internal DNS
>>> aplicationsserver  IN A 192.168.1.1
>>>
>>> EXternal DNS
>>> applicationserver IN A XXX.XXX.XXX.XXX
>>>                  ( your public IP that is redirect to 192.168.1.1)
>>>
>>>
>>> Thats all...
>>>
>>>
>>> best regards =20
>>>
>>> =20
>>>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth0=20
>>>> --dport 5222 -j DNAT --to-destination 192.168.1.2
>>>> iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1=20
>>>> --dport 5222 -j ACCEPT
>>>>
>>>> I've done some tests, adding some rules like
>>>>
>>>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1=20
>>>> --dport 5222 -j DNAT --to-destination 192.168.1.2
>>>> iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1=20
>>>> --dport 5222 -j ACCEPT
>>>>
>>>> or just
>>>>
>>>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1=20
>>>> --dport 5222 -j DNAT --to-destination 192.168.1.2
>>>>
>>>> but i just cannot connect using the public ip =3DS
>>>>
>>>> sometimes the server answer the request, but using the private ip,=
=20
>>>> no the public ip requested by the host, and sometimes the server=20
>>>> just not answer the request.
>>>>
>>>> any ideas how can i solve this?
>>>>
>>>> tks in advance.
>>>>
>>>>
>>>> --=20
>>>> To unsubscribe from this list: send the line "unsubscribe=20
>>>> netfilter" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>    =20
>>>
>>>
>>>  =20
>>
>>
>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--=20

*Leonardo de Souza Carneiro*
*Veltrac - Tecnologia em Log=C3=ADstica.*
lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
http://www.veltrac.com.br <http://www.veltrac.com.br/>
/Fone Com.: (43)2105-5601/
/Av. Higien=C3=B3polis 1601 Ed. Eurocenter Sl. 803/
/Londrina- PR/
/Cep: 86015-010/

=09

