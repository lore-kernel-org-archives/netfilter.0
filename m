From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Re: Saving IPTable rules..oops
Date: Thu, 30 Dec 2004 13:38:38 -0800
Message-ID: <6.1.2.0.0.20041230133624.02598318@corpmail.courtesymortgage.com>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
	<002501c4edd3$872fb6b0$0500a8c0@floydian>
	<6.1.2.0.0.20041230123544.02691b78@corpmail.courtesymortgage.com>
	<002d01c4eeb1$7f6a1fe0$0500a8c0@floydian>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002d01c4eeb1$7f6a1fe0$0500a8c0@floydian>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
	<002501c4edd3$872fb6b0$0500a8c0@floydian>
	<6.1.2.0.0.20041230123544.02691b78@corpmail.courtesymortgage.com>
	<002d01c4eeb1$7f6a1fe0$0500a8c0@floydian>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 12:52 PM 12/30/2004, you wrote:
>I don't think you can put your variables in /etc/sysconfig/iptables file. 
>It follows a particular pattern which is not that difficult to learn.
>
>If you want to use variables and stuff, you gotta write your own script 
>file and run it at bootup. I use do this way when my firewall rules were 
>less than 50 lines.
>
>Now my firewall rules are more than 500 lines so I edit the 
>/etc/sysconfig/iptables file directly. It is just an efficient way to load 
>the rules through this file.


I see. so if i want to use variables, I need to edit/replace 
/etc/init.d/iptables then? with my own custom script?
Sounds like i need to brush up on my scripting. :)

Cheers,

Jason





