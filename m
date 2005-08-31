From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: macro & iptables
Date: Wed, 31 Aug 2005 09:23:17 -0500
Message-ID: <200508310923.17998.rob0@gmx.co.uk>
References: <20050831141346.53535.qmail@web53301.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050831141346.53535.qmail@web53301.mail.yahoo.com>
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

On Wednesday 2005-August-31 09:13, Agung wrote:
> let say... i have lists of ip in /etc/iplist.txt
> is it possible to call that list, like perhaps in pf
> table <ip> persist file "/etc/iplist.txt" ?

Not to my knowledge. I don't think that design is as robust. iptables 
works entirely in the kernel memory. You can actually crash the OS, but 
the netfilter code will continue passing packets.

> or i should use some bash scripting ?

Yes:
#OPTIONS and TARGET must be set
while read IP ; do
    iptables $OPTIONS $IP $TARGET
done < /etc/iplist.txt

> thank you for your assistance :-)

np
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

