From: "John A. Novak" <jnovak@blueshiftinc.com>
Subject: iptables on Red Hat Linux 8.0 installation requires frequent iptables restart
Date: Fri, 20 Dec 2002 13:13:04 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F635E25A78F69C41B85DC6CB18972A9A4746FA@kepler.blueshiftinc.com>
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

Greetings,

I am running iptables on a Red Hat Linux 8.0 system that I received from =
Red Hat about a month ago.  I am using iptables straight off the =
distribution CD.

The system iptables is running on is used only as a firewall, has 512MB =
of RAM and three network adapters.  The symptom I'm seeing is that every =
day or so I need to restart the iptables service to get packets moving =
through the firewall again.  The system appears to have plenty of =
available RAM and plenty of free disk space when the firewall is =
dysfunctional. =20

I am using NAT and have it configured to remap internal addresses to two =
ranges of external ip addresses, one for each of the two internal =
networks.

The periodic failure and resurrection after restart is suggestive of a =
resource leak, but I'm at a loss as to how to proceed to further debug =
this problem.

Any suggestions are appreciated.

John Novak

