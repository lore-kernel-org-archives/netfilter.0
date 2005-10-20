From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Forwarding PPPOE packets through Linux Router
Date: Thu, 20 Oct 2005 14:09:37 -0500
Message-ID: <200510201409.37633.rob0@gmx.co.uk>
References: <20051020074231.46712.qmail@web31504.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051020074231.46712.qmail@web31504.mail.mud.yahoo.com>
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

On Thursday 2005-October-20 02:42, pravin rane wrote:
> Desktop machines dial a PPP connection over ethernet
> (PPPOE)to log on to some trusted Network. Some how
> Linux Rouer dont forward PPPoE request further.
>
> When I configure this router in Birdge mode then these
> machines are able to connect and succssfully logs on
> net Network
>
> I tried to MASQUERADE all traffic but it didnt worked

Is there a question in this? Yes, you are correct. PPPoE takes place at 
layer 2, iptables operates at layer 3 as a TCP/IP controller. PPPoE is 
not TCP/IP. Set up as a bridge and you can do it. Use ebtables to 
control the bridged traffic.

http://en.wikipedia.org/wiki/PPPoE
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

