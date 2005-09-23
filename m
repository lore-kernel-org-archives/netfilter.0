From: =?ISO-8859-1?Q?=22Jos=E9_R=2E_=5C=22Xous=5C=22_Negreira=22?=
	<xous@xouslab.com.ar>
Subject: Re: DMZ howto
Date: Thu, 22 Sep 2005 23:47:36 -0300
Message-ID: <43336CC8.3060409@xouslab.com.ar>
References: <BAY102-F29D9416051B9CA35CFD107AE970@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F29D9416051B9CA35CFD107AE970@phx.gbl>
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

Hi,

First of all, technically and strictly speaking...a DMZ is not (always)=20
a subnet. A DMZ is a independent network with a completely different IP=20
ranges.
you can have an internal network of 192.168.1.0/24 network, and a DMZ=20
10.1.1.0/24, just to say some example....
Possible question: But...may it be a subnet?? Yes! of course...but it's=20
not a must!


Your question:
My  ISP assigns me  a dynamic ip , therefore, is that a limitation
that could not allow me to develop the dmz subnet ?

short answer:
No, there's no limitation, AFAIK

long answer:
So now you have some doubts about the IP assigments huh?. Well...first=20
of all, put the DMZ concept aside. Just to clarify concepts...I tell you=20
more, it shouldn't bother too much this!

You want to publish a web server, and the problem is how people outside=20
reach to your web server.
If you have a static IP, there's no problem. People will reach you by=20
typing http://xx.xx.xx.xx in the browser, being the xx.xx.. your IP=20
address. But...that means that you have a web server INSTALLED on the=20
firewall.... too bad. You want to have it on another machine, right?

You will have a public IP, it doesn't matter if it's static or dynamic.=20
In both cases, you'll want to use FORWARDING, and NAT (Network Address=20
Translation), and that's now actually your real problem. What you do is=20
simply 'touching' each packet header that traverses on the firewall, and=20
redirecting wherever *you* want.

Suppose that you have not one machine, but 3 webservers, but... Oh My=20
god, you have only one IP!!  Well, using NAT, you can (for example) let=20
people access to each webserver by typing:
http://xx.xx.xx.xx:80 (redirect to serverA, port 80)
http://xx.xx.xx.xx:81 (redirect to serverB, port 80)
http://xx.xx.xx.xx:82 (redirect to serverC, port 80)

How to do NAT? The answer is on the question: (Recommended reading - NAT=20
HOWTO)

So, as you can see, your network(s) on the outside, is reduced to only=20
one host (the firewall), behind it, it doesn't matter if it is just the=20
firewall itself, a small network, one small network, one big network,=20
or..... two or more *networks* (yes, you can return DMZ concept=20
here!)!!. From the outside, it's transparent!!

Well, re-reading this answer, it seemed to me like a big "concept=20
salad", but... tryied a shot, hope it helped a bit! :)
And good luck!

Regards

--=20
_____________________________________________
Jose R. "Xous" Negreira.
PortalJAVA.com.ar - http://www.portalJAVA.com.ar <--  ** new!!! ** :P
XousLAB - http://www.xouslab.com
iptableslinux - http://www.iptableslinux.com
RDP - http://www.relacionesdepareja.com.ar



P theodorou escribi=F3:

>
>
>
> Thank all of you for the replies,
>
> i have now a good understanding of
> the subject but before proceed  into building the dmz subnet i need
> to ask something :
>
> My  ISP assigns me  a dynamic ip , therefore, is that a limitation
> that could not allow me to develop the dmz subnet ?
>
> Is that correct or inacurrate ? Visitors shall need to type my ip to
> access my webpage,  but what im interesting is the development
> of the firewall itselfin terms of securing a network . It will never be
> used for real casesit is just for me to understand.
> the script that i have suggesetd uses static ip
>
> # 1.1 Internet Configuration.
> #
> INET_IP=3D"194.236.50.152"
> HTTP_IP=3D"194.236.50.153"
> DNS_IP=3D"194.236.50.154"
> INET_IFACE=3D"eth0"
> So,
> Can i develop dmz subnet without static ip   and dmz'ed services
> to be accessed on the Internet?
>
> Regards
>
>
>




