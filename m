From: Martijn Lievaart <m@rtij.nl>
Subject: Re: installing ipsets
Date: Sun, 22 Oct 2006 12:45:42 +0200
Message-ID: <453B4BD6.8080003@rtij.nl>
References: <200610220105.15805.linux@shadypond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200610220105.15805.linux@shadypond.com>
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
To: Pollywog <linux@shadypond.com>
Cc: netfilter@lists.netfilter.org

Pollywog wrote:

>I am running Debian Sarge and I have just installed iptables following the 
>instructions at http://ipset.netfilter.org/   This documentation does not say 
>whether I need to remove the iptables package provided by Debian, but I would 
>guess this is necessary.  It appears the iptables version I downloaded from 
>the ipsets homepage is a newer version of iptables than what is present in 
>Debian Sarge but if I remove the Debian iptables package, I will need to put 
>a dummy package in its place so as not to cause shorewall to be removed.
>
>Does the old package need to be removed?
>  
>

You can install the new package next to the old one (f.i. in /usr/local) 
but I would look at packaging the new version. As you have the old 
package, this should be relatively trivial.

M4


