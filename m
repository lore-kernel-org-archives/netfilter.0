From: Buddy wu <ejournal4me@gmail.com>
Subject: what's the problem of DNAT
Date: Mon, 31 Oct 2005 11:31:58 +0800
Message-ID: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

   I use '/sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp=20
--dport 80 -j DNAT --to 192.168.16.100:8087' it can work, but if I use
8087 instead of 80,like follows:
/sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp  --dport
8087 -j DNAT --to 192.168.16.100:8087 then it can't work. what's wrong
with it ?

