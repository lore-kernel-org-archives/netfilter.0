From: "Steven Mugassa" <steven.mugassa@intafrica.com>
Subject: RE: Help- can't ftp
Date: Fri, 30 May 2003 11:40:54 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c32687$2fb7f010$0223a8c0@satconet.com>
References: <3ED163DC.9060108@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3ED163DC.9060108@snapgear.com>
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
To: 'Philip Craig' <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Thanks for your advice,

I have now loaded the ftp conntrack and nat modules and it is now working
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

Nevertheless, the problem i'm getting now is that after sometime then i do
the 'lsmod command', i don't see the two modules anymore(they disappear
after sometime, don't know exactly after how many hours but it is like if i
load today, the next day the modules disappear)

Please advice,
Thanks,
Steven

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Philip Craig
Sent: Monday, May 26, 2003 3:46 AM
To: Steven Mugassa
Cc: netfilter@lists.netfilter.org
Subject: Re: Help- can't ftp


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


