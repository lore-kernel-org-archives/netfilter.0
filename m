From: Steve Turnbull <steve.turnbull@yhgfl.net>
Subject: Re: No chain/target/match by that name
Date: Sun, 05 Sep 2004 16:52:44 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413B364C.1060407@yhgfl.net>
References: <413B233C.3000601@yhgfl.net>
	<1094396051.1745.20.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094396051.1745.20.camel@wolfpack.ljm.dom>
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

Jason Opperisano wrote:
> On Sun, 2004-09-05 at 10:31, Steve Turnbull wrote:
> 
>>Hi
>>
>>Our web server is configured;
>>Debian (Woody) (No X installed)
>>Kernel 2.4.23 - configured with iptables in mind
>>iptables v1.2.6a
>>
>>When we start the firewall script, we get this message;
>>'No chain/target/match by that name'
> 
> 
> start your fw script with the following:
> 
>         bash -x <script>
>         
> and it will show you the parsing of every line and you will be able to
> see which line causes the error.
> 
> if i had to take a stab in the dark--i'd guess it's "-m state" rule;
> which would mean you built your kernel without connection tracking
> support--which would explain the other behavior as well...
> 
> the connection tracking option is "CONFIG_IP_NF_CONNTRACK" in your
> kernel config.  i *highly* recommend including it unless you have a very
> compelling reason not to.
> 
> -j
> 
Thanks for the reply

Our Kernel .config file (iptables extract) shows this (see below), which 
suggests CONNTRACK is on. Does any of the other setting need compiling in??

Regards
Steve

#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_FTP=y
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_TFTP is not set
# CONFIG_IP_NF_IRC is not set
# CONFIG_IP_NF_QUEUE is not set
CONFIG_IP_NF_IPTABLES=y
# CONFIG_IP_NF_MATCH_LIMIT is not set
# CONFIG_IP_NF_MATCH_MAC is not set
# CONFIG_IP_NF_MATCH_PKTTYPE is not set
# CONFIG_IP_NF_MATCH_MARK is not set
# CONFIG_IP_NF_MATCH_MULTIPORT is not set
# CONFIG_IP_NF_MATCH_TOS is not set
# CONFIG_IP_NF_MATCH_RECENT is not set
# CONFIG_IP_NF_MATCH_ECN is not set
# CONFIG_IP_NF_MATCH_DSCP is not set
# CONFIG_IP_NF_MATCH_AH_ESP is not set
# CONFIG_IP_NF_MATCH_LENGTH is not set
# CONFIG_IP_NF_MATCH_TTL is not set
# CONFIG_IP_NF_MATCH_TCPMSS is not set
# CONFIG_IP_NF_MATCH_HELPER is not set
CONFIG_IP_NF_MATCH_STATE=y
CONFIG_IP_NF_MATCH_CONNTRACK=y
# CONFIG_IP_NF_MATCH_UNCLEAN is not set
# CONFIG_IP_NF_MATCH_OWNER is not set
CONFIG_IP_NF_FILTER=y
# CONFIG_IP_NF_TARGET_REJECT is not set
# CONFIG_IP_NF_TARGET_MIRROR is not set
# CONFIG_IP_NF_NAT is not set
# CONFIG_IP_NF_MANGLE is not set
CONFIG_IP_NF_TARGET_LOG=y
CONFIG_IP_NF_TARGET_ULOG=y
# CONFIG_IP_NF_TARGET_TCPMSS is not set
# CONFIG_IP_NF_ARPTABLES is not set


-- 
Steve Turnbull
Digital Content Developer
YHGfL Foundation

t 01724 275030
e steve.turnbull@yhgfl.net


