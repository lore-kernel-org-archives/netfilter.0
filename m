From: Philip Craig <philipc@snapgear.com>
Subject: Re: Help- can't ftp
Date: Mon, 26 May 2003 10:46:20 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ED163DC.9060108@snapgear.com>
References: <000001c3210b$62dbba70$0223a8c0@satconet.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Mugassa <steven.mugassa@intafrica.com>
Cc: netfilter@lists.netfilter.org

Steven Mugassa wrote:
> I have got Windows machines behind a Red Hat 9.0 Linux router (with SNAT +
> CIPE-VPN). The problem i'm getting is that the machines behind that router
> can't open ftp sites. The error message is "__ Invalid PORT command" (and
> for some sites there is one more error message " __ command not
> understood"). However, the router itself can open ftp sites. 
> 
> Can this be a problem with ip_conntrack or something else? 

Have you loaded the ftp conntrack and nat modules?

/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


