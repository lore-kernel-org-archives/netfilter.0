From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Best Practices for iptables
Date: Fri, 5 Dec 2003 12:54:31 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EB0@alderaan.smgtec.com>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org

I don't know what either you or the parent are talking about.

The OUTPUT chain is ONLY useful for filtering when:

1. The machine runs services as an account other than root; in which
case, default-accept is still ok in my book, just filter the uid of the
service.
2. You don't know how to work with inbound packets
3. The machine is a multi-user access server
4. The machine is a workstation

INPUT and FORWARD should be you're gatekeepers. I would shy away from
filtering in PREROUTING as it gets messy to track before DNAT /
REDIRECTing.

My corp. firewalls: INPUT: 10-20 rules, FORWARD: 75-200, OUTPUT: 0
My Home firewall: INPUT: 7 rules, FORWARD, 8 rules, OUTPUT: 0

In conclusion, it is all up and fine to use OUTPUT filtering if you
really really want to, but I fail to see how enforcing OUTPUT filtering
helps to secure a network as long as the Linux firewall is stand-alone.

For a userspace tool like ZoneAlarm, and Norton Internet Security, there
is currently no mechanism to trap/query users based on outgoing packets.
When that technology is developed for Linux, you'll really see the
benefits of OUTPUT filtering.

