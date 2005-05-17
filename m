From: "Steve Melo" <lists@communitytrust.ca>
Subject: Re: udp connection tracking
Date: Tue, 17 May 2005 15:09:14 -0400
Message-ID: <003301c55b13$eae37a90$3c01a8c0@ts.communitytrust.ca>
References: <005b01c55af6$1db40980$3c01a8c0@ts.communitytrust.ca>
	<428A2195.8090308@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Grant,

Firstly thank you for your reply!

Currently i have a rule in my firewall that DNATS to the client machine,
I'm guessing that i will also need to DNAT that single packet but im not
sure where to place the rule.
could i use the two rules you gave me with this additional one:

iptables -t nat -A PREROUTING -i ${INet} -p udp -m recent --rcheck --seconds
60 --name WSWE8 -- source -j DNAT --to-destination $CLIENT_IP

thank you again,

-steve



