From: "black@arbbs.net" <black@arbbs.net>
Subject: Re: Destination Nat
Date: Fri, 28 May 2004 08:18:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40b74a21.49.47a3.1468065555@arbbs.net>
Reply-To: black@arbbs.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


would it be 8080 or 80? the web server has a static ip
address
on the inside 192.168.x.x

> That will direct all 80 /tcp packets for all addresses the
> station listens on to 5.6.7.8:8080? Is that what you want
> or do you want to redirect packets with a specific
> destination address? If the public Internet address is not
> an IP address bound to the NAT gateway, then you will need
> to add it, typically: ip address add 1.1.1.2/24 dev eth0
> brd + 

john

