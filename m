From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: RE: Ip Forwarding
Date: Fri, 21 Feb 2003 19:47:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2da0c$0006e5f0$0200a8c0@grandaddy>
References: <20030222002813.GG412@tekilla.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030222002813.GG412@tekilla.homeip.net>
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

Well I want to put a windows 2000 domain controller behind my
iptables-enabled redhat 8 box. The domain controller had a static ip
before it went behind the firewall and for Active Directory to work
correctly it HAS to stay that way. I spent days and days trying
otherwise but windows is far too stubborn. AD plus legacy support for
WINS makes nat translation a living hell. So I simply set up all my
rules as default accept and let it fly, hoping that the forwarding would
take care of itself. Essentially it did! I could perform simple function
like connecting to the internet but I couldn't do more important
functions like cruise the windows network or have things join/leave/see
the domain behind this iptables enabled box.  I thought it had something
to do with routers not seeing the right ip address as it leaves the
iptables box or the routers not being able to find its way back to this
box behind the firewall.

It struck that while I wrote this complicated email I may have come up
with a solution. Since the static IP of the win2k box is the same and
only the gateway has changed, then the data it sends will be legitimate
concerning it's IP address(not an internal IP). Could I create an alias
at the outbound NIC level for the win2k's IP address and SNAT packets
leaving the outbound NIC that originated from the win2k box?

Thank you for any help.

P.S. I'm sorry to ask such a complicated question. I am new to Linux for
the most part and have a very basic understanding of networking. No I am
not a Hotmail employee :)
 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Willi Dyck
Sent: Friday, February 21, 2003 7:28 PM
To: netfilter@lists.netfilter.org
Subject: Re: Ip Forwarding

On Fri, Feb 21, 2003 at 06:46:03PM -0500, William Olbrys wrote:
> Is it possible to just forward the IP addresses?

Yes.

> That way my iptables/gateway box WONT change the ips and JUST act like
> a firewall? Using SNAT and DNAT is too complicated with windows.

Please provide more detailed information, so we can help.

Regards

-- 
Willi Dyck





 E2-I: The presence of this footer indicates the message has been
scanned for viruses by the WebShield e500.







 E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.



