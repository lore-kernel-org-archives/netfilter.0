From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: connection tracking without iptables?
Date: Mon, 25 Oct 2004 15:48:44 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417D66AC.1070600@pbl.ca>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>	<561dc326040930160476d839c7@mail.gmail.com>	<1096587270.22962.24.camel@wolfpack.ljm.dom>
	<561dc326041014113163a6a9eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc326041014113163a6a9eb@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jiann-Ming Su wrote:
> On Thu, 30 Sep 2004 19:34:30 -0400, Jason Opperisano <opie@817west.com> wrote:
> 
>>  egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
>>
> 
> 
> We're finding that any read operation on /proc/net/ip_conntrack really
> locks the system until that operation is completed.  That is, it's
> almost as if the read prevents any writes, so the firewall locks up
> momentarily until the read is done.  Is there a less system intensive
> way to read ip_conntrack?  Or, is my observation completely wrong?

 From linux kernel 2.6.9 changelog:

[NETFILTER]: add sysctl to read out the number of current connections
	
Apparently a lot of scripts use a construct like
    cat /proc/net/ip_conntrack | wc -l
which has a negative impact on system performance due to all the locking
required.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

