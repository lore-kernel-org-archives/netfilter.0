From: Marco Shaw <marco@nbnet.nb.ca>
Subject: Doing stuff to the payload in user-space?
Date: 05 Nov 2003 23:29:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068089385.19457.6.camel@localhost.localdomain>
Reply-To: marco@nbnet.nb.ca
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

OK, looking for some hints to get me going a bit further.  I want to use
the iptables queue feature to send some packets to user-space.

I then want to do some edits to the payload.  Is this even possible
without trashing the packet?  I was thinking about CRC checks and stuff
causing problems.

I've played a bit with perlipq, and am not much of a C programmer so
I've stayed away from libipq, for example, for now.

Marco


