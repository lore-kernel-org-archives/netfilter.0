From: "Jiwei Wang" <jiwei@taralnetworks.com>
Subject: RE: Is it possible connecting to a forwarded port from inside the network?
Date: Sun, 16 Mar 2003 17:40:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <05ce01c2ec0c$fbdd1d10$0602000a@taralnetworks.com>
References: <200303161503.41910.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303161503.41910.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

Thanks Joel.  It works like a charm.

Jiwei

-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us] 
Sent: Sunday, March 16, 2003 3:04 PM
To: Jiwei Wang; netfilter@lists.netfilter.org
Subject: Re: Is it possible connecting to a forwarded port from inside
the network?

On Sunday 16 March 2003 02:18 pm, Jiwei Wang wrote:
> Hello,
>
>
>
> I'm using iptables on a RedHat 8.0 box to do firewalling and port
> forwarding. The port-forwarding works perfectly when accessed from
> outside my internal networks.   However, I cannot access the forwarded
> ports from inside the network.
>
>
>
> I tried to use two IP addresses to do this. That is, I have public IP
> addresses a.b.c.x and a.b.c.y both assigned to my Internet facing
> eth0; I use a.b.c.x for SNAT and a.b.c.y for DNAT port forwarding
> (a.b.c.y:80 is forwarded to an internal host port 80); from the
> Internet a.b.c.y:80 works ok, but I still cannot access a.b.c.y:80
> from any of my internal box.

add this, where d.e.f.y is the IP of the internal host, and d.e.f.z is 
the internal IP of the firewalling box:

iptables -t nat -A POSTROUTING -o eth1 -d d.e.f.y -p tcp --dport 80 -j
SNAT --to d.e.f.z

This will force a.b.c.y to respond to the firewall instead of directly
to 
the client, so that the reverse DNAT can take place.  As it stands, the 
server is probably trying to reply directly to the client, which is 
discarding the reply.  (it's waiting for a response from a.b.c.y, not 
d.e.f.y!)  Once the reply comes back to the firewall, it will undo the 
SNAT, setting the destination of the reply back to the original client, 
then it will undo the DNAT, setting the 'source' of the reply back to 
the public IP a.b.c.y.

j


