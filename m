From: Ted Phelps <phelps@gnusto.com>
Subject: Re: Iptables problem
Date: Fri, 26 Jan 2007 07:53:44 -0600
Message-ID: <4587.1169819624@laika.gnusto.com>
References: <9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Fri, 26 Jan 2007 16:49:25 +0530. 
	<9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com> 
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

"Saurabh Mehrotra" writes:
> I am using Red Hat Enterprise Linux AS release 4 (Nahant Update 3) with
> Kernel 2.6.9-34.ELsmp #1
> 
> I am using Iptables for firewall .
> 
> But without firewall I m able to nslookup my own DNS server but whenever I
> enabled firewall I am not able to nslookup to my own system.

It sounds like your firewall is blocking DNS traffic.

You'll have to show us your firewall rules if we're going to be able to
help you:

    iptables -v -L

Cheers,
-Ted

