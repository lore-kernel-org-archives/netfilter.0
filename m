From: Ted Phelps <phelps@gnusto.com>
Subject: Re: Iptables problem
Date: Fri, 26 Jan 2007 09:17:52 -0600
Message-ID: <27132.1169824672@laika.gnusto.com>
References: <9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com>
	<4587.1169819624@laika.gnusto.com>
	<9c9832d0701260617m1393f7b4gf8b94985a641adf6@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Fri, 26 Jan 2007 19:47:03 +0530. 
	<9c9832d0701260617m1393f7b4gf8b94985a641adf6@mail.gmail.com> 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi Saurabh,

"Saurabh Mehrotra" writes:
> Please find output of
> 
> iptables -v -L

I'm afraid I'm not clever enough to comprehend what your rules are
trying to do.  Also, I don't know what the IP address of trench1 is nor
where the firewall is located in the network, so it's difficult to see
which rules would be involved.

The likely cause of your problem is that the DNS request or its reply is
being dropped by your firewall.  The easiest way to see which is
happening is to have tcpdump listen to port 53 on 212.165.108.4 to see
if the request is coming in and if a reply is going out.

The iptables output you sent has packet counts for each rule, which
should help you to determine which rule is dropping or failing to
forward the DNS packets.

Hope that helps,
-Ted

