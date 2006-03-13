From: Steve Comfort <steve@4dllc.com>
Subject: MAC Address filter on wireless interface
Date: Mon, 13 Mar 2006 16:23:19 +0200
Message-ID: <44158057.20203@4dllc.com>
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

Hi All,

I have been trying to get MAC address filtering to work on our wireless 
card - so far without success :

The rules I am using are listed below :

     for M in $(cat /etc/mac.allow) ; do
         $IPT -A INPUT -i $WIFI_IF -m mac --mac_source $M -j ACCEPT
     done
     for M in $(cat /etc/mac.allow) ; do
         $IPT -A INPUT -i $WIFI_IF -m mac --mac-source ! $M -j DROP
     done

(I do have CONFIG_IP_NF_MATCH_MAC turned on).

I'm running on an ARM processor with kernel 2.4.21-rmk1

Is it in fact possible to filter on MAC addresses over a WiFi interface, 
or am I doing something stupid?

Best regards
Steve Comfort


