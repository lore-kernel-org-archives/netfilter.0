From: Jason Opperisano <opie@817west.com>
Subject: Re: question about --tcp-flags
Date: Thu, 2 Dec 2004 18:11:55 -0500
Message-ID: <20041202231155.GA6712@bender.817west.com>
References: <41AF9255.4040408@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41AF9255.4040408@lopsch.com>
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

On Thu, Dec 02, 2004 at 11:08:21PM +0100, Lopsch wrote:
> I only want to know how iptables uses this option. For example=20
> --tpc-flags SYN,ACK,RST SYN  how is it then used? Am I right that the=20
> flags SYN,ACK,RST are inspected and only the SYN flag is allowed to be=20
> set?

yes.  "--tcp-flags SYN,ACK,RST SYN" means:

out of the flags SYN, ACK, RST:

  SYN is set
  ACK is not set
  RST is not set

the flags FIN, URG, PSH are not examined and may be either set or not
set.

> Or is it so that SYN,ACK,RST are inspected and the SYN flag must be=20
> set but the other are optional so that all can be set but only SYN has=20
> to be set? I=B4m a little confused :). And another question what flags=20
> cobos are allowed/not allowed. I only know about a few so SYN,RST set i=
s=20
> an illegal set also SYN,FIN. Or SYN,ACK when initiating a connection.

i've seen this list pop up here and there:

  http://www.stearns.org/modwall/sample/tcpchk-sample

seems pretty complete to me.

the most common ones you see people creating DROP rules for are:

  ALL		ALL
  ALL		NONE
  SYN,FIN	SYN,FIN
  ALL		FIN,URG,PSH
  SYN,RST 	SYN,RST
  FIN,RST 	FIN,RST
  FIN,ACK 	FIN

-j

--
"I have been shot eight times this year, and as a result, I almost
 missed work."
        --The Simpsons

