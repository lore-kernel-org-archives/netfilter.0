From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: IP issue
Date: Wed, 23 Nov 2005 16:46:50 -0500
Message-ID: <1132782410.5346.35.camel@localhost>
References: <20051123205900.47993.qmail@web30007.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051123205900.47993.qmail@web30007.mail.mud.yahoo.com>
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
To: Thamara Wanigatunga <thamara_w@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2005-11-23 at 12:58 -0800, Thamara Wanigatunga wrote:
> Dear Gurus,
> 
> I need to have 4 web servers behind a iptables packet
> filter, could i achive this through alised ips. Or
> what could you recomend. Please help ..
> 
<snip>
I assume you want each to have a unique public IP and perform NAT on the
iptables firewall.  If that is the case, One typically adds the NAT
rule(s), the access control rules in the FORWARD chain and binds the IP
address to the public interface of the iptables firewall using iproute2.
There is a slide show training session about using iproute2 in the
training section of http://iscs.sourceforge.net
Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


