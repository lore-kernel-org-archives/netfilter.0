From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Debugging
Date: Sun, 19 Oct 2003 15:45:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E6C@alderaan.smgtec.com>
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
To: techmail@safe2surf.nl, netfilter@lists.netfilter.org

This is a redhat bug, not netfilter.

If you are adept at bash scripting, you may want to try bash -x service =
firewall start.

Enjoy!



-----Original Message-----
From:	techmail@safe2surf.nl [mailto:techmail@safe2surf.nl]
Sent:	Sun 10/19/2003 3:24 PM
To:	netfilter@lists.netfilter.org
Cc:=09
Subject:	Debugging
Hi,

=20

Perhaps this is a stupid question which has been asked too many times,
but I wasn't able to find it.

=20

If I do "service iptables start" nothing happens, so when I do "service
iptables status" it says "Firewall is stopped."

=20

Because I want to know where in the process the error is I'd like to
know how to debug it. Is there any information on debugging to see what
error it displays?

=20

Kind regards,

=20

Robert Hazenveld





