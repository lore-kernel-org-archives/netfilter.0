From: Luis Miguel Cruz <luismi@b2bi.es>
Subject: High-Availability topology and netfilter conntrack sessions
Date: Tue, 10 Aug 2004 13:00:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4118AABC.50300@b2bi.es>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi all,

I am designing a HA environment, a fw cluster.

I have a little-big dude, I am going to use keepalive to provide the 
control method for the HA. The problem is.. is there anyway to provide 
connections state information to the backup-fw?

LuisMi

