From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ipsec nat and iptables
Date: Fri, 26 Aug 2005 08:03:39 -0500
Message-ID: <200508260803.39600.rob0@gmx.co.uk>
References: <430DE371.7020206@datacenter1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430DE371.7020206@datacenter1.com>
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

On Thursday 2005-August-25 10:27, Info DataCenter1.com wrote:
> Network A
> eth0=  conected to internet
> eth1= conected to private lan 192.168.1.1
>
> Network B
> eth0 conected to Internet
> eth1= conected to private lan 192.168.2.1
>
>  >From server A I'm able to ping 192.168.2.1 and viceversa but
>  > computers in the private lan can't see the other side
snip
> iptables -A FORWARD -i eth1 -o eth0
> iptables -A FORWARD -i eth0 -o eth1

These rules do nothing.

> iptables -P FORWARD DROP

And then your policy drops that traffic.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

