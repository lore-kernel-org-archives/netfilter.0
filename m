From: "Don Woodruff" <donw@minglewood.net>
Subject: Cisco Logging THOUGH iptables firewall to seperate syslog machine
Date: Wed, 4 Dec 2002 03:28:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6BED17A9718E204F812CBBAF3B102E2A01C140@babylon.metropolis.minglewood.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

I guess this is more of a syslogd question, but iptables is part of the
issue, so it's not too far off topic:

I have a Cisco Router on my ISDN connection, and behind the Router sits
an iptables firewall (RedHat 8.0). Behind the firewall is, among other
things, my loghost (RedHat 8.0 as well). I got syslogd running with "-r
-x", and it would accept redirected kernel messages from the firewall,
but would not register anything from the Cisco. I could see the packets
in the log being DNAT'ed, but I suspect syslogd rejected them as not
being from a local machine.

Instead, I started up syslogd on my firewall with "-r -x -h" and am
accepting the Cisco messages (coming from a local host in this case),
and forwarding them to the loghost (which seems to work). It took just a
little bit of rule-mashing to get things running smooth.

My question: this can't really be the best way to do this? Am I missing
something (or perhaps I just need a different syslog daemon)?

Don

