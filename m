From: Bruhin Gregor <gbruhin@vianetworks.ch>
Subject: redirect packets to multiple hosts
Date: Wed, 2 Jul 2003 09:15:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <44DD250CCB01D51188CD0000E83C052E03226F90@SMARTWEB01>
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
To: netfilter@lists.netfilter.org

Is there a way with netfilter to redirect incoming packets to multiple hosts
?
The idea is really to send copies of the packet, only the destination
address has to be changed, source must still be original sender ip.

Any ideas ? thanks, Greg

