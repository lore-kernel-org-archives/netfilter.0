From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LOCALTIME problem.
Date: Wed, 11 Sep 2002 14:42:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111343.g8BDh1v08634@vulcan.rissington.net>
References: <006901c2598f$02fb1540$0a0aa8c0@roy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006901c2598f$02fb1540$0a0aa8c0@roy>
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

On Wednesday 11 September 2002 1:30 pm, Roy wrote:

> Dear all,
>                Did anyone try this function well ?
>                I put ulogd_LOCALTIME.c into ulogd-x/extensions
> directory,and replace Rule.make.in in ulogd-xxx/ It has complied
> ulogd_LOCALTIME.so and installed.
>                add the line
>                           plugin /usr/local/lib/ulogd/ulogd_LOCALTIME.so
>                in ulogd.conf
>                Mysql info.
>                local_time field value is 1031676302
>                It's seems not work,Is my procedure correct ? Thanks for
> your comments.

Looks like a perfectly reasonable time value to me.

I've just done 'date +%s' on my machine and got 1031751577, so I guess you 
did yours yesterday about midnight, judging by the timezone in your email.

The value you are getting is seconds since midnight Jan 1st 1970.

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

