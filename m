From: Jason Opperisano <opie@817west.com>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 10:58:46 -0400
Message-ID: <20050413145846.GA30293@bender.817west.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
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

On Tue, Apr 12, 2005 at 03:08:12PM -0300, Eduardo Spremolla wrote:
> I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 interconnected by
> a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.
> 
> Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
> because he had a ip conflict. I cant SNAT because when the packet goes
> to nat post it has been encapsulated in ESP and had the firewalls
> address, as you can see in the bottom log snipe.I try to use NETMAP in
> mangle PREROUTING, but it changes the dest ip , not the source.
> 
> Is this possible?
> 
> Thanks in advance for any clue.

dunno if this will help or not; as i have lost my test lab, but have you
applied the ipsec patches from PoM:

  ipsec-01-output-hooks
  ipsec-02-input-hooks
  ipsec-03-policy-lookup
  ipsec-04-policy-checks

it is my understanding that these patches make packets traverse the
netfilter hooks twice:  once clear, and again encrypted.

-j

--
"Peter: I call it... Petoria. I was going to call it Peterland,
 but that gay bar by the airport took it."
        --Family Guy

