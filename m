From: "Kevin Appel" <kappel@clunet.edu>
Subject: Time stamp for Recent
Date: Thu, 21 Jul 2005 15:45:05 +0000
Message-ID: <W6058014509160581121960705@robles.clunet.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

I am using the recent module to set up a rule to block too many ssh attem=
pts and I am curious about the last_seen number.  Is this some sort of ti=
mestamp and if it is, is it possible to translate this to a readable form=
at?

Example:
[root@caddy net]# cat /proc/net/ipt_recent/sshscans 
src=3D192.168.1.21 ttl: 64 last_seen: 6908449 oldest_pkt: 5 last_pkts: 68=
66823, 6867384, 6867634, 6908149, 6908449

Thank you,

Kevin



