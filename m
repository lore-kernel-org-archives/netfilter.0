From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Upper limit of users for iptables firewall
Date: Mon, 18 Oct 2004 09:17:29 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E1707CC@FSNSAB30>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: 'Jose Maria Lopez' <jkerouac@bgsec.com>, ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

jose,


processing acls is not  afunction of how many but how deep thru the =
list
before  we get  a match and how the firewall internals address usage
of horse power - this is NOT bandwidth issue at all.


acl building  is an art that born out of a combination of
1.	blocking known badstuff.
2. 	placing 'noisy' allowed protocols near top to not thrash.
3.	blocking ALL un needed traffic EARLY in the acl.
4. 	pro-actively monitoring and profile bulding to fine-tune the acls.

this is why i suggest that firewalls, routers, servers and clients be
separated
whenever finances and layer 8 of the OSI allow it.

btw,,,,layer 8 relates to finance/marketing/politics, if one is =
hindered by
this
then they have my sympathies as this is usually what allows intruders
access
more than any other single componenet.

~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jose Maria
Lopez
Sent: Saturday, October 16, 2004 5:30 AM
To: ads nat
Cc: netfilter@lists.netfilter.org
Subject: Re: Upper limit of users for iptables firewall


El vie, 15 de 10 de 2004 a las 07:47, ads nat escribi=C3=B3:
> hi,
> I am having 512 Mbps bandwidth. Users are mainly
> browsing Web and using email facility. I am using
> squid for cache. I have about 10 % cache so i think
> total upper bandwidth availability will be aroung 600
> Kbps. Bandwidthwise there is no problem. My worry is
> if iptables processing for 400 users with various acl
> s should not slow down firwall processing due to
> hardware configuration.
> Thanks for support.

In my experience you should not have any problem to
manage that number of users even if you have a huge
number of rules with your machine. But you can always
make some tests to see if the machine slows down, but
I think it should be ok.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to =
live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, =
burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


