From: Bill McCormick <wpmccormick@sbcglobal.net>
Subject: one interface, basic setup
Date: Wed, 20 Jul 2005 21:38:06 -0500
Message-ID: <42DF0A8E.9020102@sbcglobal.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm just getting started with iptables and after reading the HOWTO's 
(basic and packet filtering) I still feel unsure. I want to build a FW 
for outgoing packets only. My setup looks like this:

internet <---->Netgear FVS318 <----> LAN

Where LAN is a Linux FC3 and several Windows machines. The router closes 
all outbound traffic except from the FC3 box. Currently, Windows 
machines DHCP from the router, so that is the gateway, and proxy out 
through squid et. al. on FC3. I'll move the DHCP service to FC3 and make 
that the gateway. I want the FC3 gateway to allow all outbound traffic 
from squid; destination ports might be more than HTTP. I also want to 
allow outbound SMTP and POP to a specific destination only. FC3 is also 
providing services http, telnet, ftp, ssh, smtp, imap/imaps and 
pop/pop-ssl. Eventually, I'll want to do a transparent proxy as well.

So it looks like I want both the INPUT and OUTPUT chains to ACCEPT all 
and I should build rules in the FORWARD chain. With only one interface, 
is that correct?

Thanks,

Bill



-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.9.2/52 - Release Date: 7/19/2005


