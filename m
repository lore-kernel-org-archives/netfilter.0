From: Philip Craig <philipc@snapgear.com>
Subject: Re: states and UDP
Date: Mon, 06 Mar 2006 11:43:21 +1000
Message-ID: <440B93B9.6060204@snapgear.com>
References: <E1FFBMv-0016UD-1H@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1FFBMv-0016UD-1H@alf1.lmb.internal>
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
To: "T. Horsnell" <tsh@mrc-lmb.cam.ac.uk>
Cc: netfilter@lists.netfilter.org

On 03/04/2006 12:34 AM, T. Horsnell wrote:
> Am I right in thinking that the stateful capabilities
> of iptables (NEW/ESTABLISHED/RELATED etc) only apply to
> tcp connections? If not, how are these states defined for
> udp?
> 
> iptables doesnt complain if I add a rule containing
> '-p udp -m state --state NEW'

Conntrack states are valid for all protocols.
They are different from TCP states.
The man page and tutorial describe what they mean:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#USERLANDSTATES


