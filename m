From: "David O'Brien" <dobrien@naccrra.org>
Subject: Re: Using External NATTED addresses Inside the Firewall
Date: Tue, 18 May 2004 16:17:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.2.20040518161116.040f0c60@mail.naccrra.org>
References: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org>
 <200405182049.29795.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405182049.29795.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org>
 <200405182049.29795.Antony@Soft-Solutions.co.uk>
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

At 03:49 PM 5/18/2004, Antony Stone wrote:
>On Tuesday 18 May 2004 8:29 pm, David O'Brien wrote:
>
> > What I need to happen is when a user on an Internal 192.168.123.x address
> > tries to pull up a web page or check mail or anything off of one of the
> > three 1:1 NAT'd boxes they can by using the real x.x.x.250 , .199 , or .160
> > addresses and or the boxes hostname. Another DNS server for just
> > internal use isn't possible right now. I need an iptable rule (probably
> > OUTPUT)  that redirects the x.x.x.whatever address back to the internal
> > address is it's one of the three and if it's coming from the inside.
>
>http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Current setup from iptables-save

# Outside to Inside
-A PREROUTING -d 66.7.23.250 -p tcp -j DNAT --to-destination 192.168.123.252
-A PREROUTING -d 66.7.23.250 -p udp -j DNAT --to-destination 192.168.123.252
-A PREROUTING -d 66.7.23.160 -p tcp -j DNAT --to-destination 192.168.123.75
-A PREROUTING -d 66.7.23.160 -p udp -j DNAT --to-destination 192.168.123.75
-A PREROUTING -d 66.7.23.199 -p tcp -j DNAT --to-destination 192.168.123.31
-A PREROUTING -d 66.7.23.199 -p udp -j DNAT --to-destination 192.168.123.31

# Inside to Inside
-A POSTROUTING -d 192.168.123.252 -s 192.168.123.0/24 -p tcp -j SNAT --to 
192.168.123.250
-A POSTROUTING -d 192.168.123.75  -s 192.168.123.0/24 -p tcp -j SNAT --to 
192.168.123.250
-A POSTROUTING -d 192.168.123.31  -s 192.168.123.0/24 -p tcp -j SNAT --to 
192.168.123.250
-A POSTROUTING -d 192.168.123.252 -s 192.168.123.0/24 -p udp -j SNAT --to 
192.168.123.250
-A POSTROUTING -d 192.168.123.75  -s 192.168.123.0/24 -p udp -j SNAT --to 
192.168.123.250
-A POSTROUTING -d 192.168.123.31  -s 192.168.123.0/24 -p udp -j SNAT --to 
192.168.123.250

# Inside to Outside
-A POSTROUTING -s 192.168.123.252  -o eth1 -p tcp -j SNAT --to-source 
66.7.23.250
-A POSTROUTING -s 192.168.123.75   -o eth1 -p tcp -j SNAT --to-source 
66.7.23.160
-A POSTROUTING -s 192.168.123.31   -o eth1 -p tcp -j SNAT --to-source 
66.7.23.199
-A POSTROUTING -s 192.168.123.0/24 -o eth1        -j SNAT --to-source 
66.7.23.254

Very much like the example at the link above however it doesn't work.
Looks like its bouncing around. Any logging option I could enable to 
actually see
the above in action?
-Dave



>Regards,
>
>Antony.
>
>--
>The lottery is a tax for people who can't do maths.
>
>                                                      Please reply to the 
> list;
>                                                            please don't 
> CC me.


David G. O'Brien
Web Services Coordinator / Systems Administrator

NACCRRA
The Nation's Network of Child Care Resource & Referral
1319 F Street NW, Suite 500
Washington, DC 20004
(202) 393-5501 ext. 113
(202) 393-1109 fax



