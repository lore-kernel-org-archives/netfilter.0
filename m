From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sun, 2 Oct 2005 09:22:20 +0200
Message-ID: <200510020922.21151.marek.zachara@conexe.pl>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<200510012131.32524.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510020403050.21519@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510020403050.21519@filer.marasystems.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 02 of October 2005 04:07, you wrote:
> On Sat, 1 Oct 2005, Marek Zachara wrote:
> > udp      17 23 src=10.0.0.250 dst=84.16.64.240 sport=4569 dport=4569
> > packets=13426 bytes=581092 [UNREPLIED] src=84.16.64.240 dst=10.0.0.250
> > sport=4569 dport=4569 packets=0 bytes=0 mark=0 use=1
>
> Then it is NAT:ed..
>
> Probably tcpdump gets fooled and shows you the packet as received.
>
> If in doubt try running the capture on a separate box connected with a hub
> to your "outside" connection. This will give you an exact picture of what
> the packets on the outside link looks like.
>
I also checked tcpdump on the next router in line (this one connects 
192.168.x.x to the internet) and still i see packets with source 10.0.0.250 
there

> > but still the packets dont get SNAT-ed:
> >
> > irongate:~# tcpdump -ni eth0 udp port 4569
> > tcpdump: verbose output suppressed, use -v or -vv for full protocol
> > decode listening on eth0, link-type EN10MB (Ethernet), capture size 96
> > bytes 21:26:22.239340 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP,
> > length: 12
>
> To me it looks like you are looking at the packets as they arrive from the
> internal network before SNAT. Nothing wrong in the above.
>
yes, you are right that was an internal interface. But the output on eth1 
looks exactly the same

Marek

