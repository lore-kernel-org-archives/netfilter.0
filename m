From: "Curby ." <kirbysdl@hotmail.com>
Subject: ip aliasing considered harmful?
Date: Mon, 10 Jan 2005 06:46:59 +0000
Message-ID: <BAY101-F28F59D9C013C228CBEAFC8DF970@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've currently got two Internet-facing IP addresses on my gateway using a 
single interface.  I have them configured as eth0:0 and eth0:1, but I've 
read several times on this list that doing it this way (I think it's called 
aliasing?) is not recommended.  IIRC the recommended alternative was to use 
the ip command to handle it.

Why is that alternative preferable?  The only thing I can see now is that 
I'd have to double the number of iptables rules in some cases to take care 
of eth0:0 and eth0:1 instead of just eth0.  If i use ip, can I simply point 
all rules to eth0 instead of eth0 and eth0:1?

Lastly, are there any downsides at all for doing it with ip?  For example, 
eventually I'll want to SNAT and DNAT packets based on whether they're 
related to one Internet-facing IP or another, and I just want to make sure 
that would still be possible.  Thanks!

--curby



