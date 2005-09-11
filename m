From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Is SIP 2.0 support available in IP-table
Date: Sun, 11 Sep 2005 06:48:27 -0500
Message-ID: <200509110648.27830.rob0@gmx.co.uk>
References: <20050909230545.5504737E42@smtp4-1-sn2.hy.skanova.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050909230545.5504737E42@smtp4-1-sn2.hy.skanova.net>
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

On Friday 2005-September-09 18:05, Yuwei Zhao (Wei) wrote:
> Does IP-table support SIP 2.0 so I can put a SIP-telephone behind it?

This hasn't been revised in almost 2 years, but ...
http://www.netfilter.org/documentation/FAQ/netfilter-faq-1.html#ss1.8

There are many good workarounds, if NAT is the problem. You could use 
VPNs with RFC 1918 IP addresses, for one thing. Another possibility is 
local Asterisk servers on both ends of your voice connection. They can 
communicate via the NAT-friendly IAX protocol, and your SIP clients 
register with their local Asterisk.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

