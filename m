From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: Blocking dhcp
Date: Mon, 30 Sep 2002 15:30:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c26885$82490dc0$153fa8c0@hslbrabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have dhcpd installed.
Afaik it should only run on eth1, but for some reason it doesn't and
listens on all interfaces : eth0, eth1 and ppp0.
(# dhcpd -cf <conffile> -lf <leasefile> eth1)
Since this is what's in the man-page, I think it's strange.. but that
aside.

I have the default INPUT policy set to DROP and I don't have an ACCEPT
rule for port 67/udp.
When I nmap to the machine (from an external machine) it says that
port 67/udp is open.
So, although I think it's overkill, I entered an explicit DROP rule
for port 67/udp.
Again when I nmap to the target it shows that the port is still open.

Right.. Does anybody know what I'm doing wrong ?


Tia,
Rob



