From: Kirk Wallace <kwallace@wallacecompany.com>
Subject: Wireless Login Page
Date: Thu, 26 Apr 2007 09:48:12 -0700
Message-ID: <1177606092.3828.108.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I have a wireless card installed on Fedora 4 system. I have the wireless
connection open, DHCP enabled and have disabled forwarding for the
"open" network. I use Poptop and Radius to authenticate and assign IP
addresses on the tunnel and then allow forwarding for the tunnel address
range. I now want to have all http requests from the "open" network to
be directed to a opening/login page on the wireless server. Can this be
done with iptables (conntrack?)? Would anyone suggest links or keywords
for finding more information? Thank you.

Kirk


