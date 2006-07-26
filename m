From: Thomas Heinz <thomasheinz@gmx.net>
Subject: Re: Ipsec, policy match and PROTO=4
Date: Wed, 26 Jul 2006 17:27:21 +0200
Message-ID: <200607261727.21548.thomasheinz@gmx.net>
References: <200607252059.02920.thomasheinz@gmx.net>
	<BAY103-DAV11A5D51D5F953F7587C290B25B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV11A5D51D5F953F7587C290B25B0@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Marco

Thanks for your reply.

You wrote:
> You aren't seeing the clear text packet
> because because you should log also the
> FORWARD chain: 'iptables -I FORWARD -j LOG'
>
> > This has been observed in e.g. this thread:
> > http://marc.theaimsgroup.com/?l=netfilter-devel&m=114010374229806&w=2
> >
> > However, I don't see any solution. What is your approach to filter
> > cleartext packets?
>
> You must filter packets in the FORWARD
> chain, nor INPUT nor OUTPUT

The packets do not traverse the FORWARD chain. I just added log rule, 
i.e. 'iptables -I FORWARD -j LOG'. Even after issueing 'iptables -I 
FORWARD -j DROP', the ipsec connection works perfectly (assuming that I 
accept PROTO=4 packets).

BTW, I used 2.6.16 this time since I currently cannot restart the system. 
In fact, I would be surprised to see either the ESP or the cleartext 
packet in FORWARD since both are destined to the local host.

> > Is the issue considered a bug?
>
> Yes, the issue in the above thread is a
> know bug to the netfilter team.

Hm, ok. I wonder how the current state of this issue is and how hard it is 
to fix this bug.


Best regards,

Thomas

