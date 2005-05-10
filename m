From: Jason Opperisano <opie@817west.com>
Subject: Re: SIP Natting
Date: Tue, 10 May 2005 10:49:17 -0400
Message-ID: <20050510144917.GA9307@bender.817west.com>
References: <4280C77C.2040001@phreaker.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4280C77C.2040001@phreaker.net>
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

On Tue, May 10, 2005 at 10:38:52PM +0800, ro0ot wrote:
> Hi,
> 
> Below is my rules for my SIP device: -
> 
> iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 5060 -j DNAT --to 
> 172.16.10.21:5060
> iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 8000 -j DNAT --to 
> 172.16.10.21:8000
> 
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> Can I have something like below if I want to have more than one SIP devices?
> 
> iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 5060 -j DNAT --to 
> 0.0.0.0:5060
> iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 8000 -j DNAT --to 
> 0.0.0.0:8000

um--no.  those rules aren't going to do what you want.  i believe you'll
need to use a SIP proxy, such as:

  http://siproxd.sourceforge.net/

-j

--
"Brian: Okay, insert rod support A into slot B.
 Peter: That's what...
 Brian: If you say "that's what she said" one more time, I am gonna pop
 you."
        --Family Guy

