From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: Problem configuring masquerading Gateway on RedHat 9.0...
Date: 07 Aug 2004 14:53:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091870585.1624.5.camel@joel.d2visp.com>
References: <20040806064404.96275.qmail@web50209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040806064404.96275.qmail@web50209.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Rajesh..

The commands u r following is correct.

From internal client machine test the following things.

1) ping www.yahoo.com
if it tells unknown host then u need to put the correct primary and
secondary dns in the client machine.

2) Secondly check your /etc/resolv.conf wheather it has correct primary
and secondary dns server.

If you can ping from client www.yahoo.com then ....

1) are u using squid or something ????

if u r using squid something is wrong in squid.conf

Regards,

On Fri, 2004-08-06 at 12:14, Rajesh Pethe wrote:
> Dear Sirs,
> 
> As mentioned in the 'NAT-HOWTO' I've done the
> following to configure my Linux box as masquerading
> gateway for internal network :
> #iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> and
> #echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> The problem is I can ping or telnet a remote host from
> an internal network but browsers say 'unknown host'
> when I try to load a remote site.
> 
> Please help me with this problem.
> 
> Regards
> Rajesh
> 
> 
> 
> 		
> _______________________________
> Do you Yahoo!?
> Express yourself with Y! Messenger! Free. Download now. 
> http://messenger.yahoo.com
-- 
Joel N.Solanki
Network Administrator
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)




