From: Ray Blair <rcblair@comcast.net>
Subject: NAT question
Date: Sat, 19 Jul 2003 11:09:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F195F3D.2050503@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org, Ray Blair <rcblair@comcast.net>

I am trying to set up my NAT box to permit CORBA traffic.  I am running 
the demo programs provided by jacorb 1.4.1

If I have the server on the unprotected network and the client inside, 
the programs works fine. When I swap roles, I can't get the outside 
client to connect to the server on the protected network.

The inside address 192.168.10.X is translated to an unused address on 
the external network.  We are using the jacorb property "proxy host" to 
inform the external client to use the translated IP (1.1.1.1) to contact 
the server.  When the internal server tries to contact itself it uses 
the translated address (1.1.1.1) not the internal address and is not 
successful.

I can't seem to configure the NAT box to redirect the traffic from the 
inside IP that is destined for the translated address back to itself. 
Is there a kernel option that is preventing this from happening?  i 
think my rules are configured correctly.

thanks

ray





