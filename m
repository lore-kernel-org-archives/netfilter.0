From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What is missed for port forwarding
Date: Sun, 7 Mar 2004 16:02:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403071602.25190.Antony@Soft-Solutions.co.uk>
References: <20040306183657.GB836@glorybox.de> <200403070953.52863.Antony@Soft-Solutions.co.uk> <20040307154907.GA1978@glorybox.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040307154907.GA1978@glorybox.de>
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

On Sunday 07 March 2004 3:49 pm, Kai Weber wrote:

> * Antony Stone <Antony@Soft-Solutions.co.uk>:
> > Are you testing both SSH/10143 and HTTP/8888 from the same client machine
> > out on the Internet?
>
> Thanks for the tip. It works from outside. I tested only from "inside".
>
> Why does DNAT not work when trying from inside?

See my sig below.

Client (eg 192.168.1.10) connects to firewall on192.168.1.250.
Firewall DNATs the packet and sends it to 192.168.1.2
192.168.1.2 replies to 192.168.1.10, which is on the local network, therefore 
reply doesn't go through the firewall, therefore no reverse NAT takes place.

Result: 192.168.1.10 sent a packet to 192.168.1.250 and got a reply from 
192.168.1.2.

Confused unhappy client.

See also http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


