From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Multiple Source Addresses
Date: Tue, 15 Apr 2003 11:07:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DB6@alderaan.smgtec.com>
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

# Create a new table to process traffic you don't like
iptables -N NORMAL_TRAFFIC

# Log unwanted traffic
iptables -A OTHER _TRAFFIC -j log
# Do what you want with the packet after being logged
iptables -A OTHER _TRAFFIC -j ACCEPT, DROP, REJECT, or Whatever

# Allow ok traffic through
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow your accepted traffic through
iptables -A INPUT -s 192.168.43.1 -j ACCEPT
iptables -A INPUT -s 192.168.43.2 -j ACCEPT

# Send all unwanted traffic to get logged & ?
iptables -A INPUT -j OTHER_TRAFFIC


-----Original Message-----
From: Keller Nicolas [mailto:nicolas.keller@slb.de]=20
Sent: Tuesday, April 15, 2003 9:29 AM
To: netfilter@lists.netfilter.org
Subject: Multiple Source Addresses

Hi!

I want to log every packet that *doesn't* come from IP1 and IP2 (because
these two hosts should be the only one that communicate with the
Firewall). Up to now I couldn't figure out a way to do this, as it is
NOT possible to include multiple source addresses in one line, like
this:

iptables -A INPUT -s !192.168.43.1 !192.168.43.2 -j LOG

Anyone can show me a way to get this to work?

Thank you very much!

Nicolas Keller


