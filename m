From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Filtering in the nat table - opinions wanted
Date: Mon, 24 Mar 2003 20:32:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303242032.10758.kimj@dawn.dk>
References: <003501c2f232$1c0a5140$6d64a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003501c2f232$1c0a5140$6d64a8c0@discmail.com>
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
To: Aldo Lagana <alagana@discmail.com>
Cc: netfilter@lists.netfilter.org

Hi Aldo,

You shouldn't drop packets in the prerouting part, use the filtering part=
 to=20
do this. in the pre/post routing you should just try to keep things clean=
=2E

So, no I don't find it bad to have the nat policy to accept - it is the f=
ilter=20
policies I would be worried about :-)

/Kim


On Monday 24 March 2003 19:20, Aldo Lagana wrote:
> by default I set the nat chains (PREROUTING POSTROUTING, etc) to ACCEPT=
=2E=20
> first off is this bad?
>
> For my web & mail servers using DNAT, I need to add rules - and I do.  =
Same
> w/ SNAT rules...
>
> The problem has come up with our mail server - we were getting spam fro=
m
> one IP address - since my DNAT rule was ACCEPT and forward, the mail se=
rver
> kept getting these spam messages.  I stopped the SPAM by adding a rule =
to
> the beginning of PREROUTING to DROP packets from that address.
>
> This made me start thinking - am I doing it right by having all the nat
> chains default ACCEPT?
>
> aldo


