From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help!! network traffic limit function of iptables didn't work effectively to repel DoS attack.
Date: Fri, 1 Nov 2002 12:53:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211011253.gA1CrDe14619@vulcan.rissington.net>
References: <7755C6A016B3.AAAE5B@mails1.hust.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7755C6A016B3.AAAE5B@mails1.hust.edu.cn>
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

On Friday 01 November 2002 9:46 am, fxian_2003 wrote:

> Hi!
>     To defend DoS attack,iptables implement rate-limit function. Today I
> used a DoS-type attack tool to syn-flood the targeted machine, the CPU load
> of the machine rised sharply to 90%. Then I add a iptables limit rule in
> which limit rate is 3/min, but the result was dissapointed for the load of
> CPU was still 90%. So I deduced that traffic limit function could't repel
> DoS attack effectively.

What happens if you have the rate limit rule in place *before* attacking the 
machine with your DoS tool (which I think is a more realistic test) ?

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

