From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 16:46:31 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002101c3b9ef$53e5d780$0201a8c0@OurPC>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
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

Hello All,

I've been working with giptables firewall and have run into a big issue.
Although my script seems to be correct namp is finding ports 25/tcp and
110/tcp open.  To start troubleshooting this problem I've commented
everything out and stripped down the ruleset to just the default DROP
policy.  Yet nmap -sT -F -P0 -0 xx.xx.xx.xx still returns 25/tcp and 110/tcp
as open!

Now I'm starting to think that iptables is broken. I've built iptables with
grsecurity-1.9.12 and iptables1.2.8 with a plain vanilla kernel 2.4.22   Is
anyone aware of any issues?

Dave



