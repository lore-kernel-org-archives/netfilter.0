From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP MASQ and IPROUTE2?
Date: Tue, 15 Oct 2002 16:52:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210151552.g9FFqFL23935@vulcan.rissington.net>
References: <001101c273f5$fc2c5220$c300a8c0@COMPAQ> <01d201c27444$113613b0$6e69690a@rimas> <015401c2745b$777be750$f800a8c0@COMPAQ>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015401c2745b$777be750$f800a8c0@COMPAQ>
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

On Tuesday 15 October 2002 3:59 pm, Sean Oh wrote:

> Rimas,
> 
> I tried what you said, but I stil can not access the server using ip
> addresses of eth1 and eth2.
 

1. What does a traceroute show from one of the machines which is unable to 
contact the outside world ?

2. Can you run ethereal or similar on either eth0 or whichever of your 
external interfaces you expects the packets to exit from, to see whether 
traffic is getting routed / NATted appropriately ?

3. Try adding a LOG rule to your FORWARD chain to see what seems to be going 
through the firewal, and which route/s the packets are trying to take 
(FORWARD comes after the routing decision, so you should see both in= and 
out= interfaces shown in the log entries).

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

