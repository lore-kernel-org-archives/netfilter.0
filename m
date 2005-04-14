From: "Dr.Chandra" <dr.chandra@telenet.be>
Subject: Re: IPv4 to IPv6
Date: Thu, 14 Apr 2005 15:17:58 +0200
Message-ID: <1113484678.8412.1.camel@creative.angels.be>
References: <7faad17f050414051777aa04ec@mail.gmail.com>
Reply-To: dr.chandra@telenet.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7faad17f050414051777aa04ec@mail.gmail.com>
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
To: Nuno Amorim <na.amorim@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

I assume you'll need a service to do the ipv4-6 translation, besides
that you're just back to ip's and ports.

J.L.

Op do, 14-04-2005 te 13:17 +0100, schreef Nuno Amorim:
> Hello!
> 
> 
> What I want to do is in a box where I receive some UDP streams, do a
> "NAT" where the output is going to be IPv6 multicast. This is only one
> way, so no return traffic. Each udp port is translated to an IPv6
> multicast address.
> 
> Is this possible in iptables?
> 
> Thanks in advance.
> 
> Nuno
> 

-- 
Dr.Chandra <dr.chandra@telenet.be>
cyber.angels.be


