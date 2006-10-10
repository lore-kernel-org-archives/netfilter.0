From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: Re: Pleeeeeeeease help: question about ip_queue
Date: Tue, 10 Oct 2006 15:26:17 -0500
Message-ID: <1160511977.4059.36.camel@mfarooq-1.tango-networks.com>
References: <1160491318.4059.18.camel@mfarooq-1.tango-networks.com>
	<452BBE0C.2060402@it.uc3m.es>
	<1160497605.4059.26.camel@mfarooq-1.tango-networks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1160497605.4059.26.camel@mfarooq-1.tango-networks.com>
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
To: mfarooq100@yahoo.com
Cc: netfilter@lists.netfilter.org

I have performed a different test. I read 5 message from the queue and
save message ids of all five of them. Then I accepted all five message
in the order they read. The first message reaches its destination and
the other four are dropped. I would really appreciate if someone can
explains the inner working of the ip_queue. Is this a bug in the
ip_queue implementation? Thanks.

MF

On Tue, 2006-10-10 at 11:26 -0500, Mohammad Farooq wrote:
> Hi Antonio,
> 
> Thanks for the reply. Pardon my ignorance, once I drop the current
> packet, how can I resend the the saved packet through the ip_queue in
> the future? I don't see any API in libipq which allows that. Could you
> please elaborate. Thanks.
> 
> MF
> 
> On Tue, 2006-10-10 at 17:36 +0200, aoliva wrote:
> > Hi all,
> > I think you can do what you want by storing the message in the module, 
> > dropping the current one and after the specific time sending it again.
> > 
> > Regards
> > Antonio
> > 
> > 
> > 
> > Mohammad Farooq wrote:
> > > Hi,
> > >
> > > I hope someone familiar with ip_queue can clarify the functioning of the
> > > ip_queue. I wrote a simple test program, what all it does read packets
> > > from the queue, hold a packet and accept it later. Here is the logic:
> > >
> > > read message from the ip_queue
> > > save message id
> > > read message from the ip_queue
> > > accept current message
> > > read message from the ip_queue
> > > accept current message
> > > read message from the ip_queue
> > > accept current message
> > > read message from the ip_queue
> > > accept current message
> > > read message from the ip_queue
> > > accept current message
> > > **accept saved message using the saved message id
> > > accept current message
> > > read message from the ip_queue
> > > accept current message
> > >
> > > When I accept the saved message, it just disappears. My question is, can
> > > we hold packets and accept them sometimes in the future? Thanks.
> > >
> > > MF
> > >
> > > Note: here is my iptable rules:
> > > iptables -t nat -A PREROUTING -p udp -s 192.168.82.140 -d 192.168.75.51
> > > --dport 7862 -j DNAT --to 192.168.82.140:7862
> > > iptables -t nat -A POSTROUTING -p udp -s 192.168.82.140 -d
> > > 192.168.82.140 --dport 7862 -j SNAT --to 192.168.75.51:7862
> > >
> > > echo 1 > /proc/sys/net/ipv4/ip_forward
> > > iptables -A FORWARD -p udp -j QUEUE
> > >
> > >
> > >
> > >
> > >   
> > 
> > 
> 
> 
> 


