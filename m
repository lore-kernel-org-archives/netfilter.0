From: "Nick" <nicholas@3wsi.net>
Subject: Re:Netbios routing ?  WAS : how to interconnect two private network
Date: Tue, 3 Dec 2002 22:29:46 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1398.202.153.225.221.1038929386.squirrel@webmail.3wsi.com>
References: <200212030913.02744.michel.guilhem@cp.finances.gouv.fr>
        <1038921285.8905.9.camel@elendil.intranet.cartel-securite.net>
Reply-To: nicholas@3wsi.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038921285.8905.9.camel@elendil.intranet.cartel-securite.net>
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
To: blancher@cartel-securite.fr
Cc: michel.guilhem@cp.finances.gouv.fr, netfilter@lists.netfilter.org

I think I got similar problem, but
this involve netbios as well I guess...
I'm still not sure since I rarely seen
implementation examples of patched iptables widely.

I got this client on 10.0.3.1 ( eth1 =3D 10.0.0.11 )
whom needs to print to 192.168.2.15 ( eth2 =3D 192.168.2.1 )

Their gateway interfaces is on the same box with 4 interface :
- 10.0.0.11 (eth1)
- 192.168.2.1 (eth2)
- 10.0.10.1 (eth3)
- inet interface (eth0)

can NETMAP provide this kind of ability as well ?







Cedric Blancher said:
> Le mar 03/12/2002 =E0 10:13, GUILHEM Michel (34) a =E9crit :
> [...]
>> I want trying to do this the following rule
>> iptables -t nat -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth0 -j SNAT
>> --to  source 154.0.0.0/255.0.0.0
>> But i am not sure , is my probleme solvable by a combination of
>> iptables , nat  and route ?
>
> I do not think DNAT will work until you specify a DNAT rule per client
> (i.e. static DNAT).
>
> You can use patch-o-matic NETMAP target that is almost what you exactly
> want :
>
> 	http://www.netfilter.org/documentation/pomlist/pom-base.html#NETMAP
>
> NETMAP target just alters network part of IP, letting host part
> unmodified. It can provide both DNAT and SNAT if respectively used in
> PREROUTING or POSTROUTING.
>
> --
> C=E9dric Blancher  <blancher@cartel-securite.fr>
> IT systems and networks security expert  - Cartel S=E9curit=E9
> Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
> PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


------------------------------------------
You will know that your tent is secure;
you will take stock of your property
and find nothing missing.

Job 5:24 (NIV)



