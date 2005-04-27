From: Jason Opperisano <opie@817west.com>
Subject: Re: Local Port Forwarding.
Date: Wed, 27 Apr 2005 17:00:50 -0400
Message-ID: <20050427210050.GA27099@bender.817west.com>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
	<20050422215756.GA5739@bender.817west.com>
	<4269745C.70305@riverviewtech.net>
	<20050422220715.GA5807@bender.817west.com>
	<20050427204859.GC18183@metastasis.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050427204859.GC18183@metastasis.org.uk>
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

On Wed, Apr 27, 2005 at 09:48:59PM +0100, Nick Drage wrote:
> iptables -t nat -A OUTPUT -p udp -d 192.168.13.43 --dport 161 -j
> REDIRECT --to-ports 32789
> 
> Makes no difference to the traffic I sent out on port 161 to host
> 192.168.14.43, any ideas on what I could be missing out?

speaking of typos--your rule has "-d 192.168.13.43" and you say it
doesn't affect traffic destined for 192.168.14.43.  typo in the email,
or in the rule?

> I'm using iptables version 1.2.8 if that makes a difference....

and your kernel is compiled with:

  CONFIG_IP_NF_NAT_LOCAL=y

-j

--
"Stewie: Damn it! I want pancakes! God! You people understand every
 language except English. Yo quiero pancakes. Donnez-moi pancakes.
 Click-click-bloody click pancakes!
        --Family Guy

