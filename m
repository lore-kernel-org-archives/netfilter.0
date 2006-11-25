From: Tommy W <tommy@svearike.sytes.net>
Subject: Re: iptables MAC problem
Date: Sat, 25 Nov 2006 10:00:53 +0100
Message-ID: <200611251000.53462.tommy@svearike.sytes.net>
References: <c31bf6690611250010i7b922bd2te31a7a1308c96450@mail.gmail.com>
Reply-To: tommy@svearike.sytes.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c31bf6690611250010i7b922bd2te31a7a1308c96450@mail.gmail.com>
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

On Saturday 25 November 2006 09:10, alok pathak wrote:
> I am using CentOS3.8 (with kernel version 2.4.21-47.EL, iptables
> version 1.2.8-12.3, on AMD sampron x68_64).  I want to restrict my
> users based on their MAC, and used the command:
>
> # iptables -A INPUT -m --mac-source 12:12:12:12:12:12 -j DROP

It should be like this I recon

 # iptables -A INPUT -m mac --mac-source 12:12:12:12:12:12 -j DROP

