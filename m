From: Marty Phee <mphee@jump-technologies.com>
Subject: VPN through the firewall
Date: Wed, 02 Mar 2005 16:33:16 -0600
Message-ID: <42263F2C.9030600@jump-technologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I've got a SUSE box running my home firewall and a WinXP work machine 
that I use to VPN into the office network.  Before I put this SUSE 9.2 
in I had a Mandrake 9.1 box that worked just fine.

Everything but my VPN connection to the office works.

I've added all kinds of rules to try to get this to work, but nothings 
working.  I don't see any packets getting dropped/rejected.  It looks 
like it makes the connection to the vpn server, but it's not verifying 
the password.

With Ethereal I see this:
Source: 129.230.241.140
Destination: 192.168.0.73
Protocol: EAP
Info: Request, EAP-TLS [RFC2716] [Aboba]

That line just keeps repeating until it timesout with a 619 on the 
windows machine.

Help would be greatly appreciated!

