From: Jay Gallivan <jay.gallivan@inFutureTense.com>
Subject: SuSE 9.2 and Cisco vpnclient 4.6
Date: Mon, 24 Jan 2005 12:45:13 -0600
Message-ID: <41F54239.3080904@inFutureTense.com>
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

Greetings:

I'm trying to vpn between home host and office. I'm running SuSE 9.2 
with SuSEFirewall2 and Cisco vpnclient 4.6.

When I run the config 1, no problem.

config 1: office---internet----gateway/client

When I run config 2, I seem to have trouble with 'large' packets, e.g., 
'ping -s 100 office' is okay but 'ping -s 700 office' fails. I can login 
to the office using config 2, but doing anything that generates a little 
traffice, e.g., top, fails.

config 2: office---internet----gateway----hub----client

This would seem to have a simple configuration fix but I've not been 
able to find one (I understand). What do I need to change?

Thanks,
Jay.

