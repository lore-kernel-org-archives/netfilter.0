From: <homsher@dejazzd.com>
Subject: ip_conntrack_max
Date: Thu, 13 Feb 2003 14:04:54 EST
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030213190454.MFRO18193.mailrelay@[66.109.229.25]>
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

Hi everyone,

I hope this is an easy question for someone...

I upgraded my memory to 1.3 GB and my ip_conntrack_max increased to 65536 (from 16,xxx). Does this seem sufficient for a 50+ network? I've noticed that ip_conntrack tends to 'hang onto' connections when the remote client terminates abrubtly. For example, an incoming ssh connection on which the ssh client is rebooted may stay in ip_conntrack for 15 minutes or more -- I'm watching this now and it's been 20 minutes. The ssh client machine got M$ blue-screen-o-death and my iptables firewall hasn't figured out that the connection is gone. 

My question(s) are: Is it normal for conntrack entries to hang around after the remote connection has terminated ungracefully? If so, should the state table be 'cleaned up' periodically (and how is this done)? 

And, what happens if/when the firewall exceeds the 65536 connection limit?

Thanks to anyone who can enlighten me on this!

Lori


