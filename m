From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: bind 9 and iptables
Date: Sat, 28 Aug 2004 00:02:46 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093669366.413011f68e956@webmail2>
References: <web-420408468@mail01.infosat.net> <412F9B73.9010603@pbl.ca>
	<20040828004436.GB22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040828004436.GB22322@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Quoting Nick Drage <nickd@metastasis.org.uk>
Date: Sat, 28 Aug 2004 01:44:36

> Out of interest, why only permit packets with a source port of 1024 and
> above?  This rule might not pass DNS requests if they come from a local
> DNS server being used internally, if it's set up with a "query-source"
> of port 53.  Also the use of source ports is OS dependant, so if you're
> going to watch this why not pick the range the OS uses?  The range of
> your Linux system can be found via

Good question...  Probably just a habit ;-)  Safe to use restriction without
having to worry about OS specifics.  As for query-source, options in BIND 9 for
forcing sport to 53 are there mainly as workarounds for people that have to live
with old firewall configurations and old assumptions.  Something that most new
installations really don't need.  I wouldn't be suprised at all to see those
options go away one day in future.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7



