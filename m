From: Ted Phelps <phelps@gnusto.com>
Subject: Re: Iptables problem
Date: Fri, 26 Jan 2007 09:55:59 -0600
Message-ID: <5085.1169826959@laika.gnusto.com>
References: <9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com>
	<4587.1169819624@laika.gnusto.com>
	<9c9832d0701260617m1393f7b4gf8b94985a641adf6@mail.gmail.com>
	<27132.1169824672@laika.gnusto.com>
	<9c9832d0701260749r8093a6p5d47aca6a840e5dd@mail.gmail.com>
Reply-To: support@mantara.com
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Fri, 26 Jan 2007 21:19:11 +0530. 
	<9c9832d0701260749r8093a6p5d47aca6a840e5dd@mail.gmail.com> 
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
> Can you guide me how to set up TCP dump on RHEL 4 and test.

I'm afraid I don't use Red Hat Linux or RPMs so I'm not going to be able
to help you instal tcpdump.  There's a good chance that it's installed
by default, though.  To run it and monitor DNS traffic, do this:

    tcpdump port 53
 
> Can u explain this more so that I will calculate that..
> 
> "  packet counts for each rule, which
>  should help you to determine which rule is dropping or failing to
>  forward the DNS packets."

(1) Run iptables -v -L
(2) Look at the rules you believe should match UDP traffic on port 53
    between trench1 and 212.165.108.4.  Note the number of packets which
    have matched these rules.
(3) Run nslookup
(4) Run iptables -v -L again
(5) Look at the rules you believe should match UDP traffic on port 53
    between trench1 and 212.165.108.4.  Note the number of packets which
    have matched these rules.
(6) Compare the numbers from steps (2) and (5) to see if they've
    changed.  If not then the rules aren't doing what you think they
    are.

You may find a command like the following helpful:

    watch iptables -v -L

Cheers,
-Ted

