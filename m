From: Kevin Dwyer <Kevin.Dwyer@algx.net>
Subject: Special UDP case.
Date: Fri, 20 Sep 2002 09:58:49 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0209200937390.11384-100000@klepto.security.algx.lan>
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
To: netfilter@lists.netfilter.org

Hello list,
	I've done some digging in the list archives but can't seem to find
anyone with the problem I'm having. (I may just have looked in the wrong
places, and if this is redundant I apologize - just point me in the right
direction)

	Basically, we have a problem with connections to a portmapper
on a cluster of machines.  A masqueraded client, behind our netfilter
firewall, initiates an RPC call to the cluster IP but it receives a
response from one of the members of the cluster.  (I know this is a bad
setup, but I'm trying to work with it -- it may not be possible to fix
their end)  So, the firewall dutifully drops the packet since it has no
previous record of a connection from this new IP.  I have been able to
work this problem by setting up NATs for machines behind the firewall and
allowing the right UDP ports from the right machines, but masquerading
machines can't be setup this way since the firewall wouldn't know where to
send the data.

	So, is there a solution?  I considered the possibilty of mangling
the incoming UDP to change the source IP to the original cluster IP that
we contacted -- but my understanding of the way packets traverse the
chains leads me to believe that may not be possible.  I also considered
hacking my own ip_conntack_whackedUDP.c ala *_ftp.c and *_irc.c, but
wanted to see if there was a way to handle the problem intrinsically, and
to find out if doing something like that would even work.

	Any and all help is appreciated.  Thanks.



/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */




