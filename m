From: Florent Guiliani <fguiliani@perinfo.com>
Subject: tun99 not trapped by tun+
Date: Tue, 29 Aug 2006 10:26:12 +0200
Message-ID: <44F3FA24.2070004@perinfo.com>
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

I've about 30 VPN with vtun who use tunXX interfaces (from tun0 to 
tun40). I've
others VPN with OpenVPN but all is using only one interface: tun99.

For some strange reasons a rule who match in:tun+/out:any doesn't match 
packets from tun99.

Any Idea?

Florent,


