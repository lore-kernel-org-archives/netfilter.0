From: udo <udovdh@yahoo.com>
Subject: TARPIT question (more info)
Date: Sun, 18 Apr 2004 09:03:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040418160348.3296.qmail@web40714.mail.yahoo.com>
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

As I wrote in my previous message I'd like to use the
TARPIT feature as much as possible.
I have a working setup for unused priviliged ports
that looks somewhat like this:

for tarpitports in 21 23 25 42 79 81 110 137 138 139
445 901; do
  $path_iptables -t raw -A PREROUTING -i $ext_if -d
$ext_ip -p tcp --dport $tarpitports -j NOTRACK=20
  $path_iptables -t raw -A PREROUTING -s $ext_ip -p
tcp --sport $tarpitports -j NOTRACK=20

  $path_iptables -A INPUT -s 0.0.0.0/0 -d $ext_ip -i
$ext_if -p tcp -m tcp --dport $tarpitports -j TARPIT
  $path_iptables -A INPUT -s 0.0.0.0/0 -d $ext_ip -i
$ext_if -p tcp -m tcp --dport $tarpitports -j
LOG-INPUT # just in case
done

Untracking the ports makes the situation safe for
conntrack.

Now I also want to use the tarpit feature for ports >
1023.
Who can help me here?

Please post!

Kind regards,
Udo


=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

