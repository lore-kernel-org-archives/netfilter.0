From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: SNAT issue for locally generated UDP packet
Date: Wed, 15 Jun 2005 08:57:01 -0500
Message-ID: <200506150857.01210.rob0@gmx.co.uk>
References: <42AF37B4.8080000@foundrynet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42AF37B4.8080000@foundrynet.com>
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

On Tuesday 14 June 2005 15:01, Baskaran Mohandass wrote:
> I am trying to source nat the packet generated locally using
> iptables. Machine is running Fedora core2 and one of the interface
> address is 5.5.5.7.  Sip server sends a packet with source port 5060
> and ip address 5.5.5.7. I want to change the IP address and the
> source port when it goes out.

Change the source IP to what? Change the source port to what?

> Reading the IPtables manual only rule i 
> can think of is iptables -t nat -A POSTROUTING --protocol udp
> --source-port 5060  -j SNAT --to-source 5.5.5.7:1024-32000.

That's the same IP.

> this. If there is any patch available for this I am ready to try.

Describe better what it is you need to do, and I bet your answer is in 
the man page.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

