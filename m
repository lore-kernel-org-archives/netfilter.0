From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: Source
Date: Fri, 11 Apr 2003 12:29:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002d01c3001d$9995aa80$6401a8c0@int.thorcom.com>
References: <00a601c2fd27$93b26890$4001010a@dtrsoftware.com> <1050056536.8048.1433.camel@vincentlim>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Vincent Lim <vincent.lim@nestac.com>, bguerra@dtr-software.com
Cc: netfilter@lists.netfilter.org


----- Original Message -----
From: "Vincent Lim" <vincent.lim@nestac.com>
To: <bguerra@dtr-software.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, April 11, 2003 11:22 AM
Subject: Re: Source


> On Tue, 2003-04-08 at 01:03, Bobby Guerra wrote:
> > I am trying to setup some rules that apply to a range of source ip
address
> > in a subnet.  Example 10.1.1.60-65  I know that you can specify
individual
> > ip adress with -s but this would make me do allot of repeating because I
> > will have to apply the same rules to each ip address. Any help would be
> > appreciated.  Thanks
>
> I don't know if using netmasks would help?
>

You can factorise it down to two lines:

        -s 10.1.1.60/30        which gets .60, .61, .62 and .63
        -s 10.1.1.64/31        which gets .64 and .65

better if you can organise the ip addresses of the hosts that you want to
filter
so that they fit inside a single mask, for example number your six hosts
64-69
inclusive, then do not have a host .70 or .71 and you can use a single
match:

        -s 10.1.1.64/29        which gets .64 -> .71

that's what netmasks are for...


Mike


