From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Match Patterns in POSTROUTING Table and output it
Date: Wed, 2 Oct 2002 11:27:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210021027.g92ARoL07732@vulcan.rissington.net>
References: <007501c2691b$fe961f80$60faa8c0@gpcalvin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007501c2691b$fe961f80$60faa8c0@gpcalvin>
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
To: netfilter@lists.samba.org

On Tuesday 01 October 2002 8:27 am, pevee wrote:

> Hi,
>
>    Hope that this will be post to the mailing list. My task is to
>
> (1) Read a set of IPs from a configuration file
> (2) Match this set of IPs with all the entry in POSTROUTING chain
> (3) IF any entry that matches criterias (pkts > 10000 AND bytes > 30M),
> output the entries into a file.

> My questions are:-
>
> (1) Can I do this with current iptables?
> (2) If not? Should I start writting extension for iptables? Which
> documentation can get me get started?

Yes, you should have all the information you need to write some fancy scripts 
to do this, if you use iptables -L POSTROUTING -v -n -x to get your packets & 
byte counters.   The -n option makes sure you have numeric IP addresses in 
the rules (not hostnames) and the -x option shows the exact count value for 
the packet / byte counts, instead of being abbreviated with things like M and 
G.

I'd suggest you start with something like:
iptables -L POSTROUTING -n -v -x | grep -f IPlist
and then feed the result into a Perl script (or maybe awk if you're happier 
with that ?), but there will be many different ways of achieving it.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

