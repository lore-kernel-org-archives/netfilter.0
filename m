From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Help!! network traffic limit function of iptables didn't work
 effectively to repel DoS attack.
Date: Fri, 1 Nov 2002 08:18:49 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211010816570.19453-100000@localhost.localdomain>
References: <7755C6A016B3.AAAE5B@mails1.hust.edu.cn>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  (please wrap your lines at 72 characters or less.  thanks.)

On Fri, 1 Nov 2002, fxian_2003 wrote:

> Hi!
>     To defend DoS attack,iptables implement rate-limit function. Today I
> used a DoS-type attack tool to syn-flood the targeted machine, the CPU
> load of the machine rised sharply to 90%. Then I add a iptables limit
> rule in which limit rate is 3/min, but the result was dissapointed for
> the load of CPU was still 90%. So I deduced that traffic limit function
> could't repel DoS attack effectively.  If somebody is interested in my
> experiment, I can mail him my hacker software.

but this doesn't prove anything, beyond that the load was similar.
how do you know if the limiting you added to iptables was working
or not?

you should add logging to see if the extra packets are actually
getting rejected.

rday


