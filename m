From: Damjan <gdamjan@mail.net.mk>
Subject: Howto match only the first connection from an IP
Date: Tue, 18 Nov 2003 06:12:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031118051208.GA24242@legolas.on.net.mk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

My goal is to set-up an iptables rule that will match and DNAT the
first connection from a client. 

The first connection is defined as the first established TCP session 
from the time the iptables rule is inserted. No other TCP connection
should match nor should be DNAT-ed.

Is there any easy way to do this with current Netfilter/Iptables/pom.

(I have installed almost all the patches from pom)


-- 
Damjan Georgievski
jabberID: damjan@bagra.net.mk

