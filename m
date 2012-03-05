From: Kerin Millar <kerframil@gmail.com>
Subject: Re: ICMP packets seeping through a DROP policy - security concern
Date: Mon, 05 Mar 2012 19:51:17 +0000
Message-ID: <jj35fo$t1p$1@dough.gmane.org>
References: <20120304172506.2e79468a@mistral.stie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120304172506.2e79468a@mistral.stie>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/03/2012 22:25, jonetsu wrote:
> The setup is:
>
> unit1<-->  eth4  unit3  eth1<-->  unit2
>
> unit1 is continuously pinging unit2 via unit3. Rules are applied
> on unit3.

In that case, it's the FORWARD chain that matters. The behaviour of 
kernel 3.0.0 seems correct; ping continues to work because the ICMP is 
subjected to connection tracking and you are allowing 
RELATED/ESTABLISHED traffic in the FORWARD chain. To test the INPUT 
chain, you should be pinging unit3, not unit2.

Cheers,

--Kerin

