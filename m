From: "Markus Zeilinger" <mz@sea.uni-linz.ac.at>
Subject: Filtering multiple networks
Date: Mon, 31 May 2004 11:57:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BUjWm-0005kj-GQ@vishnu.netfilter.org>
Reply-To: <mz@sea.uni-linz.ac.at>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi all,

sorry if this is a stupid question, I am just a newbie with iptables.

I am currently writing a little script for a simple network design. I have a
local network parted from the internet with a linux firewall. Now I would
like to drop all packets coming on the Internet interface on the firewall
with source address out of the private IP address ranges (10.0.0.0/8,
192.168.0.0/16, 172.16.0.0/12 and 169.254.0.0/16). I use the following
syntax in my script:

...
WAN_IFACE="eth0"
PRIV_IP="10.0.0.0/8,192.168.0.0/16,172.16.0.0/12,169.254.0.0/16"
...
iptables -A INPUT -i $WAN_IFACE -s $PRIV_IP -j DROP
...

When I execute the script I get the following error:
...
iptables v1.2.9: host/network
`10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0' not found
...

Isn't it possible to write a rule like this, or what am I doing wrong?

Thx for you help guys!

Cheers,
Markus

--------------------------------------------------------------------
Markus Zeilinger (System Administration)

University of Linz, Systems Engineering and Automation
Altenberger Strasse 69, 4040 Linz, AUSTRIA 
Phone: +43(0)732-2468-8869, Fax: +43(0)732-2468-8878

PGP Fingerprint: 5FC3 E7B3 DC02 C0A2 0198  70CB 9715 491B DA97 4E3F

Home: http://www.sea.uni-linz.ac.at/department/staff/mz/
--------------------------------------------------------------------




