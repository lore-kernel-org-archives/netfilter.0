From: "Steve Howard" <showard@kennesaw.edu>
Subject: iptables rules for forwarding remote desktop
Date: Wed, 06 Nov 2002 13:45:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sdc91d0f.002@kennesaw.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I would very much appreciate any help I could get for my question.

I have a RedHat 8 machine with 2 ethernet cards. eth0 is connected via =
dhcp to the Internet (cable modem).
eth1 is private 192.168.1.1. I have a windows xp machine which I have set =
up to acquire a dhcp address, (it is always 192.168.1.10). I would like to =
be able to use the remote desktop (port 3389) from outside. I understand =
that I will have to forward port 3389 to eth0 so that I can access this =
port from my office machine. I have seen recommendations of one rule, and =
I have seen recommendations that have three rules listed. Can anyone help =
me get this right?

Thank you,


Steve Howard
Software Trainer
Information Technology Services
Kennesaw State University
770-423-6895



