From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Thu, 11 Aug 2005 09:07:00 -0400
Message-ID: <20050811130700.GA15463@bostoncoop.net>
References: <20050809012914.GA23108@bostoncoop.net>
	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
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
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On Thu, Aug 11, 2005 at 07:42:30AM +0200, Jan Engelhardt wrote:
> >Subject: Transparent proxy where source IP address remains unchanged --
> >    possible?
> Check Balabit TPROXY. To retain the source address however, you need to patch 
> the application that initiates the second part. In your case, the sshd on 
> faketarget.

Maybe I should explain what I'm trying to accomplish to see if this is
the right (or a possible) way to go about it.

I'm relocating a web/email/ssh server from one location to another (and
consequently to a new IP).  Since it's going to take many hours for the
IP address changes to propagate across DNS, I'd like to put a proxy box
in place at the old location that simply redirects all packets to the new
location. I would prefer for the new location to see the original source
IP address, rather than the IP address of the proxy.

Why do I need to patch sshd on faketarget? What I'm trying to do is just
send all the packets to realtarget, essentially untouched (other than the
destination IP).  I don't understand why sshd on faketarget would even be
involved...?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

