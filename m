From: <netfilter@drbroyles.com>
Subject: Re: iptables or routing problem
Date: Wed, 22 Oct 2003 03:50:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <018c01c39871$1c3bbfb0$73593a42@drbroyles.com>
References: <F22386C3FEB012449238672E38ED61E706C252@overlord.overturemedia.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>

Fritz,
    No that will not work.  The B-class subnet of 192.168.x.x is a privately
available group of IPs that are not allowed onto the Internet.  192.167.8.1
is a real-world IP address though.  In fact, the entire 192.167.x.x/16
address space are real IPs.
    Any routers connected to the Internet will not route these private
addresses without some sort of NAT or MASQUERADING.  If your parent company
doesn't own IPs that you can use (which is what I suspect to be the case)
you'll need to use a different private address space.  If you need to use a
private IP space, then you have two other choices.
    You can use 172.16.x.x or you can use some portion of 10.x.x.x.  This
all depends on the intended use of your router.  How many clients will you
be servicing?
    I would suggest you read over the following Howto to get a better sense
of how you want to structure your network.
http://www.tldp.org/HOWTO/IP-Subnetworking.html

Brandon Broyles

----- Original Message -----
From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
To: <netfilter@drbroyles.com>
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>
Sent: Wednesday, October 22, 2003 2:41 AM
Subject: RE: iptables or routing problem



Oh I can't change the subnets. Our parent company is using a class-b system.
255.255.0.0

Would this be possible in a class-b system?

eth0: 192.167.8.1
eth1: 192.168.8.232

Just to make them on different subnets?

fritz <www.mesedilla.com>


