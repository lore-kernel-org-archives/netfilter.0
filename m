From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: bad packets crash firewall.
Date: Mon, 06 Jun 2005 10:36:30 -0500
Message-ID: <42A46D7E.4020805@gmx.co.uk>
References: <42A4674C.30102@caris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A4674C.30102@caris.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Peter Marshall wrote:
> I am not sure if this is related to bad packets, a bad pptp patch, poor 
> kernal .. I am at a loss.

And we, the list, probably more so. :)

> I haev a firewall iptables on FC3.  It was reciently pached to include 
> support for pptp.  When one of the users (who has a linux desktop) tries 
> using pptp, the firewall crashes .. (the entire box panics).  Any ideas 
> how one user could bring the firewall down .. I need to fix this somehow

Is the firewall machine the one running pptpd? If so then your 
assumption that it was "bad packets" hitting netfilter would appear 
premature. Check your logs, do debugging of the more likely suspect, pptpd.

> .  THis problem does not appear when windows users attempt to use pptp.

And do yourself another favour ... dump PPTP. It's lousy and inherently 
not secure. OpenVPN ( http://openvpn.net/ ) beats it in every way. The 
only limitation is that it won't work with old DOS-based Windows 
versions, but then, it's rather reckless to support those in a business 
setting anyway IMO.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

