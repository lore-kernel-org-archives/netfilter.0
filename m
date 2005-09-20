From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 16:24:04 +0200
Message-ID: <BAY103-DAV1C34A5BB63FAEB5F10DB8B2950@phx.gbl>
References: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
	<200509200858.10349.rob0@gmx.co.uk>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

/dev/rob0 wrote:

> On Tuesday 20 September 2005 07:39, Marco Berizzi wrote:

> the source IP is set by
> iproute2 in the routing tables.

Ok, I'm not clearly explained.
I'm using SNAT to change the source ip address because iproute2 set an
ip address that I don't like.
So, I have inserted the following line in my firewall script:

iptables -t nat -I POSTROUTING -s iproute2_chosen_ip --protocol tcp
-j SNAT --to i_want_this_first_ip --to i_want_this_second_ip

But everytime I connect to the internet always "i_want_this_first_ip" is
chosen to
do the SNAT.


