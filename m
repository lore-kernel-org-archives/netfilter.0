From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Allowing access only some sites - onely some mac address
Date: Tue, 30 Aug 2005 12:22:46 -0500
Message-ID: <431495E6.30205@riverviewtech.net>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FD017@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FD017@farmer.vikus.com>
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

> You may also want to consider getting arpwatch. arpwatch will tell you when a particular user changes their MAC address. MAC spoofing, while more difficult than IP spoofing, is still fairly trivial and particularly in this case where you are using a "blacklist" approach for filtering MACs. So if I'm the one with MAC 00:D8:02:D8:C8:DF and I want to get around your rules, I'll get a utility to change my MAC to something that won't trigger your firewall rule, like 10:D8:02:D8:C8:DF, which I can be sure won't collide with another MAC for quite some time.
> 
> If the particular users you are trying to filter for aren't very technical then I wouldn't worry but after two years of being a lab assistant/server admin for a network security class I tend to be a little paranoid. =)

You are absolutely correct.  So my immediate response to this is do the exact opposite, have the MAC of the computers that are allowed to access any thing other than the sites in question.  As far as needing ARP watch to look for changes in IP, you could watch for the MAC and IP pair of allowed systems.  Sure people could still get around this but they will be breaking other things too.



Grant. . . .

