From: "Philippe Anctil" <z77y16@hotmail.com>
Subject: safe default chain policies
Date: Thu, 01 Apr 2004 23:58:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY16-F59EdJ7BzKkc100034639@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello list,

I've had quite a bit of trouble setting up nat rules on my iptables home 
network firewall. Machines behind my firewall box couldn't host games, use 
bittorrent efficiently, that type of thing. Not that nothing works. I've 
been surfing, playing games and ftp'ing happily for a while. My problems 
were nat-specific.

I have known for a while my problems were related to my default chain 
policies. I never wanted to compromise security, so I set all of input and 
nat chains to DROP. I left the mangle to accept (never took time to 
understand this table). Is this excessive security? I find such a firewall 
quite hard to maintain because you need to know exactly how chains are 
traversed.

I am thinking to set all chains to ACCEPT except the INPUT chain. Is this 
minimalist security? This is one chain I think I should not be open.

Where to draw the line for a home network?

Thanks for sharing your thoughts!

_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis !  
http://messenger.fr.msn.ca/


