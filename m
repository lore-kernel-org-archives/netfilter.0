From: Brian Capouch <brianc@palaver.net>
Subject: JNAT and SNAT private <-> public, but can't get to port 80 . . .
Date: Tue, 11 Jun 2002 20:06:12 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D069E84.F94CD414@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Tried to say it all in the subject line. . . 

Should I expect that when I set up a host that has private IP go out via
a public IP using a SNAT entry (simply: iptables -t nat -A POSTROUTING
-s 192.168.x.y -j SNAT --to-source w.x.y.z) and then use DNAT to allow
the public IP back in (iptables -t nat -A PREROUTING -d w.x.y.z -j DNAT
--to-destination 192.168.x.y) that I not be able to get web traffic to
port 80 through to the machine in question?

That seems to be my unfortunate situation.  Defaults are ACCEPT for
INPUT, OUTPUT, and FORWARD.

I hope this isn't a FAQ or I'm somehow otherwise proving cluelessness
here.  I've read around the web a bit and at least it doesn't seem the
answer is totally obvious. . .

Thanks in advance.

B.

