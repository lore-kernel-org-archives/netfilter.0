From: Jason Opperisano <opie@817west.com>
Subject: Re: IPSec through my firewall
Date: Tue, 15 Feb 2005 10:07:07 -0500
Message-ID: <20050215150707.GA19171@bender.817west.com>
References: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Feb 15, 2005 at 11:25:58AM +0100, Ola Nilsson wrote:
> Hello,
> 
> I've got problems with getting IPSec (using NAT-T) traffic through my
> Linux 2.6.10 based firewall. I've now changed my iptables script to
> something rather simple:
> 
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Which is far to open, but I used it to try to find the problem. What I
> see with Ethereal is that the connection seems to have two
> phases. Both phases uses UDP on port 4500. In the first phase ISAKMP
> is used, then ESP.

um--i'll admit that i'm being lazy and not pulling up the RFC (or
draft), but i'm pretty sure that phase 1 must still use UDP 500, as
NAT-T must be negotiated between the two peers.  after that--phase 2 and
the bulk encryption traffic can use UDP port 4500.  again--i could be
totally wrong about this, but i don't see how it could work otherwise.

> 192.168.3.249   is the IP of the machine on my LAN that wants to do IPSec.
> 1.2.3.4         is the IP of the other end of the IPSec tunnel
> 5.6.7.8         is the IP of my firewalls interface on the internet
> 
> This is what I see:
> 
> No.     Time        Source          Destination     Protocol Info
>       3 0.001148    192.168.3.249   1.2.3.4         ISAKMP   Aggressive
>       4 0.001165    5.6.7.8         1.2.3.4         ISAKMP   Aggressive
>       5 9.999541    1.2.3.4         5.6.7.8         ISAKMP   Aggressive
>       6 9.999586    1.2.3.4         192.168.3.249   ISAKMP   Aggressive
> 
>     460 77.461355   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)
>     461 77.461383   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)
>     462 78.961453   192.168.3.249   1.2.3.4         ESP      ESP (SPI=0x384a545c)

"this is what you see" where?  what is this the output of?  where is
this output being generated?

also, realize that the output (wherever it's coming from) is saying that
you're using ISAKMP (which would imply standard UDP Port 500), and ESP
(IP Protocol 50)--i don't see any indication of NAT-T or UDP Port 4500
anywhere in that output.

as an aside--the use of IKE Aggressive Mode has been frowned upon for
quite some time--consider disabling it if you admin both sides of this
tunnel...

> During the ISAKMP phase, my firewall NATs like it shall, and the
> client reports the tunnel as working. But once the real ESP traffic
> starts to flow, it doesn't get NATed as I would like it to.

well--if you're transmitting "real ESP" traffic; i.e., IP Protocol
50--then you are not using NAT-T and that would explain your problem.

> I've googled quite a lot, and also tried using firehol to set up the
> iptables (and gotten some help on the firehol forum), but I'm still
> unsuccessfull. What should I do to debug this? Anyone have a set of
> rules that allows ISAKMP/ESP on UDP port 4500?

um--it shouldn't really be all that complicated.  since you have no
firewall rules at the moment--i would propose that at the current time,
you have an IPSec problem, not a firewall problem (though your IPSec
problem may be NAT-related).

i don't think we have enough info to help you at this time.

-j

--
"Me fail English? That's unpossible."
        --The Simpsons

