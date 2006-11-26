From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: iptables MAC problem
Date: Sun, 26 Nov 2006 11:05:15 -0800 (PST)
Message-ID: <962922.35634.qm@web56202.mail.re3.yahoo.com>
References: <200611251000.53462.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611251000.53462.tommy@svearike.sytes.net>
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
To: tommy@svearike.sytes.net, netfilter@lists.netfilter.org

Hi all, 

I think dual homed machine ( two NICs...one for
internal network and one for external network ) 

using next rule you will restict  particular user to
access to internet
iptables -A FORWARD -m mac --mac-source
XX:XX:XX:XX:XX:XX -j DROP

XX:XX:XX:XX:XX:XX represent MAC address of host you
want to block
Using the same logic you can implement rules to forbid
a host to access particular part of your network, some
services an so on.
The useful place to visit and read material there is 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Regards 

--- Tommy W <tommy@svearike.sytes.net> wrote:

> On Saturday 25 November 2006 09:10, alok pathak
> wrote:
> > I am using CentOS3.8 (with kernel version
> 2.4.21-47.EL, iptables
> > version 1.2.8-12.3, on AMD sampron x68_64).  I
> want to restrict my
> > users based on their MAC, and used the command:
> >
> > # iptables -A INPUT -m --mac-source
> 12:12:12:12:12:12 -j DROP
> 
> It should be like this I recon
> 
>  # iptables -A INPUT -m mac --mac-source
> 12:12:12:12:12:12 -j DROP
> 
> 



 
____________________________________________________________________________________
Want to start your own business?
Learn how on Yahoo! Small Business.
http://smallbusiness.yahoo.com/r-index

