From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Help! Windows vpn through iptables
Date: Thu, 23 Jun 2005 07:21:36 -0500
Message-ID: <200506230721.36735.rob0@gmx.co.uk>
References: <000f01c57796$c65d2500$320aa8c0@home.mixvision.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c57796$c65d2500$320aa8c0@home.mixvision.net>
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

On Wednesday 22 June 2005 20:56, Kimi Sato wrote:
> VPN connection to Windows 2000 RAS works within iptables without a
> problem. Iptables has TCP port 1723 and protocol 47 open, the same
> way as other ports such as 80, 25, 443.

INPUT or FORWARD? Is the PPTP server running on the firewall machine 
itself?

> When I try PPTP vpn from outside of iptables using windows vpn
> client, it hangs at verifying user name and password.  I don't have

And the logs say ... ? I bet this is a pptpd or pppd issue.

> any other ports open.  Do I need to open some other ports in order
> for vpn connection to go through iptables? Any input will be

1723/tcp and GRE should be accepted for the PPTP server. That's all 
(except of course the outbound traffic must be allowed too.)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

