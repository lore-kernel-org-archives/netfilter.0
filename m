From: "Stephen C. Biggs" <steveb@storwiz.com>
Subject: Bridge throughput cut in half by iptables?
Date: Thu, 10 Mar 2005 16:19:22 +0200
Message-ID: <4CF8D5C776EDF245A306F6B1A0D2DF1603B188@swdc2.storwiz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings,

Running Debian Sarge 2.6.8-13 kernel recompiled to allow Frame Diverter =
and NTFS.
I have 3 machines, client, proxy and server, all with Intel Gigabit =
e1000 adapters.

The software consists of a simple proxy that passes packets between two =
sockets that starts up with one of the sockets connected to the server =
machine, and a client/server that sends 28000 packets of 64000 bytes =
each filled with 'a', waiting for a 40 byte ack filled with 'b'.

I have tried various configurations, but my end objective is to be able =
to use a transparent bridge proxy.

When connecting the client and server machines directly and running, I =
get a run time of about 17 seconds.  Putting the bridge in the middle =
and running again gives ma a time of about 19 seconds, a 10% slowdown, =
already worrisome.  When I activate the proxy software and have the =
client connect to the proxy, I get a run time of 22 seconds, yet more =
slowdown, but perhaps liveable.

Now, trying the full configuration, I invoke iptables as such:
# iptables -t nat -A PREROUTING -i br0 -p tcp --dport <proxy port> -j =
REDIRECT

I then connect through the bridge from client to server and get a =
runtime of 44 seconds, a >50% performance hit as compared to direct =
connect.

It seems to be related to the connection tracking since that is where =
OProfile says most of the time is spent (after copy_to/from_user which =
should be the same).  Time spent in the actual application is almost =
nil.

If anybody can give me pointers, tips, paths of investigations or merely =
admonishments to accept this situation as normal, it would be very much =
appreciated.  Please advise as to any further information needed.  I am =
pretty sure I am missing something very simple that will solve all of =
this for me.

Thanks.





