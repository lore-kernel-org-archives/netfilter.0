From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: how can I test the firewall with iptable
Date: Thu, 13 Jan 2005 14:57:55 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501131452230.20258-100000@darkstar.sysinfo.com>
References: <20050113184512.90097.qmail@web51307.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050113184512.90097.qmail@web51307.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mohamed Nassih <nassihmohamed@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Thu, 13 Jan 2005, Mohamed Nassih wrote:

> 
> Hi,
> 
>    is there any tool for testing a firewall with iptable and have a 
> report with statistics to analyse the performence(...intrusion detection 
> ...).

first, iptables does not really do the part of 'intrusion detection'
that's a totally dfferent tool in most cases, though some other vendors
will  sell an applicane that does both firewalling and IDS.


>    if this tool exist. is it easy to use and to install..
> 

It sounds like you are perhaps kinda new to this game.  There are many
tools that can be used in various ways to test the rules you have placed
on a firewall, and you can use the results of those tools to build a a
report of such testing, nmap, hping2, firewalker, snort, those are free
ones, as well as perhaps something that might be more up your allety,
nessus, though I think I heard something about nessus no longer being a
freebie due to vendors abusing the license and making money off of it
recently.  A google search for firewall testing tools or firewall analysis
tools might guide you, after a bit of FAQ reading.

Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


