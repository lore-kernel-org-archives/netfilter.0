From: DiegoLacerda <diegolacerda@gmail.com>
Subject: Unknown error 4294967295
Date: Tue, 28 Jun 2005 16:58:03 -0300
Message-ID: <42C1ABCB.8020209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi people!

I got this message with the PSD and UNCLEAN modules, but I succeeded by 
reconfiguring and compiling my kernel again.
Try to recompile your kernel source with CONFIG_IP_NF_TARGET_NETMAP=y 
option in your .config file.

Best regards,
Diego Lacerda.

> Hi
 
> On Mon, 06 Feb 2006 19:20:49 -0600
> Jorge Davila <davila at nicaraguaopensource.com <https://lists.netfilter.org/mailman/listinfo/netfilter>> wrote:

>>/ Hi list!:
/>>/ 
/>>/ Trying to execute this rule
/>>/ 
/>>/ iptables -t mangle -A PREROUTING -s  -j NETMAP --to 192.168.3.0/24
/>>/ 
/>>/ I receive
/>>/ 
/>>/ iptables: Unknown error 4294967295
/>>/ 
/>>/ Someone knows where to look?
/>>/ 
/
>first i would look into your arguments, as the source-ip(range) to match
>is not specified. second i would look into the argument-handling of
>iptables as this error is easy to catch ;)

>regards
>virtual




