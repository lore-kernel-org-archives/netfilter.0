From: "Crasher Guo" <gdz@sinfors.com.cn>
Subject: how to patch netfilter to support h323.
Date: Fri, 28 May 2004 16:16:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405280804.i4S84YEk025493@name.sinfors.com.cn>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,all

My OS is Redhat 9.0 , kernel 2.4.20-8 , iptables: 1.2.9a
I've download patch-o-matic-ng-20040302  from www.netfilter.org and patch the kernel source code as follow:
./runme extra 

==>select h323  patch and press "Y" , get there messge :" apply cleanly"
then I use make menuconfig to reconfigure the kernel complie option, but I  can't find any option about H323 in "netfilter configure -->" .   why?

Could you help me ? 

------ which patch I've patched to the kernel -------------------
This adds CONFIG_IP_NF_H323: H.323/netmeeting support module for
netfilter
connection tracking and NAT. H.323 uses/relies on the following data
streams:

   Port         Description
   389          Internet Locator Server (TCP)
   522          User Location Server (TCP)
   1503                 T.120 Protocol (TCP)
   1720         H.323 (H.225 call setup, TCP)
   1731         Audio call control (TCP)
   Dynamic              H.245 call control (TCP)
   Dynamic              RTCP/RTP streaming (UDP)

   The H.323 conntrack/NAT modules support the connection tracking/NATing of
   the data streams requested on the dynamic ports. The helpers use the
   search/replace hack from the ip_masq_h323.c module for the 2.2 kernel
   series.

   At the very minimum, H.323/netmeeting (video/audio) is functional by
letting
   trough the 1720 port and loading these H.323 module(s).

   The H.323 conntrack/NAT modules do not support

   - H.245 tunnelling
   - H.225 RAS (gatekeepers)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y


Thanks for your time.
Thanks for your help.
			
Crasher Guo




