From: Jason Opperisano <opie@817west.com>
Subject: Re: Iptables Block Netbios Broadcasts UDP 137-138
Date: Tue, 23 Nov 2004 16:01:58 -0500
Message-ID: <20041123210158.GA3214@bender.817west.com>
References: <20041123205139.64577.qmail@web54502.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041123205139.64577.qmail@web54502.mail.yahoo.com>
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
Cc: monkcucumber@yahoo.com

On Tue, Nov 23, 2004 at 12:51:38PM -0800, Real Cucumber wrote:
> I cannot block LAN netbios broadcasts on a fedora core
> 2 Iptables box being used as an IDS.
> 
> It is therefore being 99% flooded with broadcasts.
> 
> I've tried:
> 
> iptables -A INPUT -p UDP --dport 137 -j DROP
> iptables -A INPUT -p UDP --dport 137 -s 0/0 -j DROP
> iptables -A INPUT -p UDP --dport 137 -s 192.168.0.0/24
> -j DROP
> 
> Nothing prevents them from getting through.
> 
> Is there anyway to do this?
> 
> If possible can someone email me direct at
> realcucumber@hotmail.com
> 
> Thanks for any help in advance.

i actually like using:

  iptables -I INPUT -m pkttype --pkt-type broadcast -j DROP

IDS software (like snort, for example) operates at the BPF layer, which
is below where netfilter hooks into the stack.

so it's unclear what your really asking--if your asking, "i installed
these iptables filter rules to block netbios, but my snort logs are still
full of netbios traffic" the answer is, no--netfilter can't stop that.
a BPF appended to the end of your snort command can filter them out
though:

  snort $SNORT_CMD_OPTS not udp port '(137 or 138)'

or, more generically:

  snort $SNORT_CMD_OPTS not dst host '(255.255.255.255 or 192.168.0.255)'

if instead--you are actually asking how to block these packets at layer
3--i would suppose you might have a rule before your rules above that
allow the packets.

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
        --The Simpsons

