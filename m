From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Localtime problem
Date: Fri, 13 Sep 2002 09:37:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913083750.FBUL13709.mta07-svc.ntlworld.com@there>
References: <004e01c2598d$e40ca550$0a0aa8c0@roy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004e01c2598d$e40ca550$0a0aa8c0@roy>
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

On Wednesday 11 September 2002 1:22 pm, Roy wrote:

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

What is wrong with this value ?   What's "not working" about it ?

It looks like a Unix timestamp representing seconds since midnight Jan 1st 
1970 to me.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

