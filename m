From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: re: ip_conntrack_max vs ip_conntrack
Date: 27 Sep 2004 20:57:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096311443.1079.11.camel@nostromo.bgsecm.com>
References: <561dc32604092710524f3a8b5b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc32604092710524f3a8b5b@mail.gmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 27 de 09 de 2004 a las 19:52, Jiann-Ming Su escribi=C3=B3:
> I'd like to know what some of these proc paremeters mean as well.=20
> What we're experiencing is a SYN flood attack that's filling up the
> connection tables.  What I'd like to do is change the timeout to 5
> seconds, instead of the default 30 seconds.

The ip_conntrack_max parameter is used to set the maximum
entries in the conntrack table that the system can have at
a time. The ip_conntrack is the file that contains the
conntrack table, it lists the IPs and their states.

If you want to limit the SYN flooding you should use the
limit match of iptables, or you can use the TCP SYN cookie
feature of netfilter. It can be activated in
/proc/sys/net/ipv4/tcp_syncookies

For the limit match look at:
iptables -m limit --help

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


