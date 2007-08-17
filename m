From: "Ben Carbery" <ben.carbery@gmail.com>
Subject: packet replication
Date: Fri, 17 Aug 2007 15:14:18 +1000
Message-ID: <ab82fd6c0708162214w64bf1b00pabc4e456de734b52@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=USUmKLuziuVrBAgR4QensgCy4H8Rc5ZF3hl6QpC37H9GdSAgO5pXPOOG3UaAQrjrDHIcab+1635hEH6lcTJm+aWqmm0F5tcyHECpsDHChqH5y05FP++cZ1qjlFwCFnB5WABzp5h5JHEJ0ogcM0BzTebfAP9XT6/xmF0HBoAD0EA=
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

Hi,

I have a couple of questions regarding netfilter capability.

I am building a network management system (a set of servers and
software on a large network) and encountering a number of challenges.
I would like to be able to send all NMS traffic (snmp, syslog, netflow
etc) to a single linux-based server per location, which then forwards
the traffic to an associated grouping of servers that are 'behind'
this server or on the same subnet.

However I have multiple servers that want to receive the same (udp)
traffic stream. This is partly to achieve redundancy, partly because
there are limitation in how many destinations can be set on the device
sending the traffic.

SO, iptables can handle the forwarding and NAT, but can I forward a
udp stream to more than one device?

Secondly - and this is a big ask but I am mainly looking for ideas
about how I might achieve this - I would like the status or
reachability of the end device to be tracked by the packet forwarder,
such that if the device becomes unreachable the traffic is disk cached
on the gateway until it becomes reachable again, or storage limits are
reached.

To illustrate this, imagine I have a router sending syslog to the "NMS
gateway" - the server running iptables. The gateway translates the dst
address in the ip header to that of a logging server - the final
destination of the syslog traffic. After a while it determines the
logging server is unreachable, and forwarded traffic is probably not
getting through. It starts caching all traffic on disk. A short time
later the logging server becomes reachable and the cached traffic is
forwarded. One way to achieve this would be by converting the udp
stream to individual tcp streams.

Is there an application/feature/tool that can handle this?

Would appreciate any info or pointers in the right direction.

cheers,

Ben

