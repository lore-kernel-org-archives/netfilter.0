From: "Steve Arentz" <arentz@ameritech.net>
Subject: icmp type error message
Date: Sat, 24 Apr 2004 11:52:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <KHEPIJJDEJGPDCBOMGKAKEJBCDAA.arentz@ameritech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

I upgraded my Redhat based linux firewall (netfilter) system from
iptables v1.2.8, kernel v2.4.23 to iptables v1.2.9, kernel v2.4.25.
(Trustix v2.0 to Trustix v2.1 just in case its important.)

Using the same rule set, all my icmp rules now get the following error -
iptables v1.2.9: Unknown arg =91--icmp-type=92

A simple command line rule entry like the following gets the same error -
iptables -A INPUT -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT

Any ideas?  Is there a module that is not being loaded in this new versio=
n?

Thanks in adanvce for your help,
Steve


