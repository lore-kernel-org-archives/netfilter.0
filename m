From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Filtering in the nat table - opinions wanted
Date: Mon, 24 Mar 2003 17:09:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303241709.07575.netfilter@newkirk.us>
References: <003501c2f232$1c0a5140$6d64a8c0@discmail.com>
Reply-To: netfilter@newkirk.us
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
To: Aldo Lagana <alagana@discmail.com>, netfilter@lists.netfilter.org

On Monday 24 March 2003 01:20 pm, Aldo Lagana wrote:
> by default I set the nat chains (PREROUTING POSTROUTING, etc) to
> ACCEPT.  first off is this bad?
>
> For my web & mail servers using DNAT, I need to add rules - and I do.=20
> Same w/ SNAT rules...
>
> The problem has come up with our mail server - we were getting spam
> from one IP address - since my DNAT rule was ACCEPT and forward, the
> mail server kept getting these spam messages.  I stopped the SPAM by
> adding a rule to the beginning of PREROUTING to DROP packets from that
> address.
>
> This made me start thinking - am I doing it right by having all the
> nat chains default ACCEPT?
>
> aldo

Yes.  ACCEPT policy for nat and mangle chains.  You should look to=20
setting a DROP policy on FORWARD, though, and ACCEPT only the traffic=20
you want to allow through there.  For something like DROPping a specific=20
IP, you should have those rules first in FORWARD, followed by the ACCEPT=20
rules to let through classes of traffic.  (IE, email connections to and=20
from the mail server and ESTABLISHED & RELATED state connections)

If you don't have anything in FORWARD right now, but an ACCEPT policy,=20
you should definitely concentrate there.  Start with rules to accept the=20
traffic through that you really need, with a LOG rule at the end if the=20
chain.  This way everything will still work as it does now, and you can=20
check the rules listing to see what rules are matching packets, and=20
check the LOG to see what isn't matching any rule.  (and write a rule to=20
ACCEPT it if you need it)

j


