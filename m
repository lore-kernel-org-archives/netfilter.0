From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: Ipsec, policy match and PROTO=4
Date: Wed, 26 Jul 2006 17:45:09 +0200
Message-ID: <BAY103-F2306A99A1FF8E1DFF26594B25B0@phx.gbl>
References: <200607261727.21548.thomasheinz@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607261727.21548.thomasheinz@gmx.net>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomasheinz@gmx.net
Cc: netfilter@lists.netfilter.org

Thomas Heinz wrote:

>Hi Marco
>
>Thanks for your reply.
>
>You wrote:
> > You aren't seeing the clear text packet
> > because because you should log also the
> > FORWARD chain: 'iptables -I FORWARD -j LOG'
> >
> > > This has been observed in e.g. this thread:
> > > http://marc.theaimsgroup.com/?l=netfilter-devel&m=114010374229806&w=2
> > >
> > > However, I don't see any solution. What is your approach to filter
> > > cleartext packets?
> >
> > You must filter packets in the FORWARD
> > chain, nor INPUT nor OUTPUT
>
>The packets do not traverse the FORWARD chain. I just added log rule,
>i.e. 'iptables -I FORWARD -j LOG'. Even after issueing 'iptables -I
>FORWARD -j DROP', the ipsec connection works perfectly (assuming that I
>accept PROTO=4 packets).

Apologies, I misread your post.

>BTW, I used 2.6.16 this time since I currently cannot restart the system.
>In fact, I would be surprised to see either the ESP or the cleartext
>packet in FORWARD since both are destined to the local host.

Yes sure, my fault.

What are you policy for INPUT and OUTPUT chain? ACCEPT or DROP?



