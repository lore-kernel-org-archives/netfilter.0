From: Rackage | Randles <randles@rackage.com>
Subject: iptables-retore very slow
Date: Mon, 05 Mar 2007 18:10:07 +0000
Message-ID: <45EC5CFF.5000209@rackage.com>
Reply-To: randles@rackage.com
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

Hi,

I recently noticed that one of my firewalls was taking a very long time 
to reboot. Which was odd as its a very new  machine.

On investigation is seemed to be the iptables-restore command that was 
adding 10+ minutes to the boot-up times.

I ran iptables-restore from a terminal and found that it was indeed 
taking an amazingly long time.

Obviously I assumed it was related to the rules on the server, so I 
flushed all rules and all user defined tables from the firewall (nat, 
mangle and filter) and used iptables-save which took less than 1 
millisecond :) on the empty rule set.

However iptables-restore is still taking 10+ minutes even with no rules 
to read / apply.

Has anyone seen the behaviour before?  or has anybody got some bright 
ideas on how I might continue debugging this issue?

Thanks in Advance

Regards

Ben


