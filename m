From: "E-GIM Security" <security@e-gim.es>
Subject: RE: Iptables and various domains
Date: Thu, 12 Dec 2002 09:34:29 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEBBKLENIBMGHGCLGBPIIEBLCDAA.security@e-gim.es>
References: <1039680872.4125.30.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039680872.4125.30.camel@rayw.knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: raymondl@knowledgefactory.co.za

Thanks Raymond:

My domains are virtually hosted. Problems is the next: We have various apps
in IIS-Windows and ASP technologic. Future developments we need will be
hosted on Linux with Apache+Tomcat. But, we only use one IP number. Do you
know another solution?

Thanks a lot

> -----Mensaje original-----
> De: Raymond Leach [mailto:raymondl@knowledgefactory.co.za]
> Enviado el: jueves, 12 de diciembre de 2002 8:15
> Para: E-GIM Security
> CC: Netfilter Mailing List
> Asunto: Re: Iptables and various domains
>
>
> Hi
>
> Yes and maybe no. If your domains are virtually hosted (they resolve to
> the same ip numbers) then no. iptables cannot redirect traffic in this
> case - it uses ip numbers. You would need to use something like Apache
> virtual hosting and possibly redirect pages to accomplish your goal in
> this case.
>
> If your domains resolve to different ip numbers, then iptables can be
> your solution:
>
> iptables -t nat -A PREROUTING -d www.dom1.com -p tcp --dport 80 -j
> REDIRECT --to-destination webserver-1:80
> iptables -t nat -A PREROUTING -d www.dom2.com -p tcp --dport 80 -j
> REDIRECT --to-destination webserver-1:80
> iptables -t nat -A PREROUTING -d www.dom3.com -p tcp --dport 80 -j
> REDIRECT --to-destination webserver-2:80
> iptables -t nat -A PREROUTING -d www.dom4.com -p tcp --dport 80 -j
> REDIRECT --to-destination webserver-2:80
>
> Remember, to use iptables like above, www.dom1.com, www.dom2.com,
> www.dom3.com, www.dom4.com must resolve to different ip numbers.
>
> Ray
>
>
> On Thu, 2002-12-12 at 10:58, E-GIM Security wrote:
> > 	Hi,
> >
> > 	Can Iptables route by domains? For example, I have a
> webserver and my
> > firewall with iptables route all request on port 80 throw IP
> webserver. I
> > need add another webserver, and various domains (www.dom1.com,
www.dom2.com)
> will be redirect to webserver-1 and other domains (www.dom3.com,
> www.dom4.com) will be redirect to webserver-2. Can IPTables help me? Which
> is the solution)
>
> 	Thanks and sorry ... my english is very poor.
>
> Jos=E9 Antonio Garc=EDa Garc=EDa
> Technical Internet Solutions
>
> E-GIM 	+34 952700010
> http://www.e-gim.es
>
--
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/


