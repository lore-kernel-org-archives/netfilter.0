From: "afshin lamei" <afshinlamei@gmail.com>
Subject: ip_queue problem
Date: Sun, 14 May 2006 20:28:49 +0330
Message-ID: <3115d56e0605140958m59629989gb3d2b44ede4c9783@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

dear all,
I'm using ip_queue for icmp and tcp packets like this:

iptable -A INPUT -p icmp -j QUEUE
iptables -A INPUT -p tcp --dport 80 -j QUEUE

then, I run snort_inline like this:
snort_inline -D -i eth1 -Q -A fast // which starts snort inline mode,
capturing packets from ip_queue instead of pcap.
the ip_queue generates these errors and drops all icmp and tcp/80 packets:

An SKB was queued with no app data
ip_queue: error creating packet message
Build packet failed

Do any of you know what's the solution to theses errors?
regards,
afshin

