From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Destination Nat
Date: Fri, 28 May 2004 21:56:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085795768.14775.2.camel@localhost>
References: <40b74a21.49.47a3.1468065555@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40b74a21.49.47a3.1468065555@arbbs.net>
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
To: black@arbbs.net
Cc: netfilter@lists.netfilter.org

If I understand you correctly and remember your original rule, then I
think you have it backward.  If you are changing the destination, you
probably want to change it from the public address to the private
address:

iptables -t nat -A PREROUTING -d 5.6.7.8 -p 6 --dport 8080 -j DNAT
--to-destination 192.168.x.x:80

Remember to ensure that traffic to 192.168.x.x:80 is allowed on the
FORWARD chain and that the NAT gateway responds to ARPs for 5.6.7.8 -
John

On Fri, 2004-05-28 at 10:18, black@arbbs.net wrote:
> would it be 8080 or 80? the web server has a static ip
> address
> on the inside 192.168.x.x
> 
> > That will direct all 80 /tcp packets for all addresses the
> > station listens on to 5.6.7.8:8080? Is that what you want
> > or do you want to redirect packets with a specific
> > destination address? If the public Internet address is not
> > an IP address bound to the NAT gateway, then you will need
> > to add it, typically: ip address add 1.1.1.2/24 dev eth0
> > brd + 
> 
> john
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


