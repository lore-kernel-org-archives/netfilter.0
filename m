From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: One-to-one NAT
Date: Fri, 18 Oct 2002 12:56:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210181156.g9IBuRL28234@vulcan.rissington.net>
References: <OFE4F0023E.764FDF67-ON41256C56.004112CB@telelogic.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFE4F0023E.764FDF67-ON41256C56.004112CB@telelogic.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Friday 18 October 2002 12:47 pm, Kovacs Istvan wrote:

> Hi,
>
> I would like to map one network onto another in a one-to-one way, that
> is:
> 192.168.1.x <---> 10.0.1.x

You need the NETMAP target.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

