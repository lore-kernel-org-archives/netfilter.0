From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Multiple IP addresses
Date: Mon, 27 Mar 2006 06:51:10 -0500
Message-ID: <1143460270.2753.5.camel@localhost>
References: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
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
To: Will Twomey <termina@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2006-03-26 at 19:53 -0600, Will Twomey wrote:
> I apologize if this is the wrong list, but...
> 
> I would like to have several (3?) ip addresses on one interface (eth0,
> eth0:1, etc.), and forward each of those IP addresses to another
> interface (192.168.0.1, 192.168.1.1, 192.168.2.1, etc.)
> 
> Does anyone have an advice for me, or a good place to learn how to do this?
> 
> If someone has an iptables/netfilter script that does this, I'd love
> to see it. :D
> 
<snip>
I'm not entirely sure of what you mean by forwarding each to another
interface.  Packets destined for the network associated with each
address will route there naturally.  You will need to bind the
individual addresses to the cards using iproute2, e.g., 

ip add add 192.168.1.1/24 dev eth0 brd +

To find more information on this, look for a file in your distribution
ip-cref.ps

If you mean implementing access controls and/or NAT, you will also need
to invoke iptables FORWARD and nat rules.

ISCS (http://iscs.sourceforge.net) will do all of this automatically for
you including files and dynamic changes to bind the ip addresses, access
control and NAT even in the most complex environments (e.g.,
overlapping, nested, many-to-some, some-to-many NAT).

You can find some slide shows on both iproute2 and iptables in the
training section of the ISCS web page (although a bit dated) and there
is an excellent iptables tutorial at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


