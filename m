From: "David Gaudine" <david@annette.concordia.ca>
Subject: RELATED is not recognized
Date: Sun, 4 May 2003 16:05:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c31278$94dc0ad0$0432cd84@sleepy>
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

When I try this line
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
the response is
iptables: No chain/target/match by that name

I am using kernel 2.4.20 and iptables 1.2.8, and have included these
options:
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_FTP=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_FILTER=y

If I shorten the command to
iptables -A INPUT -m state --state -j ACCEPT
(which is obviously invalid) the error message is
iptables v1.2.8: Bad state `-j'
which shows that "-m state" and "--state" are recognized, only the part
about
ESTABLISHED,RELATED
is unrecognized.  Why is this?  Is there another kernel options that I
should have included?

Also, I'd love to see a working example of using iptables to handle ftp
connections.  The above line doesn't seem quite right; for one thing, it
doesn't specifically mention that it's for ftp.  Should I have an INPUT and
an OUTPUT line that both specify port 20 and the connection tracking?

I was quite pleased that I was able to get my firewall working without
flooding you people with questions, until I noticed that ftp wasn't working.
Silly me, during my early testing I tested ftp just by establishing a
connection and quitting, it didn't occur to me to try to transfer a file.

David


