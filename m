From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Control Bandwidth by TOS marking
Date: Fri, 01 Sep 2006 10:56:42 -0400
Message-ID: <1157122602.2926.27.camel@localhost>
References: <20060901144525.10883.qmail@web34511.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060901144525.10883.qmail@web34511.mail.mud.yahoo.com>
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
To: =?ISO-8859-1?Q?Andr=E9?= Marques <andre_sesred@yahoo.com.br>
Cc: Lista NetFilter <netfilter@lists.netfilter.org>

On Fri, 2006-09-01 at 14:45 +0000, Andr=C3=A9 Marques wrote:
> Hello to all!
>=20
> I'm trying to implement bandwidth control using TC and
> IPTables, but i'm still having some difficults about
> using the TOS field to implement it.
>=20
> Does anybody knows how can i use the TOS field to makr
> the packets in a way that i when they come and go by
> the net they still remain marked?
>=20
> Any help is appreciated. Thank you very much!
<snip>
If it helps, here is an example used to expedite traffic to a local IP
PBX here:

*mangle
-A OUTPUT -d 192.168.223.5 -p 17 --dport 1024: -j TOS --set-tos
Minimize-Delay
-A INPUT -s 192.168.223.5 -p 17 --sport 1024: -j TOS --set-tos
Minimize-Delay
COMMIT

--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


