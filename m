From: Andre Costa <brblueser@uol.com.br>
Subject: Re: iptables grep problems
Date: Mon, 3 Feb 2003 11:29:09 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030203112909.133454d2.brblueser@uol.com.br>
References: <1044278051.9027.50.camel@juna.cypherworld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1044278051.9027.50.camel@juna.cypherworld.org>
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

Hi Santos,

if you're putting this into /etc/sysconfig/iptables (RH) or any other
ruleset meant to be loaded with iptables-restore, you're out of luck:
shell commands cannot be executed there.

If not, then it's most likely a shell related problem (I mean: it
shouldn't be iptable's fault); post the errors msgs here so that we can
try to help you.

Best,

Andre

On 04 Feb 2003 00:14:11 +1100
saint <nagajuna@optushome.com.au> wrote:

> Hi all,
> 
> It seems I'm in a bit of a bother.  Here's my problem:
> I have a semi-permanent IP address provided by my ISP
> and I can't do one of two things:
> 1. use eth0, and
> 2. use a combination of grep, awk, & ifconfig.
> 
> Normally, if I issue this from the bash shell:
> 
> $ifconfig eth0 | grep 'inet addr' | awk '{print $2}'
> 
> I get the intended result i.e the external interface's IP address.
> So why can't I get anything when I put this in the firewall script?
> Actually, I do get something: ERRORS!
> 
> If someone would kindly help me with this problem
> and relieve my suffering it'll be very much appreciated.
> 
> Thanks.
> 
> Santos.
> Still learning.
> 
> 


-- 
Andre Oliveira da Costa

