From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Logging connections
Date: Thu, 09 Jun 2005 10:58:17 -0600
Message-ID: <42A87529.3070005@pcraft.com>
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


    I have a hole punched in our iptables configuration for an internet 
application we're using to be able to reach an internal server 
directly.  What I'd like to do now is log the connections that are 
coming in to that port.  Ideally I would want the remote address it's 
coming from, a time stamp and what the connection is wanting to do 
(send/receive.)

    The rules related to that hole are setup like this:

    -A PREROUTING -i eth0 -p tcp -m tcp --dport 6666 -j DNAT 
--to-destination 192.168.x.x
    -A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp 
--dport 6666 --tcp-flags SYN,RST,ACK SYN -j ACCEPT

-- 
H | I haven't lost my mind; it's backed up on tape somewhere.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / WebSmith             .     800.441.3873 x130
  Photo Craft Imaging                       .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A. 




