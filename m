From: Paul Dorman <pauld@cwa.co.nz>
Subject: Re: Seamless communication across VPN link
Date: Fri, 18 Mar 2005 10:11:23 +1300
Message-ID: <1111093883.30955.25.camel@localhost.localdomain>
References: <1110871981.692.68.camel@localhost.localdomain>
	<4239306D.7030101@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4239306D.7030101@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"
To: gtaylor@riverviewtech.net
Cc: netfilter@lists.netfilter.org

Hi Grant,

thanks very much for your reply. Really kind of you to take so much time
to explain things nice and clearly for me.

I had implemented exactly what you described, along with some SNAT rules
to make the packets look like they were coming from the VC unit on the
way back to the provider, but due to complications (H323 & NAT over two
Linux firewalls are *not* cooperative) we had to abandon the whole idea
of NATing. Instead we opted to bypass the ipsec connection for the VC
traffic (which is encrypted anyway) using some policy routing and a
couple of extra aliases on either side of the connection. I was
fortunate enough to stumble onto an alternative kernel for the
Smoothwalls which has the stuff required for source-based policy routing
using iproute2. This approach was successful, and the implications of
not using the ipsec for the H323 traffic isn't too severe as the traffic
is encrypted at any rate, and our wireless is highly directional and
would be difficult to sniff anyway.

Thanks again for staying up late mulling over my predicament. It's
always great to find people like yourself who are so generous with their
time.

Regards,
Paul


