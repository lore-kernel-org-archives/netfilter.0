From: Michael Gale <mgale@utilitran.com>
Subject: Hello .. Packet path :)
Date: Wed, 3 Dec 2003 08:30:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203083034.21e60e89.mgale@utilitran.com>
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

Hello,

	I am trying to make a packet go through the least amount of chains / tables as possible for performance.

I have read through the online documentation about netfilter and this "Linux Firewalls Second Edition" book (which was ok). 

But I still have some questions about the order in which the tables are checked. Here is what I think happens when a pack comes in and should be forwarded to a internal machine

Firewall External interface:
Packet comes in:
NAT table PREROUTING 
NAT talbe OUTPUT
NAT table POSTROUTING
filter table INPUT
filter table OUTPUT or forward

Then you would have the same thing when the packet leaves the internal interface.

Of course this is if you break it down by interface first.

Please let me know if this is correct ?

-- 
Michael Gale
Network Administrator
Utilitran Corporation

