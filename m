From: Michael Stilmant <ml-netfilter@adtech.be>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 09:46:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054021618.18150.49.camel@stilmant>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
	 <1054016670.1847.213.camel@alpha.newkirk.us>
Reply-To: ml-netfilter@adtech.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054016670.1847.213.camel@alpha.newkirk.us>
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

On Tue, 2003-05-27 at 08:24, Joel Newkirk wrote:
> You'd need to handle this outside of iptables/ebtables, but it could be 
> done.  

Thanks to answer. but I don't understand well how to do this, but I'll
check your idea. 

And this is in fact this is how I really do the stuff.

                     10.0.0.225
                     +--------+
                     |   B    |
   +-----+           |        |          +-----+
   |  A  +-----------[ebtables]----------|  C  |
   +-----+           +--------+          +-----+
   10.0.0.3                             10.0.0.32         


I've made a C program able to update the kernel iptables. This program
read a config file where they are the remote port and the remote IP
address to listen for (address of A; A is the server for B machine to
connect on port 3435)

So when the program start, it update iptables like if you have done this
rule :

iptables -t nat -A PREROUTING -i eth1 -d 10.0.0.3 -p tcp --dport 3435 -j
DNAT --to-destination 10.0.0.225:3625

And after that the program start a tcp server on B machine to listen
routed traffic from B.

When a connection came from C to the special port on A, traffic is
routed locally to the listening TCP server. this server known now the
source IP and update iptables with this rules.

iptables -t nat -A POSTROUTING -o eth0 -d 10.0.0.3 -p tcp --dport 3435
-j SNAT --to-source 10.0.0.32

since the ip source is well known now.

after that the program open a tcp connection to A:3435.

Now I can use the B tcp server to listen and interact with the traffic
between A and C.

Now I've a connection from C to B where I can find the value of the
source IP address. I need to find a way to know also the MAC address,
perhaps with an IOCTL on the socket. and using this MIAC address to
update something somewhere to tell to the network layer wich MAC address
to use but only with the connection from B to A. and this will be great
if I can say this only for one TCP connection from B to A. Because I
want to try to be possible to put many C like machine on the right.

Best regards

Michael


