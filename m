From: "yomega" <yomega@wahooo.net>
Subject: AW: IP Traffic Accounting / Own Chains
Date: Sat, 22 Jun 2002 17:18:28 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDBMIDIOFPBNLEAJOEJBCHAA.yomega@wahooo.net>
References: <20020622140903.YSRU2755.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020622140903.YSRU2755.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Hi List,

Thank you really much for all the help :) Now everthing is workin fine...not
really everything *G*

OK IP Counting is no problem :) It was a problem but because of your nice
and workin answeres the silly one writing this mail got it :)

Now i plan to set up accounting for an CS Server. First aof all i wanna make
an own chain for this Server, that would be much easier to count packets for
different servers and things.

OK so i do:
iptables -N [CHAIN NAME]
and then add rules for example this one:
iptables -A [CHAIN NAME] -p tcp --dport 80 -j ACCEPT
so now i've made some traffic on my webbie and typed in that:

iptables -L -n -v -x

now the list is printed :) INPUT and the other Chains are correct but this
chain (my own one) didn count anything.

Maybe i just haven't understand what i'm doin :) or i'am silly *G*

So it be real nice if you help this silly man writing this mail *G*

Greetings and a really nice day :)

Stephan

> -----Urspr=FCngliche Nachricht-----
> Von: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]Im Auftrag von Antony Stone
>
>
> On Saturday 22 June 2002 3:00 pm, David B Harris wrote:
>
> > I'd suggest you use iptable's byte-counting instead. 'iptables
> -L -n -v -x'
>
> Thanks, David - I forgot the '-x' in my version, and this makes
> the numbers
> an awful lot easier to process :-)
>
> > will list the bytes which have _crossed_ each given rule. (So it
> > won't just count which packets have matched.)
>
> I'm not sure I agree with this - I believe the byte / packet
> counters only
> count packets matched by the rule, so that if you have the rules:
>
> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 110 -j ACCEPT
>
> the counters for the first one will only show you SMTP traffic, and the
> counters for the second one will only show you POP3 traffic.
>
>
>
> Antony.
>
>


