From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: transfer Bytes Counting
Date: Wed, 2 Oct 2002 15:32:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210021433.g92EX1L08338@vulcan.rissington.net>
References: <FLEKIPPLAEDMJMOOBBDPIEMKDAAA.stewart.thompson@shaw.ca> <20021001233408.IGRL459.mta02-svc.ntlworld.com@there> <009a01c26a19$1e271680$7cfcc5cb@humanpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009a01c26a19$1e271680$7cfcc5cb@humanpc>
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

On Wednesday 02 October 2002 2:39 pm, HareRam wrote:

> Hi
>
> thanks for the reply
> i did the same, but iam not able to see the in and out bytes

If you mean a separate count of bytes in each direction on the connection, 
you would need to have two rules, one to count packets in and one to count 
packets out.

> is there any way i can send those packets to mysql
> from there i can generate report

I believe other people have posted to this list with mechanisms for capturing 
log entries to sql database - can anyone post a tool or URL to help with this?

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

