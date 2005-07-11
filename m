From: Jason Opperisano <opie@817west.com>
Subject: Re: dnatting
Date: Mon, 11 Jul 2005 14:45:20 -0400
Message-ID: <20050711184520.GA17202@bender.817west.com>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050711151830.GA26670@tranquility.scriptkitchen.com>
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

On Mon, Jul 11, 2005 at 11:18:30AM -0400, Payal Rathod wrote:
> Hi,
> I have a rule on my friend's broadband connection to redirect traffic 
> from outside to an internal machine like,
> 
> iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 80 -j DNAT  \
> --to-destination 192.168.10.10:80
> 
> But she complained that people from inside the network cannot do
> http://1.2.3.4 in their browser and see the site. Is she correct?
> What is wrong with my rule because I can see the site from outside?

1)  client; say 192.168.10.100, sends TCP SYN to 1.2.3.4

2)  iptables machine receives packet destined for 1.2.3.4, DNAT's it to
    192.168.10.10 and forwards the packet out the internal interface

3)  192.168.10.10 receives TCP SYN from 192.168.10.100 and replies
    directly to 192.168.10.100 with a SYN/ACK

4)  client; 192.168.10.100, receives SYN/ACK from 192.168.10.10 and
    discards it, as it matches no connection in the SYN_SENT state
    (recall that our SYN was sent to 1.2.3.4).

that the why.  the proper way to avoid this is to have people on the
inside connect to 192.168.10.10.  i will leave all the half-assed
work-arounds and kludges as an exercise for the reader and other
posters.

-j

--
"Peter: This party couldn't be better if Jesus was here.
 Jesus: For my next miracle, I will turn water... into FUNK."
        --Family Guy

