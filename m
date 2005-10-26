From: Jerry Alexander <jerrya@airmail.net>
Subject: POSTROUTING icmp messages
Date: Wed, 26 Oct 2005 14:36:15 -0500
Message-ID: <435FDAAF.2010305@airmail.net>
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
To: netfilter@lists.netfilter.org, Jerry <jerry@mavenir.com>

NF,

        
         Setting up iptables with PREROUTING to change the destination 
and forward the
packet and POSTROUTING to change the source address.
         PREROUTING works fine.
         POSTROUTING changes the  source address and I get the udp 
packets correctly
but then I get an ICMP  destination unreachable error message.  
        The packet is reaching the destination and the source address is 
changed correctly.
         If I take out the POSTROUTING call the ICMP messages disappear 
but the
messages don't have the modified source address because POSTROUTING has been
turned off.
        Tried many variations on the format and added FORWARDing entries 
but nothing
seems to stop the generation of ICMP packets when POSTROUTING is 
implemented.
         Using linux 2.4-20.
         "ip_forward" is set to 1.
                                                                                                    
Jerry


