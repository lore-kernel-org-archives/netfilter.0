From: David Cannings <lists@edeca.net>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 13:31:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407291331.54691.lists@edeca.net>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de> <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 29 July 2004 13:14, david wrote:
> My mail server received so many virus mails from ip 202.145.10.147 and
> after i look at gateway (linux) and i using iptraf i see so many
> traffic from 202.145.10.147.
> After that i try to block all traffic from 202.145.10.147 with command
> : #iptables -A INPUT -s 202.145.10.146 -j DROP

Two suggestions:

- You might like to also put that in your FORWARD chain:
  # iptables -I FORWARD -s 202.145.10.146 -j DROP
- Use -I instead of -A, this will INSERT at the top of the list instead of 
APPENDING to the bottom.

Check the output of `iptables -L -vxn` (which you could paste relevant 
bits of into your email, if necessary) and see if there are any other 
ACCEPT rules in your INPUT chain that would allow packets from that IP 
before your rule that denies them.

David

