From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: ICQ port
Date: Fri, 14 Feb 2003 10:14:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302141014140.8408-100000@grignard.amagerkollegiet.dk>
References: <20030211180922.GA2856@gravadora.milenium>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030211180922.GA2856@gravadora.milenium>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: serjao@gravadora.milenium
Cc: netfilter@lists.netfilter.org

On Tue, 11 Feb 2003 serjao@gravadora.milenium wrote:

> I'm trying to allow my net users to use ICQ, but I didnt found what is th=
e port that ICQ uses.

5190/tcp.

> Also, I've heard that DCC file transfers will not work. Is it true? Isnt =
any way to make it work?

Load the IRC Connection tracking module (and the IRC NAT modules if
you use NAT) and allow RELATED and ESTABLISHED traffic; DCC will now go
through smoothly.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Is it safe?
Yes, it is perfectly safe - it is us, that are in trouble!
         - Hitch Hikers Guide to the Galaxy, Douglas Adams
----------------------------------[ moffe at amagerkollegiet dot dk ] --


