From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Beginners Luck??
Date: Mon, 26 Jan 2004 15:06:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567910C@alderaan.smgtec.com>
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
To: chakkerz@optusnet.com.au, netfilter@lists.netfilter.org


> Iptables comes with the kernel? or does the kernel merely contain
> support, and then an additional program sorta, jacks into that
> support?=20

The second description is correct. Netfilter is the kernel support for
firewalls, and iptables is the userspace tool which 'jacks' into the
kernel.

>=20
> Is there a reason why after running a firewall i might not be able to
> start java applications (eg jEdit 4.1) - I get a splash screen but it
> just sits there. this is using Java 1.4.2_01 (as shipped with
> Slackware 9.1)=20

It could be that you are blocking traffic to or from 'lo' or localhost.
Make sure that you leave this alone. I know that java often uses ports
for various mickel-muck. Anyways, also does port 6000 work correctly?
Maybe if you described your base rules, I could tell you where you're
problem is originating from.

