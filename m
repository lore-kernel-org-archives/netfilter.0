From: sean <seandarcy2@gmail.com>
Subject: how do I target a specific machine - not ip address?
Date: Sun, 10 Dec 2006 11:40:12 -0500
Message-ID: <elhd9c$ema$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I want to connect from travel to my server. Since I'm 
connecting through hot-spots or hotel connections, my ip 
address will be all over the place.

I thought about putting the laptop's MAC address in the 
packet, and using mac-source, but I've it seems to MAC 
address is stripped out over the internet.

So, how do I set it up so the server will know my laptop 
from whatever ip address I happen to have.

BTW, the laptop is linux, so I can mangle POSTROUTING if 
that helps.

I can ssh, but what I want to do is set up an NFS mount.

sean


