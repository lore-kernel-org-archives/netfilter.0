From: Khanh Tran <khanh@slc.edu>
Subject: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 16:06:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB572@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

I tried searching MARC for this one and couldn't find an answer...

I have setup logging on my FORWARD chain with:

iptables -A FORWARD -j LOG --log-tcp-options --log-ip-options

It's logging just fine and showing up in my logs, but it's missing the MAC
address.  I've seen the MAC address show up in logs from other peoples'
posts and such.  Am I missing a log option switch?  Possibly something not
compiled in my kernel?  Not loading a module?  Thanks in advance...

Khanh Tran
Network Operations
Sarah Lawrence College


