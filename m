From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: delete NAT conntrack entry.
Date: Thu, 10 May 2007 07:14:03 -0400
Message-ID: <20070510111403.GA27624@animx.eu.org>
References: <000a01c792d2$3e07e240$8f0ba8c0@swparkt1>
	<Pine.LNX.4.61.0705101150510.32349@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0705101150510.32349@yvahk01.tjqt.qr>
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
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Jan Engelhardt wrote:
> 
> On May 10 2007 16:10, ??? wrote:
> >We have some problems with nat.
> >We want to relay "udp packet" from a host to other host using SNAT, DNAT.
> >
> >iptables -t nat -A PREROUTING -p udp -d PACKET.RELAY.HOST.IP --dport 10000
> >-j DNAT --to-destination TO.OTHER.HOST.IP:10000 
> >iptables -t nat -A POSTROUTING -p udp -d TO.OTHER.HOST.IP --dport 10000 -j
> >SNAT --to-source PACKET.RELAY.HOST.IP:10000
> >
> >It works well. But after removing the rules, packet still transferred. I can
> >find the conntrack entry in /proc/net/stat/ip_conntrack.
> >We know libnfnetlink & libnetfilter_conntrack with kernel 2.6 can delete
> >conntrack entries from userspace. But we use Redhat linux 2.4.21-32.EL.
> >How can I delete specified conntrack entry in kernel 2.4 without kernel code
> >??
> 
> I suppose that the reason that "conntrack" (the userspace tool to
> monitor/delete conntrack entries) was written is because there was no
> prior way to do it from userland. (In short: you are toast with 2.4)
> 
> Or wait for the UDP connection tracking timeout to happen.

Sometimes this may not be possible if the traffic doesn't stop long enough
for it to time out.  I wish I had known about conntrack when I had this
problem occur.  I just set the UDP timeout to 1 second (fortunately, that
worked).

If it were possible that when a rule like that is deleted, all active
conntrack entries that this rule causes would be removed.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

