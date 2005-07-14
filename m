From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: Doubt about forwarding. Please, Help me!
Date: Thu, 14 Jul 2005 20:46:51 +0200
Message-ID: <42D6B31B.9010902@fastwebnet.it>
References: <20050714184051.CE18E6F027@ws1-5.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050714184051.CE18E6F027@ws1-5.us4.outblaze.com>
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
To: Morales Carlos <cmmorales@mail.com>
Cc: netfilter@lists.netfilter.org

Morales Carlos wrote:

>Hello. I have a firewall blocking all the traffic from the Internet to my local network, but I need to let an external host (extHOST) to access the port 8888 (for example) of an internal host (intHOST). Is this correct? The external lan adapter is eth1.
>
> /sbin/iptables -t nat -A PORTFW -p tcp -i eth1 -s extHOST --dport 8888 -j DNAT --to-destination intHOST:8888
>
>Thaks, please email me to cmmorales@mail.com 
>Carlos
>
>
>
>
>  
>
As long as in PREROUTING Chain of nat table there is a JUMP to PORTFW it
is ok.

What you need is to have a DNAT in nat table PREROUTING chain , and a
rule to allow traffic to the DNATTED dst port 8888 in the filter table
FORWARD chain.

Bye
Francesco

