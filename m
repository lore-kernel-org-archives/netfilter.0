From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Best Practices for iptables
Date: Fri, 5 Dec 2003 21:33:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312052133.57404.Antony@Soft-Solutions.co.uk>
References: <7C9884991ADAE0479C14F10C858BCDF5122EB0@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122EB0@alderaan.smgtec.com>
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

On Friday 05 December 2003 8:54 pm, Daniel Chemko wrote:

> I don't know what either you or the parent are talking about.
>
> The OUTPUT chain is ONLY useful for filtering when:
>
> 1. The machine runs services as an account other than root; in which
> case, default-accept is still ok in my book, just filter the uid of the
> service.
> 2. You don't know how to work with inbound packets
> 3. The machine is a multi-user access server
> 4. The machine is a workstation

Situations 3 and 4 are probably common enough that output filtering should be 
considered by anyone implementing netfilter.

I don't understand 2 - if you can't get your inbound filtering right, how can 
you solve your problems using outbound filtering?

Number 1, however, is in my opinion so universally true that it means every 
box is worth performing outbound filtering on.   Most services, even if 
they're started by root-privilege scripts at boot time, drop privileges and 
run under other accounts.   A mail server, a web server, an ftp server, a 
file server - all these will be running services under non root accounts.

The reasons why output filtering is a good idea are numerous:

1. You can allow / prohibit access to destinations selectively.
2. You can prevent access to external services which should not normally be 
part of the software configuration on the machine, but which might be enabled 
by misconfiguration or 'creative' coding.
3. You can ensure that any applications which turn out to be Trojan (however 
strongly you wish to apply the term) cannot get access to other systems which 
you weren't expecting.
4. After all the rules allowing the traffic you expect, a LOGging rule will 
helpfully tell you what else is being tried on your machine which you might 
want to know about.

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


