From: Michael Eck <michael.eck@gmail.com>
Subject: Bridging QoS Box Crashing
Date: Mon, 23 Aug 2004 15:48:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <d82fbdb704082312482f02c2c8@mail.gmail.com>
Reply-To: Michael Eck <michael.eck@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Greetings,
I have a Debian Woody box running Linux 2.4.24, iptables 1.2.11 with
pom-ng-20040621
patches ipt_helper_invert-fix proc_net_conntrack-permissions CLASSIFY
CONNMARK, ipp2p, and l7-filter.

I have the kernel oops, and have processed the output with ksymoops
using logged output
for my /proc/ksym, and /proc/modules.  

I'm not sure what I should do with the ksymoops output now that I've
done, as far as I can tell, all the
right things to make it intelligable to a developer.  I'm writing this
here because I hadn't had any trouble with the machine until I applied
all of those patches and started running with them.  At this point I'm
getting about 1 week uptimes until the kernel panics.  I am not
finding any corresponding event to the oops and cannot therefore
reproduce it.

Apologies in advance if this is the wrong forum for this message. 
I'll post the ksymoops output if it's appropriate.

Thanks for the help,
Michael Eck
Chilitech Internet Solutions, Inc

