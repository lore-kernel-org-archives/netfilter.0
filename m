From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: ip_conntrack: table full, dropping packet. - Anyone?????
 Frustrating!
Date: Mon, 3 Jun 2002 23:34:32 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206032333160.13191-100000@grignard>
References: <4884.24.168.132.35.1023124727.squirrel@mail.vistawiz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <4884.24.168.132.35.1023124727.squirrel@mail.vistawiz.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Shazad Malik <smalik@vistawiz.com>
Cc: nickd@funkyjesus.org, netfilter@lists.samba.org

On Mon, 3 Jun 2002, Shazad Malik wrote:

> Jun  3 08:03:28 new kernel: ip_conntrack: table full, dropping packet.

> Seriously, I going beserk now!  I just have two machine sitting behind my
> test box and just one user(thats me!). All I'm doing is surfing the web.
> Dont have a clue why its happening!

Perhaps you need a larger conntrack table?

echo 32768 > /proc/sys/net/ipv4/ip_conntrack_max

Be aware, that this could use a lot of memory (I don't remember how
much).

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
He who asks a question is a fool for five minutes; he who does not ask a
question remains a fool forever.
----------------------------------[ moffe at amagerkollegiet dot dk ] --


