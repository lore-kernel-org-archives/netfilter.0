From: Clister <clist@uah.es>
Subject: detecting available netfilter matches and targets
Date: Thu, 18 Dec 2003 10:41:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312181041.29894.clist@uah.es>
Reply-To: clist@uah.es
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi list

Im currently developing a firewall administration tool based on php, it see=
ms=20
to work well and i manage a large number of rules (aprox. 12000+) on my=20
network so im using iptables-save iptables-restore to do upload of rules in=
to=20
kernel.

Now with the plethora of modules available i dont know how to detect module=
s=20
(matches and targets)  available on kernel in order to use them on the=20
aplication.  Is there any file on /proc that i can look in order to see suc=
h=20
information?=20
=2D-=20
=2D-----------------------------------------------
Clist
Universidad de Alcal=E1
=2D-----------------------------------------------


