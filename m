From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to automate ip_forward
Date: Thu, 8 Jul 2004 13:19:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081319.57035.Antony@Soft-Solutions.co.uk>
References: <16ac01c464e3$1af42c20$49caa8c0@caris.priv> <20040708142235.4b2d0aa1.leslie.polzer@gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040708142235.4b2d0aa1.leslie.polzer@gmx.net>
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
To: netfilter@lists.netfilter.org

On Thursday 08 July 2004 1:22 pm, Patrick Leslie Polzer wrote:

> On Thu, 8 Jul 2004 09:00:04 -0300
>
> "Peter Marshall" <peter.marshall@caris.com> wrote:
> > Hey guys, I know this sounds stupid, but I can not seem to get the value
> > of /proc/sys/net/ipv4/ip_forward to be 1 after boot.
>
> How do you test?

cat /proc/sys/net/ipv4/ip_forward is a pretty reliable indicator :)

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


