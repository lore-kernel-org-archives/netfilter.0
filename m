From: Hitesh Ballani <hb69@cornell.edu>
Subject: iptables query
Date: Fri, 12 Mar 2004 03:09:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.2.20040312025848.00b5b7d8@postoffice6.mail.cornell.edu>
References: <20040312000855.GE26800@samad.com.au>
 <1079045669.6476.3.camel@localhost>
 <20040311233044.GC26800@samad.com.au>
 <1079049557.20501.6.camel@localhost>
 <20040312000855.GE26800@samad.com.au> <1079077823.3130.52.camel@anduril.intranet.cartel-securite.
 net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079077823.3130.52.camel@anduril.intranet.cartel-securite.
 net>
References: <20040312000855.GE26800@samad.com.au>
 <1079045669.6476.3.camel@localhost>
 <20040311233044.GC26800@samad.com.au>
 <1079049557.20501.6.camel@localhost>
 <20040312000855.GE26800@samad.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hello,

i had another question ... i need a method to do one of the following 2 
choices -

1. I receive a packet of an interface and apply source nat but i also need 
to change the destination address!

or

2. I receive the packet and send it over a tunnel interface (based on the 
destination address) but i also need to change the destination address ( 
the ROUTE patch allows me direct the packet to the tunnel interface based 
on the dest address but how do i change this address before it is sent to 
the tunnel interface) ....also if i have multiple tunnel interfaces as 
options for one destination address - can i achieve a round robin kind of 
usage between them?

Thanks,
Hitesh


