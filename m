From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Programming without using iptables
Date: Wed, 30 Mar 2005 10:07:28 +0200
Message-ID: <1112170048.7456.9.camel@nostromo.bgsecm.com>
References: <20050330024432.21809.qmail@web41728.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050330024432.21809.qmail@web41728.mail.yahoo.com>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mar, 29-03-2005 a las 18:44 -0800, Suchitra H escribi=C3=B3:
> Hi Everyone ,
>                          I am working on a firewall project , where I n=
eed to replace the iptables part ( which is complicated ) with my own cod=
e ( hopefully it will be simpler ) , making use of libiptc. The whole ide=
a is to program as though iptables dosent exist and write my own code whi=
ch is capable of performing all the commands and output the desired resul=
ts.  I have been able to do so for listing the chains , policy and counte=
rs. Now I want to set the policy for a built-in chain.  Is it possible to=
 do so using libiptc ? Or is there any other altrenative to this???
>                  Not able to find any suitable resource on the net. Jus=
t one - Querying libiptc - HOWTO , which has been of great help but is ve=
ry limited.=20
>                   Any suggestions , solutions to the above problem woul=
d be of great help!=20
> =20
> Suchitra.

I'd like to advise you that the Querying libiptc HOWTO has a big
error in it's examples, that makes the programas allocate memory
and then not free it. So the programs get bigger and bigger in
memory and you get a DOS.

We discovered this when we wrote the bastion-firewall-stats
daemon, that uses libiptc to read the iptables counters.

We sent an email to the author of the HOWTO but we have not
received any response and the HOWTO it's still untouched.

The trick it's that you have to free the memory after reading
the counters, so the code it's something like:

      if ( !(h =3D iptc_init(tablename)) )  {
         syslog(LOG_INFO,"bfs error initializing: %s\n", iptc_strerror
(errno))
         exit(errno);
      }

That allocates memory. And then:

      iptc_free(&h);

To free the memory. This line it's the one not included in the
HOWTO.

If you want you can download our GPL code at:
http://www.bgsec.com/downloads.html

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



