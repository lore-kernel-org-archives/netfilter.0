From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables, squid and snort
Date: Sat, 21 May 2005 16:00:54 -0400
Message-ID: <20050521200054.GA1841@bender.817west.com>
References: <54f57934192f4d889e54ba50bf6b3077@ebasedsecurity.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <54f57934192f4d889e54ba50bf6b3077@ebasedsecurity.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 20, 2005 at 05:59:55AM -0700, traef06@ebasedsecurity.com wrote:
> I am trying to put together a system with Debian 2.6 kernel, iptables 1.3.1, squid and snort all on one box.
> (it's for a very small network 8 - 10 PCs)
> 
> My question is this, if I put this into my iptables rules;
> 
> iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.1 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.0.1:3128
> 
> will this traffic then pass through the OUTPUT chain before it leaves the firewall so then I can put:
> 
> iptables -A OUTPUT -p tcp --dport 80 -j QUEUE

yes.

> after the above so that snort-inline will monitor all outgoing port 80 traffic after it's been "squidded"?
> 
> Please help with any other suggestions on how to do this better.

i'm not sure what you're looking to accomplish by snort-ing the web
browsing traffic of your users.  the vast majority of snort HTTP rules
are written to detect attacks against web servers.  so normally, you'd
be using snort to monitor traffic to your web servers, not from your
clients' web browsers.  if you have an unruly, attack-prone user-base
that you're trying to hinder from pestering the rest of the Internet--I
applaud you.  if you're trying to save your users from their own
stupidity, you'd probably be better off writing some ACL's directly in
your squid conf.

-j

--
"Stewie: What the hell is this?
 Lois: Stewie that's tuna salad.
 Stewie: Really? I could have sworn it was cat food."
        --Family Guy

