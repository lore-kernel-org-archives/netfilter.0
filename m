From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Dual ISPs - controlled path for certain ports - ip route 2
	balancing for others
Date: Wed, 22 Sep 2004 13:15:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409221315.05822.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

	
	
	Okay folks, I've been poking at iptables for a while and I suspect that I've 
got the basics down.  However I've stumped myself and see that I'll have to 
fiddle this on the fly.

	(yes the isp's are in the same class A address range. *sigh*)

	ISP1 (AA.bb.0.0)      ISP2 (AA.abc.0.0)
                     |                                  |
          DSL link                       cable link
                    |                                    |
                    Linux firewall/gateway
     (gulp) -- and a few other services (YES  I KNOW ITS BAD!!!)
                                     |
                                     | 
                        Internal LAN (10.0.0.0)	


	I've managed to get both links working as individual default gateways
	however ISP2 suppresses ports to minimize the traffic (i.e. 80/25/110/etc)
	When I try to setup dual routing at all using LARTC, I have problems, and I
	realize that this is not the place to ask those questions.  I'm wondering if 
	there are rules I can use (consider that the webserver/mailserver and FTP 
	server are sadly on the firewall at the moment) to force the servers to reply
	via the DSL or internal lan only, even if the default route points at the
	cable link? (this would be a quick and dirty solution for me) -- the cable
	link will have to shortly support a VPN tunnel back to work.

	(Fyi -- This is all part of a promotion I just got at work ... *grin* since 
I'm now a unix admin I'm gonna look pretty silly if I barf on this)


	Alistair 

	(p.s. -- Antony ?? ?? anyone seen Antony lately??? hope he's doing well)

