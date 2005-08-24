From: "Andrew Cant" <acant@logisense.com>
Subject: Problems with the ip_nat_h323
Date: Wed, 24 Aug 2005 11:18:06 -0400
Message-ID: <27761.5158971914$1124896979@news.gmane.org>
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
To: netfilter@lists.netfilter.org

Hi,

I am attempting to get the H323 nat module working. Specifically I want to
pass MGCP VoIP traffic, not H323, but I believe that the H323 module should
do the job.

I am using a 2.4.28 kernel, with iptables 1.2.9, and patch-o-matic-20031219.
I am also using the transparent proxy patches(TPROXY), and serveral other
NAT helpers(ftp, tftp, pptp, proto_gre).

Without the h323 patch the call is established, and the RTP stream passes
out successful and reaches the external port of the machine but is never
forwarded to the client. Hanging up the phone correct dismantels the calls
as well.

I added the h323 module and loaded it using 'modprobe ip_nat_h323', and got
not change in the behaviour. I have turned debugging on in the h323 module,
and see no messages aside from an successful initialization message that I
added.

Is there something I have missed? Does anyone have a suggestion about what
my next step should be?

Thanks for any help that you can give me.

(P.S.: I have also modified the h323 module's call to ip_nat_setup_info to
work correctly with tproxy)

Andrew Cant

Developer
LogiSense Corporation
"IP Billing and Traffic Management"
  
e: acant@logisense.com
p: 1-519-249-0508 x4108
w: www.logisense.com
weblog: http://blog.logisense.com
forum: https://ssl.logisense.com/support/forum


