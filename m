From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: connection and bandwidth monitoring program
Date: Fri, 1 Aug 2003 11:00:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308011502.h71F2AjX031255@discmail.com>
References: <200308011145.02224.Olivier.Mayeres@ulg.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308011145.02224.Olivier.Mayeres@ulg.ac.be>
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
To: 'Olivier Mayeres' <Olivier.Mayeres@ulg.ac.be>, netfilter@lists.netfilter.org

/proc/net/ip_conntrack  --- connections (plus a whole lot more)

Iptraf ...bandwidth monitoring.

NO WIN32 for you!=20
=20
Unless you are using SNMP you can only really do connection and =
bandwidth
monitoring on the actual server...with SNMP there is mrtg which =
generates
nice HTML graphs.

This would be one great open source application: monitoring Linux
firewall/gateway from remote windows/Linux PC.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Olivier =
Mayeres
Sent: Friday, August 01, 2003 5:45 AM
To: netfilter@lists.netfilter.org

Hello,
I looking for a connection and bandwidth monitoring program. I found one =
at

http://www.student.lu.se/~nbi98oli/connmon.html but there are no new=20
developements. It isn't possible for each nat computer to see the total=20
in/out curent traffic.
I would like to find a client-server program, with a win32 or java or =
applet

client.
does someone know an alternative?
sincerly yours
Olivier



