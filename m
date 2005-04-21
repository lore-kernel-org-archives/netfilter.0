From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 14:21:04 -0500
Message-ID: <4267FD20.5060405@riverviewtech.net>
References: <c0e9781f0504202352240208e4@mail.gmail.com>	<426753A3.7030800@riverviewtech.net>	<c0e9781f05042102544437b319@mail.gmail.com>	<c0e9781f0504210718566c4025@mail.gmail.com>	<4267BE69.6080203@riverviewtech.net>	<c0e9781f05042108122c7b02c3@mail.gmail.com>	<4267ED40.6040803@riverviewtech.net>
	<c0e9781f05042112072ac5d6f5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f05042112072ac5d6f5@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Cope <gregcope@gmail.com>
Cc: netfilter@lists.netfilter.org

> The IP tables are quite long as we have quite a few VPN rules.

Ok.  I understand and will take that in to advisement.

> The rest is quite straight forward.
> 
> What would be easiest to start with.

Well if you are not doing any thing weird as far as filtering in your nat or mangle tables then I'd like to see an output of your filter tables FORWARD chain.  If you want to scrub IPs for security reasons I understand perfectly.  Can I also see an output of "ip route list table main"?  Can I get a list of what devices / aliases and their IPs are (or scrubbed for conversation)?  That way what I send back to you could be close to production information.

> PS its night time here in the UK ......

*nod*  I'm presently at -5 UTC (day light savings time, we are really -6).



Grant. . . .

