From: Atsushi Nakagawa <atnak@chejz.com>
Subject: Dropping RST of SYN
Date: Thu, 04 Sep 2003 18:50:34 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904183027.9CC5.ATNAK@chejz.com>
Reply-To: Atsushi Nakagawa <atnak@chejz.com>
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
To: netfilter@lists.netfilter.org

Hi,

What iptables table/rule can I use to drop RST (TCP) packets that're in
reply to SYN?

Below is a picture of how I think it does it if everything is accepted. 
(Final conntrack states in square brackets.)

_Client_  _Firewall_  _Server_
-SYN->    [NEW]        -SYN->
<-RST-    [CLOSED]     <-RST-


This is what I want it to do:

-SYN->    [NEW]        -SYN->
          [CLOSED]     <-RST-
            ^
          IF TCP & [NEW]: DROP '<-RST-' & SET [CLOSED]


I've tried mucking around with some rules but instead of getting the NEW
state when SYN comes along, I always get ESTABLISHED.  (I think I'm
using the wrong table.)

_Client_'s interface is ethC, _Server_'s interface is ethS.  _Server_'s
IP address is 10.0.0.1, port PORT.  _Client_'s address is arbitary.

Regards,


-- 
Atsushi Nakagawa
<atnak@chejz.com>
Changes are made when there is inconvenience.


