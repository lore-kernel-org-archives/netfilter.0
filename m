From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to setup netfilter to stop outbound DHCP?
Date: Sun, 29 Feb 2004 20:07:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402292007.01882.Antony@Soft-Solutions.co.uk>
References: <001001c3fefd$daf70a70$6401a8c0@LSchmitt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c3fefd$daf70a70$6401a8c0@LSchmitt>
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

On Sunday 29 February 2004 7:54 pm, Dr. Lawrence J. Schmitt wrote:

> I am setting up a lab for students to configure and experiment with
> Linux.  I need to set up something that will keep responses to DHCP
> requests from leaving the lab to keep from driving the network support
> people crazy.

> 	1.  What is the appropriate tool to use?

A router.   DHCP doesn't cross network boundaries.

> 	2.  Can anyone suggest an iptables rule that will block either
> dhcp 		requests from entering the lab subnet or responses from
> exiting.

Well, since the machine running netfilter (onto which you put your rules) is 
going to have to have one subnet on one side, and another subnet on the 
other, the precise rules you use don't much matter - the system will very 
satisfactorily block DHCP for you.

> 	3.  I would like to set up one pc running Linux as a router and
> firewall, filter that also would run DHCP and DNS for the local
> lab as well as block responses to DHCP requests on the nic that
> is connected to the campus network.

I think if you set up such a PC as a router and firewall, you won't have a 
DHCP problem, simply because DHCP doesn't get routed.

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


