From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: Strange Proc Entries
Date: Wed, 25 Jun 2003 11:03:53 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DE3@alderaan.smgtec.com>
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

I have a firewall acting as an internet choke point, and I am seeing
strange readings while trying to track bandwidth usage.

I am using iptables extensively, and it seems that whenever iptables
rules have been applied to an interface, the 'transmitted bytes' field
does not increment in /proc/net/dev; the 'transmitted packets' field
does increment though.

I am using a Redhat 9 base of 2.4.20 and p-o-m on top of it. I have 3
4-port D-Link cards with the "sundance" driver installed.

Any help would be appreciated, as my lame bandwidth graph is pretty
hurting with just half the info!

