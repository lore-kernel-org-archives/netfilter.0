From: Jason Opperisano <opie@817west.com>
Subject: Re: question about --tcp-flags
Date: Thu, 02 Dec 2004 18:57:39 -0500
Message-ID: <1102031859.3217.12.camel@hubcap.ljm.dom>
References: <41AF9255.4040408@lopsch.com>
	<20041202231155.GA6712@bender.817west.com>	<41AF9865.2090401@lopsch.com>
	<1102028933.3217.2.camel@hubcap.ljm.dom> <41AFA8C0.4010006@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41AFA8C0.4010006@lopsch.com>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-12-02 at 18:44, Lopsch wrote:
> Yes I know but the manpages don=C2=B4t work here don=C2=B4t know why.

you may want to look into that...

> Hmm but then=20
> it=C2=B4s better to explicit drop packets like ... --tcp-flags SYN,FIN=20
> SYN,FIN before using a line like this ... --syn -m state --state NEW ..=
.=20
> because this would also allow the usage of SYN,FIN for new connections.

yeah--if you want to drop flag combinations, you would normally do that
first, before accepting any connections.
=20
> And that=C2=B4s not a legal set. Or isn=C2=B4t it necessary to drop tho=
se packets=20
> because TCP will take care of that and send RST for them?

no.  the point is not to allow TCP to do its thing--that's how scanners
like nmap work, by processing a host's response to weird flag
combinations...

-j

--
"When I grow up, I'm going to Bovine University!"
	--The Simpsons


