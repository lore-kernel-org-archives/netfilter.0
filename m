From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: weird message in logs
Date: Tue, 19 Oct 2004 15:03:39 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4175731B.9030107@pbl.ca>
References: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>	<20041019184419.GA3363@bender.817west.com>
	<11cb01c4b615$52ba8360$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <11cb01c4b615$52ba8360$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Peter Marshall wrote:
> Is it a problem that it is dropping these ?  I tried option a .. it did not
> seem to change anything.

It won't be a problem if you are dropping them.  It's just that your 
firewall will generate extra packets (those redirects).  The remote host 
can opt to ignore them (as well as there's option to disable sending 
redirects, there's option to disable accepting them).

Anyhow, if eth0 and eth1 are on the same wire, you are probably seeing 
some martians in your internal firewall logs anyhow.  So you should be 
used to having extra stuff in logs anyhow ;-)

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

