From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP/auth problems (slooow links)
Date: Mon, 14 Oct 2002 00:50:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013235022.ZXXG27697.mta05-svc.ntlworld.com@there>
References: <3DA97045.2040803@solidas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA97045.2040803@solidas.com>
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

On Sunday 13 October 2002 2:08 pm, Svein E. Seldal wrote:

> I have a linux (2.4.18) running iptables. It is a router and FW, and is
> NAT'ing the internal address range (192.168.0.x) to the external range
> (1.2.3.x). ip_conntrack, ip_conntrack_ftp and ip_nat_ftp are all loaded
> in the router. It is a 266 PII with 128Mb memory.
>
> For any machine that are placed on the inside, there are two methods of
> getting to another machine on the inside: either using the direct
> internal address 192.168.0.x or by using the external address 1.2.3.x.

Without seeing your ruleset I cannot be certain, but I would not expect the 
latter situation to work properly, for reasons explained below...

> Now, the problem is this: I open two FTP connections from the client
> machine 192.168.0.10 to a server, the first to 192.168.0.5 and the other
> connection to 1.2.3.5.

> The connection going via. the router is slow, very slow. The problem is
> that is does not matter if I DROP, REJECT or ACCEPT the auth (ident)
> port. It still is as extremely slow -- direct connection takes 20 mins,
> while the routed version takes 2-3 hours!!.

I think you need to think about the route of packets and their replies.

Consider machine 192.168.0.10 connecting to 192.168.0.5.   Both are on the 
same subnet, therefore client sends packets to server and server sends 
packets to client - all works well.

Now consider 192.168.0.10 sending packets to 1.2.3.5.   These go via your 
router, which translates 1.2.3.5 to 192.168.0.5, and returns them to the 
subnet where they originated.   Now where is the server going to reply to ?   
192.168.0.10, because that is the address which sent the original packet...

Therefore 192.168.0.10 sends a packet to 1.2.3.5 and gets a reply from 
192.168.0.5 (the reply goes directly from server to client, not through the 
NAT router, because both addresses are on the same subnet), therefore 
192.168.0.10 gets confused and unhappy.

To be honest I'm not entirely sure why this setup is working at all - maybe 
you should run ethereal on the local network and see what source / 
destination addresses you have on the packets flying around when you try to 
contact 1.2.3.5 from 192.168.0.10 ?

Basically if you are doing destination NAT then you should not expect it to 
work sensibly if you try to contact the NAT address from a machine on the 
same subnet as the "real" address.

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

