From: Eric Marchionni <mailing-lists@gmx.ch>
Subject: deny cgi scanner
Date: Tue, 01 Apr 2003 19:34:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E89CD8A.5020007@gmx.ch>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi all

does anybody know how to drop packets with
destination-port 80 after a limit of connections
has been reached?
i'd like to deny access for the attacker as soon
as a cgi-scan has been detected.

is it possible to do that with iptables?

plz let me know =)
thx
eric


