From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 12:49:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111249.53924.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212091558.22457.roy@karlsbakk.net> <1039447047.25961.47.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039447047.25961.47.camel@tux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

> > I've tried all the ones I can find.
> > When trying to apply the pptp-conntrack-nat.patch, I get errors apply=
ing
> > it. Do I need to hand patch this thing? I've tried with 2.4.{18,19,20=
}
>
> Did you run './runme pending' first like the documentation tells you?

yes. I get this error message when trying to patch 2.4.{19|20}.=20

Testing... pptp-conntrack-nat.patch NOT APPLIED ( 8 missing files)
The extra/pptp-conntrack-nat patch:
   Author: Harald Welte <laforge@gnumonks.org>
   Status: Beta

   This adds CONFIG_IP_NF_PPTP:
   Connection tracking and NAT support for PPTP.

   Note that this code currently has limitations
   - can only NAT connections from PNS to PAC
   - doesnt' support multiple calls within one session

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?]

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


