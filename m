From: Les Mikesell <les@futuresource.com>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 11:09:14 -0600
Message-ID: <1105549753.3946.28.camel@moola.futuresource.com>
References: <1105537635.3751.22.camel@hubcap.ljm.dom>
	<20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
	<20050112152437.GA17646@bender.817west.com>
	<005c01c4f8c7$0b352870$8b00000a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005c01c4f8c7$0b352870$8b00000a@casa>
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
To: Leonardo Rodrigues =?ISO-8859-1?Q?Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

On Wed, 2005-01-12 at 10:52, Leonardo Rodrigues Magalh=C3=A3es wrote:

>     Well, OK, squid is blocking them. But squid has a 2Gb log file=20
> limitation which, in some cases I experienced, was enough for only 5 ho=
urs=20
> of network traffic loaded with some of these virus/adware/spywares. Aft=
er=20
> 2Gb of logs, squid dies and there it goes http browsing.

I'd be surprised if squid had any internal log limit size.  Was this
on an old system with the 2Gb file limit in the filesystem?  If so,
updating to something current would avoid this problem.  But, if you
can identify the log entries you should probably use something like
swatch to note the source and block it with an iptables entry until
the virus is cleaned.

--=20
  Les Mikesell
    les@futuresource.com



