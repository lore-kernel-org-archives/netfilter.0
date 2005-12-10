From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: FORWARD Chain Question
Date: Sat, 10 Dec 2005 10:15:58 +0200
Message-ID: <439A8EBE.3030505@gmail.com>
References: <BOEKIIIKCIBKDMDMHHLLIEPHDEAA.gene@poh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BOEKIIIKCIBKDMDMHHLLIEPHDEAA.gene@poh.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Gene Dellinger wrote:

>On a multi-homed machine being used as a firewall, if
>a packet is forward'd from one interface to another.
>Does the packet enter the in at PRE-ROUTING portion of iptables
>chain again for that interface? It may seem obvious but
>I just want to make sure I am clear on that aspect of the
>chain traversal.
>
>Thanks
>Gene D.
>
>
>  
>
Actually yes, the first chain that it hits is the PREROUTING chain of 
the mangle table.

ref: 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES


regards,
Georgi Alexandrov

