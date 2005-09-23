From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DMZ howto
Date: Fri, 23 Sep 2005 18:00:15 +0200
Message-ID: <4334268F.7030207@mnemon.de>
References: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

P theodorou wrote:
> I had a look on the NAT Howto , unfortunately explains the concept in b=
rief
> therefore im thinking some things to be done
> 1) the Apache will be hosted on 192.168.1.2 (eth2)
> and my dynamic ip is something 22.22.22.22  (eth0)
>=20
> somehow i declare
> iptables -t nat -A PREROUTING -p tcp --d 22.22.22.22  --dport 8080 -j=20
> DNAT --to 192.168.1.2
>=20
> -the above line my not beeing correct- so i redirect whatever touches=20
> 22.22.22.22 to the
> internal 192.168.1.2 threfore conclusion 2 i need a static ip
> or a should never reboot the computer ! right ?

Not necessarily. There are some options.

1.) Instead of DNATing everything that is destined for
     22.22.22.22 to the other box - which (if i understand
     correctly) means every port -, you could DNAT everything
     that is destined to port 8080 to the other box. This means
     omitting -d 22.22.22.22. And at the very minimum, you
     must SNAT everything that leaves the box towards the internet.
     You can add the incoming interface, like -i ppp0.
2.) Register with DynDNS or the like. Then write your rule like this:
     ... -p tcp --dport 8080 -d dyndns.name.tld ...
     Do an iptables-save and every time your IP changes do
     an iptables-restore. You may like to write a script.
3.) Other things that may come to mind :)

HTH,

Joerg


> Please clarify
>=20
> ps i phoned up my ISP they ask 5 pounds per month for static ip
>=20
>=20
>> From: "Jos=E9 R. \"Xous\" Negreira"<xous@xouslab.com.ar>
>> To: netfilter@lists.netfilter.org
>> Subject: Re: DMZ howto
>> Date: Thu, 22 Sep 2005 23:47:36 -0300
>>
>> Hi,
>>
>> First of all, technically and strictly speaking...a DMZ is not=20
>> (always) a subnet. A DMZ is a independent network with a completely=20
>> different IP ranges.
>> you can have an internal network of 192.168.1.0/24 network, and a DMZ=20
>> 10.1.1.0/24, just to say some example....
>> Possible question: But...may it be a subnet?? Yes! of course...but=20
>> it's not a must!
>>
>>
>> Your question:
>> My  ISP assigns me  a dynamic ip , therefore, is that a limitation
>> that could not allow me to develop the dmz subnet ?
>>
>> short answer:
>> No, there's no limitation, AFAIK
>>
>> long answer:
>> So now you have some doubts about the IP assigments huh?. Well...first=
=20
>> of all, put the DMZ concept aside. Just to clarify concepts...I tell=20
>> you more, it shouldn't bother too much this!
>>
>> You want to publish a web server, and the problem is how people=20
>> outside reach to your web server.
>> If you have a static IP, there's no problem. People will reach you by=20
>> typing http://xx.xx.xx.xx in the browser, being the xx.xx.. your IP=20
>> address. But...that means that you have a web server INSTALLED on the=20
>> firewall.... too bad. You want to have it on another machine, right?
>>
>> You will have a public IP, it doesn't matter if it's static or=20
>> dynamic. In both cases, you'll want to use FORWARDING, and NAT=20
>> (Network Address Translation), and that's now actually your real=20
>> problem. What you do is simply 'touching' each packet header that=20
>> traverses on the firewall, and redirecting wherever *you* want.
>>
>> Suppose that you have not one machine, but 3 webservers, but... Oh My=20
>> god, you have only one IP!!  Well, using NAT, you can (for example)=20
>> let people access to each webserver by typing:
>> http://xx.xx.xx.xx:80 (redirect to serverA, port 80)
>> http://xx.xx.xx.xx:81 (redirect to serverB, port 80)
>> http://xx.xx.xx.xx:82 (redirect to serverC, port 80)
>>
>> How to do NAT? The answer is on the question: (Recommended reading -=20
>> NAT HOWTO)
>>
>> So, as you can see, your network(s) on the outside, is reduced to only=
=20
>> one host (the firewall), behind it, it doesn't matter if it is just=20
>> the firewall itself, a small network, one small network, one big=20
>> network, or..... two or more *networks* (yes, you can return DMZ=20
>> concept here!)!!. From the outside, it's transparent!!
>>
>> Well, re-reading this answer, it seemed to me like a big "concept=20
>> salad", but... tryied a shot, hope it helped a bit! :)
>> And good luck!
>>
>> Regards
>>
>> --=20
>> _____________________________________________
>> Jose R. "Xous" Negreira.
>> PortalJAVA.com.ar - http://www.portalJAVA.com.ar <--  ** new!!! ** :P
>> XousLAB - http://www.xouslab.com
>> iptableslinux - http://www.iptableslinux.com
>> RDP - http://www.relacionesdepareja.com.ar
>>
>>
>>
>> P theodorou escribi=F3:
>>
>>>
>>>
>>>
>>> Thank all of you for the replies,
>>>
>>> i have now a good understanding of
>>> the subject but before proceed  into building the dmz subnet i need
>>> to ask something :
>>>
>>> My  ISP assigns me  a dynamic ip , therefore, is that a limitation
>>> that could not allow me to develop the dmz subnet ?
>>>
>>> Is that correct or inacurrate ? Visitors shall need to type my ip to
>>> access my webpage,  but what im interesting is the development
>>> of the firewall itselfin terms of securing a network . It will never =
be
>>> used for real casesit is just for me to understand.
>>> the script that i have suggesetd uses static ip
>>>
>>> # 1.1 Internet Configuration.
>>> #
>>> INET_IP=3D"194.236.50.152"
>>> HTTP_IP=3D"194.236.50.153"
>>> DNS_IP=3D"194.236.50.154"
>>> INET_IFACE=3D"eth0"
>>> So,
>>> Can i develop dmz subnet without static ip   and dmz'ed services
>>> to be accessed on the Internet?
>>>
>>> Regards
>>>
>>>
>>>
>>
>>
>>
>>
>=20
>=20
>=20
>=20
> !DSPAM:43341f9e132561420745226!


--=20
-----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Niederkastenholzerstr. 24a
53881 Euskirchen

Tel.: (+49) 22 55 9 48 78 22
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
-----------------------------------------------------------------------
English version below.

Aufgrund massiven SPAM Aufkommens, werden Mails, die unser SPAM
Filter als SPAM einstuft, automatisch gel=F6scht. Falls Ihre Mail
f=E4lschlicherweise als SPAM eingestuft wurde, senden Sie bitte eine
Email mit "No-Spam:" im Betreff.

Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

Due to massive SPAM, all mails our content filter classifies as SPAM,
are discarded silently. If you mail was classified as SPAM by mistake,
please send an email with "No-Spam:" within the subject.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
-----------------------------------------------------------------------



