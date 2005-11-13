From: Masayuki Tanaka <tan5656@yahoo.co.jp>
Subject: DNAT incoming SIP call
Date: Mon, 14 Nov 2005 01:01:08 +0900
Message-ID: <43776344.6000506@yahoo.co.jp>
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

I'm setting up the sip phone device behind the nat and trying to DNAT
incoming sip call, but I can't establish the call (ringing was
arrived but no sound). I sniffed the sip traffic with Ethereal and
found that "200 OK" response does not be NATed properly...
Does sip_contrack_nat has capability to DNAT incoming SIP call?


Regards,
Masayuki Tanaka





--------------------------------------
Know more about Breast Cancer
http://pr.mail.yahoo.co.jp/pinkribbon/


