From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: ip6tables problem
Date: Wed, 20 Dec 2006 00:34:21 +0000
Message-ID: <79328ea80612191634s1ffbb494ge96c56c771a05d66@mail.gmail.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm using kernel 2.6.19 on Gentoo

I have an ipv6 tunnel on the device 'tunbt6', and another interface on
eth0 to the rest of my network.

I've boiled down my problem to a simple firewall setup.

When I enter the following commands:

ip6tables -N filter6
ip6tables -A filter6 -m state --state NEW -i ! tunbt6 -j ACCEPT
ip6tables -A filter6 -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A filter6 -j REJECT

ip6tables -A INPUT -j filter6
ip6tables -A FORWARD -j filter6


It doesn't work!  I can't even ping6 the machine over eth0 from my
other computer connected to the same ethernet segment!

Can anybody tell me what's happening?  Thanks

