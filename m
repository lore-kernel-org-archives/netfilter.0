From: Ted Phelps <phelps@gnusto.com>
Subject: Re: DMZ problems
Date: Fri, 26 Jan 2007 05:13:11 -0600
Message-ID: <26955.1169809991@laika.gnusto.com>
References: <45B12F3B.5020306@aa.usno.navy.mil> <45B61EAB.1040706@pason.com>
	<45B92D91.8070500@aa.usno.navy.mil>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Thu, 25 Jan 2007 17:22:09 EST. 
	<45B92D91.8070500@aa.usno.navy.mil> 
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

Bill Tangren writes:
> Let's say I've been allocated 199.202.112.127/28 (these are made up addresses) 
> by my ISP, and I'm told to netmask as 255.255.255.0. Let's say I assign my 
> firewall the IP address of 199.202.112.130 with a netmask of 255.255.255.0 as 
> required.> # ping 199.202.112.132
> Destination host unreachable
> 
> but
> 
> # ping -I eth1 199.202.112.132
> 
> works.

Try using 255.255.255.240 as your netmask instead?

Cheers,
-Ted

