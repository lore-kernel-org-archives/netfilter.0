From: Vivek Dasmohapatra <vivek@etla.org>
Subject: Re: forwarding ports from aliased ip addresses
Date: Thu, 9 Jun 2005 23:06:36 +0100 (BST)
Message-ID: <Pine.LNX.4.62.0506092258380.13220@pike.pepperfish.net>
References: <42A4C90B.8040306@doki-doki.net> <42A8BA57.7000402@doki-doki.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A8BA57.7000402@doki-doki.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mike Pepe <lamune@doki-doki.net>
Cc: netfilter@lists.netfilter.org

On Thu, 9 Jun 2005, Mike Pepe wrote:

> Mike Pepe wrote:
>> Hi all. I'm new to the list but not to netfiler.
>> 
>> using -i eth5:1 doesn't work.
>> 
>> Is this even possible? I've been up and down the man page and I can't seem 
>> to figure out a way to differentiate the alias from the "normal" ip. I 
>> guess I could add another network card and duplicate the scripts but this 
>> seems so wasteful to me.

As I understand it, -i refers to th physical interface, which is eth5, not 
any of its aliases.

You haven't said how you are forwarding the traffic: is it simple forwarding
to the DMZ address (ie the client box knows it is talking to the DMZ 
address) or are you doing DNAT?

Either way, it doesn't matter.

You can specify that the packet is allowed through based on both the 
physical interface in (-i) and the destination ip address (-d)

so: If you are doing simple filtering/forwarding, you need to
make your rule based on -i eth5 -d $dmz_ip_addr -s $allowed_client_net
in the filter tables FORWARD chain.

If you are doing DNAT, then you would make a similar decision, but in the
PREROUTING chain of the nat table, and possibly add another rule in the
forwarding table to allow the packets to traverse your firewall.

HTH
-- 
Vivek




