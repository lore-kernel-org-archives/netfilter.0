From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: looking for rules for samba-related traffic
Date: Sun, 6 Apr 2003 14:31:12 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304061428160.14285-100000@dell>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  (sorry if you already saw this -- due to the fact that i've
been messing with my iptables setup, i'm not sure this made
it out the first time.)

  i'm looking for the ruleset to filter all samba-related
traffic.  i realize that this involves ports 137-9, based
on what i see in /etc/services.  but i did a quick google
search and a couple sample sets i've seen refer to TCP 
traffic, when i've already confirmed that, for example,
nmblookup is UDP.

  so, anyone have a pointer to a nicely-annotated set of
rules for samba, mounting filesystems, printing, etc?
thanks.  

  in the meantime, i'll just keep experimenting and 
watching the packets.

rday


