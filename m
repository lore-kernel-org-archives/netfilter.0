From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables as DHCPD
Date: Thu, 15 Mar 2007 21:06:41 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703152106180.1199@yvahk01.tjqt.qr>
References: <001001c7672c$31034bb0$7100000a@W2KMPLOURDE>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001001c7672c$31034bb0$7100000a@W2KMPLOURDE>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Plourde <mplourde@digicom.ca>
Cc: netfilter <netfilter@lists.netfilter.org>


On Mar 15 2007 13:03, Michael Plourde wrote:
>
>is it possible to use iptables as dhcpd ? I mean:

Genereally no, since some addresses are encoded in the l7 payload,
and I do not know of any module to handle that.


Jan
-- 

