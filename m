From: Jason Opperisano <opie@817west.com>
Subject: Re: No ICMP connections in /proc/net/ip_conntrack?
Date: Fri, 11 Feb 2005 13:45:46 -0500
Message-ID: <20050211184546.GA3617@bender.817west.com>
References: <7bca1cb5050211094730ec3a1a@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bca1cb5050211094730ec3a1a@mail.gmail.com>
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

On Fri, Feb 11, 2005 at 11:47:37AM -0600, Asim Shankar wrote:
> However, if I "ping D" from A and B, then no entry seems to be present
> in ip_conntrack. My understanding based on:
> http://www.faqs.org/docs/iptables/icmpconnections.html is that I
> should see something in ip_conntrack.
> 
> Am I missing something?

yeah--you're just not that fast.  a conntrack entry is created when the
ICMP Echo-Request is received and removed when the Echo-Reply goes out.
the total elapsed time that the conntrack entry exists would be in the
very low millisecond range...and i don't think your cat is that fast.

-j

--
"Silly customer, you cannot hurt a Twinkie!"
        --The Simpsons

