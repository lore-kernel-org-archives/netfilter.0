From: "Philipp Stader" <me@ph1l.de>
Subject: Masquerading HBCI Connections?
Date: Wed, 28 Jan 2004 16:30:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Alree-0003sL-1d@vishnu.netfilter.org>
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

Hi,

does anyone have experience with masquerading/nat'ing HBCI connections? We
enable Internet Access for Computers in our Lan via a Linux Router and the
following statement:

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

We have a Workstation with Chipcard Reader and tried to get our current
balance via HBCI without sucess. We actually tried too Chipcards from
different Banks.
Anyone has this Setup Working? Or is masquerading HBCI traffic currently
unsupported? We had no firewall running during our tests.

I'd be happy to hear from you guys.

Kind regards

Phil 


