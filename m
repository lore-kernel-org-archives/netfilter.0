From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: h323
Date: Fri, 14 Feb 2003 10:17:02 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302141014560.8408-100000@grignard.amagerkollegiet.dk>
References: <1045148962.18435.31.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045148962.18435.31.camel@debian>
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
To: Esteban Ribicic <eribicic@UolSinectis.com>
Cc: netfilter@lists.netfilter.org

On 13 Feb 2003, Esteban Ribicic wrote:

> ive got a network masqueraded by iptables to internet.
> my clients (the one who are masqueraded) ask me for neetmeting and h323
> stuff that does not work....does the h323 module for iptables permit
> such transmissions?

H.323 (including netmeeting) will work fine with the H323 modules.

You cannot, however, use call servers (I don't remember, what they're
called) along with NAT.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
"Microsoft spel chekar worgs grate!"
----------------------------------[ moffe at amagerkollegiet dot dk ] --



