From: "thaian" <thaian@6wind.com>
Subject: Log with log amount
Date: Thu, 28 Oct 2004 17:27:17 +0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <02b201c4bcd8$b5dd17e0$3a00200a@ThaiAn>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All

In FreeBSD, ipfw uitiliy can log with amount of packet:
        ipfw add 1200 deny log tcp from any to any log-amount 100

But with netfilter, I do not see any option for setting amount of packet =
I want to  log
        iptables -A INPUT -j LOG ...................????

Thai An

