From: Jason Opperisano <opie@817west.com>
Subject: Re: Netfilter or DNS issue?
Date: Wed, 09 Feb 2005 17:27:52 -0500
Message-ID: <1107988072.4619.2.camel@hubcap.ljm.dom>
References: <200502081314.AA721338@mail.cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502081314.AA721338@mail.cybercorpinc.com>
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

On Tue, 2005-02-08 at 16:14, Glen Spidal wrote:
> Greetings all,
> 
> I have constructed a wirewall based off of the tutorial at frozentux.  The problem I'm having is that I have two DNS servers with the second being a slave to the first.  I can DIG other domains from the slave DNS server except for my own.  IT appears that the slave DSN server is not getting updated for the primary one. Here's my script:

<--snip-->

> DMZ_DNS_IP="192.168.1.17"
> DMZ_DNS2_IP="192.168.1.18"

according to those variables, both of your DNS servers are on the same
subnet; i.e., no firewall between them; i.e., your problem is one of DNS
configuration, not firewalling.

-j
                   
--
"Call this an unfair generalization if you must, but old people are
 no good at everything."
	--The Simpsons


