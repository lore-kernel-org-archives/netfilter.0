From: Javier Govea <jgovea@magma.ca>
Subject: Round Robin Load Balancing
Date: Tue, 15 Jul 2003 15:33:32 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307151933.h6FJXWXY017800@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

I'm trying to do some load balancing with four ppp connections. Here is what i have: a LAN
connected to a redhat box which has four ppp interfaces. All the boxes in the LAN are
accesing internet through the ppp interfaces in the redhat box. I'm using iproute2, in my
redhat box, to setup the the four ppp interfaces as my default out going route (as
described in LART http://lartc.org/howto/index.html) and I'm using iptables to masquerade
all the traffic comming from the LAN. 

My setup is working fine, ie. my LAN can access the net throught the four ppp interfaces.
My problem is that i don't know how is the load balancing working. Some times one of the
ppp interfaces is used more than the others (and that is my problem). According to LART
the routes are cached, can someone go a bit into more details in this caching thing??? how
does it work?  which particular files in the kernel are doing this?  

I would like to implement a simple round robing algorithm (with no caching) for doing the
laod balancing. That is first connection established gose through ppp0, the second
connection on ppp1 and so on. 

I could hack iproute2 and/or iptables, but i'm not sure about which particular files i
should hack in order to implement this round robin algorithm. I actually don't know if
what i want makes any sense

Any ideas or pointers are all very well appreaciated.
Thanx to all
X

