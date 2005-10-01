From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 15:57:31 -0500
Message-ID: <200510011557.31500.rob0@gmx.co.uk>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510011859560.15331@filer.marasystems.com>
	<200510012003.35387.marek.zachara@conexe.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510012003.35387.marek.zachara@conexe.pl>
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

On Saturday 2005-October-01 13:03, Marek Zachara wrote:
> I'm trying to get asterisk IAX protocol to be routed properly. This
> is UDP packets destined for port 4569. I need them to be sent out
> from the box at eth1 with source 192.168.100.1 (internal net at eth0
> is 10.0.0.0/24)
>
> the nat/postrouting table looks like this (i waited for about 10
snip
> Any suggestions what i could be doing wrong?

This is asterisk running on the iptables box itself? Try nat/OUTPUT.

I won't guess. Post complete network topology information and your 
iptables-save output. Why do you want to NAT from one RFC 1918 address 
to another one? I bet there is a better way to do this. I don't have 
any trouble with IAX/IAX2 behind NAT.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

