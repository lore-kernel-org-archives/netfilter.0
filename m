From: =?iso-8859-1?Q?P=E4r_H=E4ggblad?= <par.haggblad@terraplay.com>
Subject: iptables 1.2.10 and linux kernel 2.6.7 problems.
Date: Wed, 23 Jun 2004 14:24:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6BFFA187E8806C4E9740A353F715DDBDE57169@newmailer.terraplay.com>
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

Hi.
I have used iptables 1.2.9 with kernel 2.4.x since a week ago.
Now I'm using the new 2.6.7 kernel and iptables 1.2.10.=20

The problem is that my firewall script does not work anymore.
The setup is as followed:
 - Every thing in the kernel that has to do with the net filter options =
are
   Set to compile as modules. So I have done this in the beginning of =
the       script:

modprobe ip_tables
modprobe iptable_filter
modprobe iptable_mangle
modprobe ipt_MASQUERADE
modprobe ipt_conntrack
modprobe ipt_multiport
modprobe ipt_state
modprobe ipt_REDIRECT
modprobe ipt_REJECT
modprobe ipt_SAME
modprobe ipt_LOG
modprobe ip_conntrack
modprobe ip_conntrack_ftp ports=3Dab,cde,fgh
modprobe ip_conntrack_irc
modprobe iptable_nat
modprobe ip_nat_ftp ports=3D ab,cde,fgh
modprobe ip_nat_irc

I have two major problems:

1. modprobe ip_conntrack_ftp ports=3Dab,cde,fgh
   modprobe ip_nat_ftp ports=3D ab,cde,fgh
   Does not seem to work. I can't ftp to the defined ports. There is no
   answer what so ever.

2. $IPTABLES -v -A INPUT -i eth0 -p icmp -j DROP
   Does not work. I can still ping my compu, the packets are not =
dropped.

What you have to understand is that my firewall script worked fine =
before=20
the kernel change and iptables change.=20
So does anybody know anything about what has changed and can explain how
I could redesign my script. There are of course more iptables configs in =
the script, but everything is quiet basic, a lot of port forwarding and =
such stuff.=20

Thanks.

/Per  =20


