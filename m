From: Simone Leggio <simone.leggio@cs.helsinki.fi>
Subject: Re: IP TOS based routing
Date: Thu, 27 Mar 2003 09:32:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E82A91F.7000108@cs.helsinki.fi>
References: <3E80187B.5030209@cs.helsinki.fi> <200303261316.35019.kimj@dawn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kim Jensen <kimj@dawn.dk>
Cc: netfilter@lists.netfilter.org

Kim Jensen wrote:
 > On Tuesday 25 March 2003 09:51, Simone Leggio wrote:

 >>I'd like to know whether it is possible, and if so how, with traffic
 >>control to set filters so that packets with TOS 46 are sent to host B
 >>via eth0 and packets with TOS 26 via eth1.

 >
 > Hi Simone,
 >
 > Try to use the mangle table to mark your packets which match a 
specific TOS,
 > and then add a second routing table with the alternative default 
connection.
 > That should work. You can find more info on:
 >
 > http://linux-ip.net/html/adv-multi-internet.html
 > http://www.ssi.bg/~ja/nano.txt
 >
 > /Kim

Hi Kim,

thanks for the answer.
At the moment I have a test network where I send traffic from host A to 
host B generating it with a proper traffic generator (for example MGEN), 
which allows also to set the DS (or IP TOS) field.
Does iptables understand the value set before with the traffic generator 
or I have to set the field with the mangle table?
What I was thinking to type to discriminate the output interface was:

iptables -A FORWARD -p tcp -m tos --tos TOS -o INTERFACE -j ACCEPT

With TOS equal to the value set by the traffic generator. Would it work?

	Simone.





