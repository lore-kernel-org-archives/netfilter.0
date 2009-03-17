From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Re: access problem
Date: Tue, 17 Mar 2009 14:23:39 -0300
Message-ID: <49BFDC9B.7080602@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi Paulo,

tks for the tip, i already have a internal DNS, but i don't have a=20
external one =3D/

anyother ideas?


paulobruck1 escreveu:
> Em Seg, 2009-03-16 =C3=A0s 16:41 -0300, Leonardo Carneiro escreveu:
>  =20
>> Hi everyone.
>>    =20
>
> Hi Leonardo
>
>  =20
>> I'm new in the list and hope have a nice time here.
>> First of all, sorry about my poor enlgish, i'm from Brasil.
>>
>>    =20
> welcome...80)
>
>
>  =20
>> I've got a standard scenario with a private network (192.168.1.0/24)=
=20
>> beeing natted by a internet server (192.168.1.1) running iptables 1.=
3.0.
>>
>> In the private network I have a application server (192.168.1.2) run=
ning=20
>> a service on port 5222. The port is properly forwarded in internet=20
>> server, and users across the internet can access the service through=
 the=20
>> public IP of the internet server.
>>
>> Users on the private network can access the service through the priv=
ate=20
>> IP of the server, but cannot access using the public ip. Accessing u=
sing=20
>> the public ip would be very usefull, since lots of users have notebo=
oks=20
>> and they access the service inside and outside the private network
>>
>> those are interface infos and the rules forwarding the port to the=20
>> application server:
>> eth0: public IP
>> eth1: private network, 192.168.1.1
>>
>>    =20
> If you like your intenal users use this ip, install a Internal DNS fo=
r
> them  and use at your externat ip use a dns too. Example:
>
> Internal DNS
> aplicationsserver  IN A 192.168.1.1
>
> EXternal DNS
> applicationserver IN A XXX.XXX.XXX.XXX
>                  ( your public IP that is redirect to 192.168.1.1)
>
>
> Thats all...
>
>
> best regards=09
>
>
>  =20
>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth0 --dport=
=20
>> 5222 -j DNAT --to-destination 192.168.1.2
>> iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1 --d=
port=20
>> 5222 -j ACCEPT
>>
>> I've done some tests, adding some rules like
>>
>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1 --dport=
=20
>> 5222 -j DNAT --to-destination 192.168.1.2
>> iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1 --d=
port=20
>> 5222 -j ACCEPT
>>
>> or just
>>
>> iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1 --dport=
=20
>> 5222 -j DNAT --to-destination 192.168.1.2
>>
>> but i just cannot connect using the public ip =3DS
>>
>> sometimes the server answer the request, but using the private ip, n=
o=20
>> the public ip requested by the host, and sometimes the server just n=
ot=20
>> answer the request.
>>
>> any ideas how can i solve this?
>>
>> tks in advance.
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    =20
>
>
>  =20



