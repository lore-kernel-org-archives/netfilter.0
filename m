From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Mon, 30 Sep 2002 20:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020930191759.YMUT13996.mta05-svc.ntlworld.com@there>
References: <200209301224.g8UCOLL03868@vulcan.rissington.net> <40391.64.86.49.17.1033412690.squirrel@www.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40391.64.86.49.17.1033412690.squirrel@www.icafe.co.tz>
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

On Monday 30 September 2002 8:04 pm, Mitesh P Choksi wrote:

> So, how does -SNAT --to 23.23.23.0-23.23.23.16 work.
>
> How does this work? I have now tried it but did not dare to go beyond a few
> seconds.
>
> Does anybody have some documentation / pointers on how to use -SNAT and
> give a range of IP addresses? I will give it a try and see how does -SNAT
> handle the range of IP addresses.

I cannot answer that - hopefully someone else here is more familiar with 
mutliple address SNAT; however please can we clarify something about your 
original question ?

Are you merely trying to do SNAT, to allow internal clients out to the 
Internet, or are you also trying to do DNAT to enable Internet access in to 
your internal machines as well ?

Antony

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

