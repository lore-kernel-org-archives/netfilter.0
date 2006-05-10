From: "William Bohannan" <william.bohannan@spidersat.net>
Subject: Time matching support
Date: Wed, 10 May 2006 16:12:43 -0000
Message-ID: <002301c6744c$9a259a90$59010a0a@ACCSSWILLIAM>
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
Content-Type: text/plain; charset="us-ascii"
To: fabrice@celestix.com, andrews@stusoft.com, netfilter@lists.netfilter.org, netfilter-admin@lists.netfilter.org

Hello,
I am try to match by time with iptables 1.3.5 on linux kernel 2.6.15.2.
Only problem is I am try to match in the postrouting / mangle stage.  Do you
know if there is a patch or if you have had any success with this matter?

Getting the following errors:

machinenemae login: ipt_time loading
ipt_time: error, only valid for PRE_ROUTING, LOCAL_IN, FORWARD and OUTPUT)


many thanks

william


