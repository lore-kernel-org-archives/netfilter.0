From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 13 Jan 2004 10:51:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074009062.5742.222.camel@grendel>
References: <3FFA5EBD.1000701@aros.net> <1073388187.2047.250.camel@grendel>
	 <4003A62B.7020108@aros.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4003A62B.7020108@aros.net>
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
To: Scott Hall <halls@aros.net>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-01-13 at 03:02, Scott Hall wrote:
> So the one question that this whole issue raises in my mind is, Isn't 
> there anyway to handle the (DF) packets differently?

Absolutely. Config the stacks on both ends of the connection to _not_
set DF. This will cause the router at the MTU border to frag the packets
and will not require an ICMP error packet.

> I ask 
> becuase we have two cisco routers and 6 Adtran routers that handle this 
> same scenario quietly. 

I'm guessing if you check the decodes from those packets you will see
the public rather than the private IP embedded in the payload. I think
this is what is killing you. This is an old Netfilter bug that I
*thought* was fixed ages ago.

HTH,
C



