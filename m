From: dhiraj.2.bhuyan@bt.com
Subject: RE: redirection
Date: Wed, 9 Apr 2003 14:10:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E09250995@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

note one thing -

when the client tries to connect to port 80 of x.y.z.1, the firewall in
x.y.z.1 redirects the traffic to x.y.z.2:80

so the client will be receiving packets from x.y.z.2:80 - which is not what
it is expecting. It is waiting for packets from x.y.z.1:80 - so it will no
doubt timeout. You should be able to see the packets coming from x.y.z.2:80
by running a sniffer on the client machine.

I think Eric Joe did infact give the right solution - that x.y.z.1 will be
working as a proxy between the client and x.y.z.2 - although you can
question if you are achieving your "loadbalancing" by this.


dhiraj

-----Original Message-----
From: xchris [mailto:lyra@fastwebnet.it]
Sent: 08 April 2003 23:17
To: netfilter@lists.netfilter.org
Subject: Re: redirection



----- Original Message -----
From: "Eric Joe" <sysop@tje1.com>


> I didnt catch the fact that you need the source address. Are you tracking
> this for a reason? You can probably have iptables log the source address.
> This does in fact work, been using it for  about 6 months now. Let me post
> my exact rules (IPs are obsfucated)

i need it because i'm trying to do a simple load balancing between 2 local
servers running opennap.
(and opennap needs to know the IP address otherwise downloads dont start)
thnak you

xchris

