From: Wim Ceulemans <wim.ceulemans@able.be>
Subject: Re: PPTP port forwarding
Date: Thu, 19 Feb 2004 14:32:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034BAF6.5030508@able.be>
References: <4034A3CF.20307@able.be> <200402191204.57391.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1077197563-25577-42"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402191204.57391.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org, dev@able.be

This is a multi-part message in MIME format...

------------=_1077197563-25577-42
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gwb.able.be id i1JDWgaH032072

Antony

Ok, thanks, but this setup with the NATed router worked with kernel=20
2.2.17, so where is the difference?

Regards
Wim

Antony Stone wrote:

>On Thursday 19 February 2004 11:53 am, Wim Ceulemans wrote:
>
> =20
>
>>Hi
>>
>>We have noticed a problem with PPTP forwarding not working as it should.
>>
>>We have a system on kernel 2.4.24 with latest pom and iptables 1.2.9.
>>There is a port forwarding PPTP to a windows 2000 server behind the
>>firewall.
>>
>>We noticed that when someone connects with PPTP the connection is close=
d
>>after 3 to 4 minutes. This problem only occurs if there is a router in
>>nat mode between the firewall and the internet. If the public ip is on
>>the firewall then this problem does not occur.
>>   =20
>>
>
>You cannot operate PPTP across a NATted connection without a special hel=
per=20
>module (hence your need for pom as stated above).
>
>If the other nat-mode router does not have a suitable helper for PPTP th=
en you=20
>can't use this combination.
>
>Regards,
>
>Antony.
>
> =20
>


--=20
Wim Ceulemans
R&D Engineer

Secure Internet Communication with aXs Guard

aXs GUARD "=E0 la Carte" at Infosecurity
Brussels Kart Expo
10-11 March 2004
stand 1.C.060
FREE registration click here:
http://www.databadge.nl/isbe2004/reg/reg.php?link=3Dd9ca37ba1cb635dc2061

Able NV
Leuvensesteenweg 282 - B-3190 Boortmeerbeek - Belgium
Phone: + 32 15 50.44.00 - Fax: + 32 15 50.44.09
E-mail: wim.ceulemans@able.be


--
---
Security check and anti-virus control on this e-mail has been done by aXs=
 GUARD (http://www.axsguard.com)

------------=_1077197563-25577-42--

