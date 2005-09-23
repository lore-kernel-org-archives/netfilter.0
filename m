From: "XouS - Jose R Negreira" <xous@xouslab.com.ar>
Subject: Re: DMZ howto
Date: Fri, 23 Sep 2005 13:08:24 -0300 (ART)
Message-ID: <34297.9824440137$1127491888@news.gmane.org>
References: <BAY102-F19D493D986DF28A492857DAE960@phx.gbl>
Reply-To: xous@xouslab.com.ar
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Well, IMHO you don't need to specify your public IP on the rule.

erase the --d 22.22.22.22 for matching, because all your internet packets
coming here will have that rule. Just try with this:

iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT --to 192.168.1.=
2

So, from now on...whatever goes to 8080, it'll forward to your web server.
(of course, you need another -A FORWARD rule, allowing forwarding!)

on the other hand,
iptables -t nat -A POSTROUTING -s 192.168.1.2 -o eth0  -j MASQUERADE

no matter your current public IP, it'll always mask to 22.22.22.22, and
when your ISP assigns 33.33.33.33, it'll rewrite the source to
33.33.33.33, and so on ;)

regards & Good Luck

PS: my mails aren't going to the list???

_____________________________________________
Jose R. "Xous" Negreira.
PortalJAVA.com.ar - http://www.portalJAVA.com.ar <--  ** new!!! ** :P
XousLAB - http://www.xouslab.com
iptableslinux - http://www.iptableslinux.com
RDP - http://www.relacionesdepareja.com.ar




> I had a look on the NAT Howto , unfortunately explains the concept in
> brief
> therefore im thinking some things to be done
> 1) the Apache will be hosted on 192.168.1.2 (eth2)
> and my dynamic ip is something 22.22.22.22  (eth0)
>
> somehow i declare
> iptables -t nat -A PREROUTING -p tcp --d 22.22.22.22  --dport 8080 -j D=
NAT
> --to 192.168.1.2
>
> -the above line my not beeing correct- so i redirect whatever touches
> 22.22.22.22 to the
> internal 192.168.1.2 threfore conclusion 2 i need a static ip
> or a should never reboot the computer ! right ?
>
> Please clarify
>
> ps i phoned up my ISP they ask 5 pounds per month for static ip
>
>
>>From: "Jos=E9 R. \"Xous\" Negreira"<xous@xouslab.com.ar>
>>To: netfilter@lists.netfilter.org
>>Subject: Re: DMZ howto
>>Date: Thu, 22 Sep 2005 23:47:36 -0300
>>
>>Hi,
>>
>>First of all, technically and strictly speaking...a DMZ is not (always)=
 a
>>subnet. A DMZ is a independent network with a completely different IP
>>ranges.
>>you can have an internal network of 192.168.1.0/24 network, and a DMZ
>>10.1.1.0/24, just to say some example....
>>Possible question: But...may it be a subnet?? Yes! of course...but it's
>> not
>>a must!
>>
>>
>>Your question:
>>My  ISP assigns me  a dynamic ip , therefore, is that a limitation
>>that could not allow me to develop the dmz subnet ?
>>
>>short answer:
>>No, there's no limitation, AFAIK
>>
>>long answer:
>>So now you have some doubts about the IP assigments huh?. Well...first =
of
>>all, put the DMZ concept aside. Just to clarify concepts...I tell you
>> more,
>>it shouldn't bother too much this!
>>
>>You want to publish a web server, and the problem is how people outside
>>reach to your web server.
>>If you have a static IP, there's no problem. People will reach you by
>>typing http://xx.xx.xx.xx in the browser, being the xx.xx.. your IP
>>address. But...that means that you have a web server INSTALLED on the
>>firewall.... too bad. You want to have it on another machine, right?
>>
>>You will have a public IP, it doesn't matter if it's static or dynamic.
>> In
>>both cases, you'll want to use FORWARDING, and NAT (Network Address
>>Translation), and that's now actually your real problem. What you do is
>>simply 'touching' each packet header that traverses on the firewall, an=
d
>>redirecting wherever *you* want.
>>
>>Suppose that you have not one machine, but 3 webservers, but... Oh My
>> god,
>>you have only one IP!!  Well, using NAT, you can (for example) let peop=
le
>>access to each webserver by typing:
>>http://xx.xx.xx.xx:80 (redirect to serverA, port 80)
>>http://xx.xx.xx.xx:81 (redirect to serverB, port 80)
>>http://xx.xx.xx.xx:82 (redirect to serverC, port 80)
>>
>>How to do NAT? The answer is on the question: (Recommended reading - NA=
T
>>HOWTO)
>>
>>So, as you can see, your network(s) on the outside, is reduced to only
>> one
>>host (the firewall), behind it, it doesn't matter if it is just the
>>firewall itself, a small network, one small network, one big network,
>>or..... two or more *networks* (yes, you can return DMZ concept here!)!=
!.
>>From the outside, it's transparent!!
>>
>>Well, re-reading this answer, it seemed to me like a big "concept salad=
",
>>but... tryied a shot, hope it helped a bit! :)
>>And good luck!
>>
>>Regards
>>
>>--
>>_____________________________________________
>>Jose R. "Xous" Negreira.
>>PortalJAVA.com.ar - http://www.portalJAVA.com.ar <--  ** new!!! ** :P
>>XousLAB - http://www.xouslab.com
>>iptableslinux - http://www.iptableslinux.com
>>RDP - http://www.relacionesdepareja.com.ar
>>
>>
>>
>>P theodorou escribi=F3:
>>
>>>
>>>
>>>
>>>Thank all of you for the replies,
>>>
>>>i have now a good understanding of
>>>the subject but before proceed  into building the dmz subnet i need
>>>to ask something :
>>>
>>>My  ISP assigns me  a dynamic ip , therefore, is that a limitation
>>>that could not allow me to develop the dmz subnet ?
>>>
>>>Is that correct or inacurrate ? Visitors shall need to type my ip to
>>>access my webpage,  but what im interesting is the development
>>>of the firewall itselfin terms of securing a network . It will never b=
e
>>>used for real casesit is just for me to understand.
>>>the script that i have suggesetd uses static ip
>>>
>>># 1.1 Internet Configuration.
>>>#
>>>INET_IP=3D"194.236.50.152"
>>>HTTP_IP=3D"194.236.50.153"
>>>DNS_IP=3D"194.236.50.154"
>>>INET_IFACE=3D"eth0"
>>>So,
>>>Can i develop dmz subnet without static ip   and dmz'ed services
>>>to be accessed on the Internet?
>>>
>>>Regards
>>>
>>>
>>>
>>
>>
>>
>>
>
>
>





