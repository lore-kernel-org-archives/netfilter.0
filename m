From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Performace problems with NAT
Date: Fri, 25 Oct 2002 15:46:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210251446.g9PEkUe06183@vulcan.rissington.net>
References: <1035554190.24028.19.camel@ITS-Sevcik>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035554190.24028.19.camel@ITS-Sevcik>
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

On Friday 25 October 2002 2:56 pm, Berndt Sevcik wrote:

> I am using a combination of source based routing with iproute2 and nat
> (iptables 1.2.6a-5). The problem I cant use the full performance of our
> line. We have a 10MBit line and i can only use about 2MBit, and not a
> fault of our ISP.

Okay, knowing that your line is 10Mbit adds some more information.

1. How do you know the problem is not with your ISP ?   Can you download at 
10Mbit under any circumstances ?

2. What makes you think is it NAT which is causing the performance problem ?  
Does the problem go away if you do not use NAT ?

3. How busy is your box (what load average does uptime show) ?

4. Are you getting any kernellogging messages about conntrack table full etc ?

5. What speed CPU / how much memory is in the netfilter machine ?

Antony.

-- 

This is not a rehearsal.
This is Real Life.

