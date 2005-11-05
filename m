From: Dave Handler <dhandler@nycap.rr.com>
Subject: How to drop an isp
Date: Sat, 05 Nov 2005 09:04:43 -0500
Message-ID: <436CBBFB.1070101@nycap.rr.com>
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

Greetings!

Sorry if I worded my subject wrong, it's the best I could do!

Ok, I'm on Fedora Core 3, running iptables 1.2 (which seems to be 
holding its own).  Logwatch sends me my logs every morning and I see 
people trying to tap in to tcp port 25.  I do lookups on the addresses 
and they all seems to be coming either from Taiwan or China.  A few in 
Europe and every once in while one from the US.

I've been googling around for how to block them.  I'm rather green to 
iptables and some of the options confuse me.  Is there a way I can block 
the whole ip from me?  I'll paste in a section where there where 
accepted packets:

Accepted 327 packets on interface eth0
  From 69.21.138.231 - 169 packets to tcp(22)
  From 70.86.208.18 - 6 packets to tcp(25)
  From 72.36.128.42 - 6 packets to tcp(25)
  From 202.107.195.52 - 128 packets to tcp(22)
  From 207.150.176.81 - 16 packets to tcp(25)
  From 219.133.247.226 - 1 packet to tcp(25)
  From 219.134.232.31 - 1 packet to tcp(25)


So for instance I probably would want to block 202.107.0.0 through 
202.107.255.255.  But I'm not really sure of the syntax I should be 
using.  And I don't want to screw up what I already have in place.

I'm going to chalk this one up as another learning experience!

Thanks in advance!

Dave

