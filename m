From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: UDP DNAT help
Date: Tue, 8 Apr 2003 11:35:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304081135.52432.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0303110642100.29619-100000@linux1>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0303110642100.29619-100000@linux1>
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
To: Craig Packard <cpackard@zoominternet.net>
Cc: netfilter@lists.netfilter.org

On Tuesday 11 March 2003 06:44 am, Craig Packard wrote:
> > Sounds like a SNAT rule that isn't tied down to just the external
> > interface.  Including packet traces and sniffs is potentially
> > useful, but more useful would be any SNAT and DNAT rules themselves.
>
> I've already posted my PREROUTING chain to the list.  And in the same

I've not been able to find it.  I found a request for it on Friday from=20
Ralf Spenneberg but if you posted it to the list I didn't receive that=20
post.  (not hard to believe - I seem to get a good percentage of this=20
list several days late - not just messages awaiting moderator approval)

> message you replied to was several packet captures further down the
> message.  There is no SNATing anywhere--on any interface.  I would be
> thankful for any help or info on more places to look to troubleshoot.

Sorry, I was aware of the captures in that message, but snipped them from=
=20
my reply for brevity.

My suggestion for further troubleshooting at this point would be to set=20
up a few LOG rules temporarily to try to track the progress of the=20
packets through netfilter.

iptables -t nat -I PREROUTING 1 -p udp -s 192.168.25.11 -j LOG=20
--log-prefix "NatPreS:"
iptables -I FORWARD 1 -p udp -s 192.168.25.11 -j LOG --log-prefix "FwdS:"
iptables -t nat -I POSTROUTING 1 -p udp -d 192.168.25.11 -j LOG=20
--log-prefix NatPostD:"

etc.  If you have loaded (or can load) mangle table, put the log rules in=
=20
mangle PREROUTING and POSTROUTING instead of nat.  Log both directions,=20
matching the specific source/dest port if possible, else matching=20
source/dest IP of both the local and remote boxes.

Make a few connection attempts (then remove the log rules) and then=20
examine the log entries to see what IPs appear where.  This may help=20
narrow down what packets are being modified at which stage.  By=20
examining packet IDs, src/dest IPs, and the log-prefix to identify which=20
chain logged the entry, you should get a fairly good picture of what is=20
taking place within netfilter regarding these connections. =20

> =09- Craig

j


