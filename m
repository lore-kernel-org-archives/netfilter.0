From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Upper limit of users for iptables firewall
Date: 16 Oct 2004 14:29:43 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097856872.31365.22.camel@nostromo.bgsecm.com>
References: <20041015054725.8539.qmail@web60403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041015054725.8539.qmail@web60403.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

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

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


