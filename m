From: udo <udovdh@yahoo.com>
Subject: martians and portforwarding to 127.0.0.1
Date: Tue, 20 Apr 2004 09:33:26 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

To be able to run sshd from an unpriviliged port I
want to let sshd listen to just the lo (12.0.0.1)
interface, port 2222 and forward connections to port
22 on my internet and LAN interfaces to 127.0.0.1:22.
To enable this I use something like:

$path_iptables -t nat -A PREROUTING -p tcp -i $ext_if
-s 0/0 -d $ext_ip --dport 222 -j DNAT --to
127.0.0.1:22
$path_iptables -t nat -A PREROUTING -p tcp -i
$local_if -s $local_net -d $local_ip --dport 222 -j
DNAT --to 127.0.0.1:22

$path_iptables -A FORWARD -p tcp -i $ext_if -o lo  -s
0/0 -d 127.0.0.1 --dport 22 -m state --state NEW -j
ACCEPT
$path_iptables -A FORWARD -p tcp -i $local_if -o lo -s
$local_net -d 127.0.0.1 --dport 22 -m state --state
NEW -j ACCEPT

(for a test I enabled port 222 -> 127.0.0.1:22)

This makes the following message appear in the log:

blabla kernel: martian destination 127.0.0.1 from
x.y.z.q, dev ppp0

How can I make the sshd (attached to loopback) work
without `martian destination` messages for packets
destined for port 22?
Please post!

Kind regards,
Udo


=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

