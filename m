From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: going default DROP
Date: Sat, 25 Sep 2004 09:59:55 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CBC3n-00015q-00@deer.gmane.org>
References: <a0f69e5040924223152fe70b6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040924223152fe70b6@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: 'Askar' <askarali@gmail.com>, 'netfilter' <netfilter@lists.netfilter.org>

As an isp I think there will start a problem with your customers if you =
try
to block anything that people that pay you can do.

I mean, if they pay, they must have the way to use what they want, =
related
to ports and protocols, but ill take some tips for this situation


- Thinking in the output traffic (the one you forward from your =
customers to
internet) the following sets could be default
	-> anything will pass (configure this with conntrack)
	-> if you want, use a cache for some traffic to save some bw
	-> maybe you can apply some limits just in case some of your users
have a virus or something in their boxes that may try a DoS. So for the
customer traffic you may apply syn flood limits, bad packets filters, =
and
some protections that could save big problem as responsible for your ip
block.

Now, thinking in traffic that internet sends to your users in this case =
ill
think the following

	-> DROP is the policy (no new connections, this is why conntrack)
	-> in case you want to watch the denied traffic you could use
		--> a LOG/ULOG rule to log and review the denied packets
		--> tethereal is a great tool, and you can use capture
filters with tcpdump format

This could show you if there's any flow you could accept for your =
customers.


As experience and advice, always notify your customers that you'll be
"touching" and it may affect the service, and off course, try to do it =
at
the time of the day where are less users. And always keep a way of =
rollback
until you have totally tested the final solution.


Regards



-----Mensaje original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] En nombre de Askar
Enviado el: S=E1bado, 25 de Septiembre de 2004 2:31
Para: netfilter
Asunto: going default DROP

hi,

okay now im seriously wanted to convert the default ACCEPTED fw machine =
by
my predecessor to default DROP. coz it is very hard to maintain ACCEPTED =
fw
and im getting tired of monitoring tcpdump and then adding new rules to
firewall script.
As I told before it is a small ISP (limitations: no more then 150 users =
at a
time) and our clients connected to us via dialup.
Before going to deploy my desired fw script I want to monitor the users
traffic for a while may be I would go outside and interview few cyber =
cafes,
to decide *what* to DROP and which packets to allow.
Remember our clients are not that power users, very normal in nature, =
when
online majority of them acccessing port 80, IM, chatting, emailing, irc =
etc.
we have setup a cache "squid" for port 80 related things and its doing =
very
well.
Therefore I thinks it would not be difficult to deploy default DROP =
script,
yes may be in starting days we could loose few clients ;) As im kinda =
new to
security and iptables stuff, however I want to prove that this sort of
policy is possible in ISP (small) enviroment .

=3Dnow can someone guide me what is the good way to monitor traffic i-e =
what
ports clients accessing and then in teh light of this i would finialize =
my
script.
=3D any sample scripts for such enviroment and links ?
Any other suggestions would be greatly appreciated.

regards
Askar

--
(after bouncing head on desk for days trying to get mine working, I'll =
make
yer life a little easier)



