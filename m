From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: question about iptables
Date: Sun, 2 Mar 2003 15:45:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030302154537.0982e706.arnt@c2i.net>
References: <BAY2-F97bJeQvFFleSI00046a04@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F97bJeQvFFleSI00046a04@hotmail.com>
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

On Thu, 27 Feb 2003 19:23:33 -0500, 
"subramoni padmanabhan" <smoni77@hotmail.com> wrote in message 
<BAY2-F97bJeQvFFleSI00046a04@hotmail.com>:

> Hi,
> 
>    I have a question about the use of iptables. I am working on a
>    project in 
> which I have to capture packets. Does iptables allow non-obtrusive
> packet capture? For example, if there is a router between A and B and
> when I send a packet from A to B, the router is supposed to make a
> copy of the packet going through it and send that copy to another
> node, say C without altering the packet going to B. So in effect the
> packet becomes two at the router and one goes to C and the original
> one goes to B. Is there provision in iptables to do such a thing?
> Also, can I capture packets based on the data fields inside the packet
> rather than on the fields in the packet header? If so, please let me
> know how. Any response would be greatly appreciated. Thanks.
> 
> Subramoni Padmanabhan
> G-126, 700 woodland avenue
> Lexington, Kentucky 40508
> Phone : 859 323 9405

..you can do this with tcpdump thru ssh, 'info tcpdump' for details.
(I assume you control the router you use to sniff traffic from.)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



