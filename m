From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Round Robin Load Balancing
Date: Sun, 27 Jul 2003 11:46:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E0C@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Javier Govea <jgovea@magma.ca>
Cc: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

Sorry about the bogus syntax. I was shooting form memory.

If you do the route in mangle, then I can also see the need to change
the source IP with -j MASQUERADE in -nat POSTROUTING.

# Every 4th SYN packet, send the syn down a different pipe (with a bad
IP address for the output)
iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 -m state
--state new -j ROUTE --oif ppp0

# Fix the bad IP address from the previous command and setup a conntrack
for the session
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE


Tell me how this goes.

-----Original Message-----
From: Javier Govea [mailto:jgovea@magma.ca]=20
Sent: Sunday, July 27, 2003 10:41 AM
To: Daniel Chemko; Javier Govea
Cc: George Vieira; netfilter@lists.netfilter.org; Ramin Dousti;
netfilter@lists.netfilter.org
Subject: Re: Round Robin Load Balancing

Hi guys,

I tried the following line (i'm using "-j ROUTE" instead of "-m route",
as Daniel wrote
before, because the route patch is actually a target and because "-m
route" was giving me
a an error. But if i'm doing it in the wrong way, please correct me):
=20

