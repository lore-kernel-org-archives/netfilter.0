From: John McMonagle <johnm@advocap.org>
Subject: Problem with conntrack table filling
Date: Thu, 30 Mar 2006 14:30:37 -0600
Message-ID: <442C3FED.4040706@advocap.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040701090004030504020606"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040701090004030504020606
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Firewall was dropping a lot of packets this morning.

Had  a lot of messages like:
Mar 30 06:30:54 fonroute kernel: ip_conntrack: table full, dropping packet.

Rebooted to get it working

/proc/sys/net/ipv4/ip_conntrack_max was 16k
set to 32k.

After running for a while started monitoring /proc/net/ip_conntrack

at the moment have 3671 and still going up after 7 hours.

Looking at it most (  3343 )of them are for razor connection from the
mail server like this:


tcp      6 418044 ESTABLISHED src=192.168.2.5 dst=66.151.150.22
sport=52613 dport=2703 packets=6 bytes=364 src=66.151.150.22
dst=24.196.120.30 sport=2703 dport=52613 packets=6 bytes=501 [ASSURED] use=1
tcp      6 424354 ESTABLISHED src=192.168.2.5 dst=66.151.150.22
sport=43840 dport=2703 packets=6 bytes=364 src=66.151.150.22
dst=24.196.120.30 sport=2703 dport=43840 packets=5 bytes=449 [ASSURED] use=1
tcp      6 418125 ESTABLISHED src=192.168.2.5 dst=66.151.150.12
sport=52803 dport=2703 packets=6 bytes=349 src=66.151.150.12
dst=24.196.120.30 sport=2703 dport=52803 packets=5 bytes=386 [ASSURED] use=1

At least when I checked there were no tcp connections  to port 2703 from
the mail server.

What is the cause of this?

More info.
Both firewall an mail server are debian sarge.
firewall:
2.6.10 kernel

mailserver:
mailscanner    4.41.3-2
razor          2.670-1sarge2

Thanks

John


--------------040701090004030504020606--

