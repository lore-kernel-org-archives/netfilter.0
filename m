From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Iptables & Remote SSH Sorrows
Date: Thu, 10 Apr 2003 13:01:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DB3@alderaan.smgtec.com>
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
To: tamato@attbi.com, netfilter@lists.netfilter.org

By chance, do you have a * in hosts.deny?

This is not an iptables problem. IMO, you are denying everything and
only including what you have in hosts.allow, since it runs before
hosts.deny. That would allude to your hosts.deny being restrictive which
is fine, but it means that you can't easily allow dynamic connections.
Maybe you can check the pattern matches in "man hosts.allow" to see what
can be done to limit the number of entries you need to add to the list.


-----Original Message-----
From: tamato@attbi.com [mailto:tamato@attbi.com]=20
Sent: Thursday, April 10, 2003 11:25 AM
To: netfilter@lists.netfilter.org
Subject: Iptables & Remote SSH Sorrows

I have configured iptables to allow ssh connections.  However, no one is
able=20
to connect unless I add their IP address to the /etc/hosts file.  Since
my=20
remote useres are on dynamic IP's - their address changes each time they
log in=20
to their internet accounts. =20

Is there a way to configure iptables or another system file that would
allow=20
ssh connections from any IP?

My setup:

  OS......: Linux Kernel: 2.4.18
  Distro..: RedHat 8.0 (2.4.18-27.8.0)
  Iptables: 1.2.6a-2

  [remote users]---->(internet)<----[linux box]

Iptables SSH command (loaded from /etc/init.d/iptables script):

   iptables -A tcp_inbound -p TCP -s 0/0 --destination-port 22 -j ACCEPT

Any insight or help would be much appreciated.

Thanks.

-tom-



