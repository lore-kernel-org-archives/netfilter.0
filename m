From: "Peter Marshall" <peter.marshall@caris.com>
Subject: iptables + RELATED
Date: Tue, 12 Aug 2003 15:41:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01dc01c36101$5bd8eaf0$49caa8c0@caris.priv>
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

Hi, My name is Peter Marshall.  I am having some problems letting ftp
through my firewall without opening all of the ports.  I was trying to get
RELATED to work, but for some reason it will not.  Here is an example of
what my file looks like

$TABLENAME -A FORWARD -d x.x.x.x -o eth2 -j mychain

$TABLENAME -A mychain -m state --state ESTABLISHED,RELATED -j ACCEPT
$TABLENAME -A mychain -j DROP

I don't think I need the ESTABLISHED, but I put it in anyways.

If anyone could help it would be greatly appriciated.

Thanks


Peter Marshall



