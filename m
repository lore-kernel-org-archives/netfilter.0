From: Mark Beaver <beaverm@corp.earthlink.net>
Subject: Question on netfilter/iptables
Date: Sun, 02 May 2004 20:16:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40958F69.3090606@corp.earthlink.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm looking to perform a specific task with a firewall/router 
application or peice of hardware:

the box will have anywhere up to 20-100 external IP addresses, 
internally it will have 1, on a network of a 20-30 machines.

What i"m looking for is:

be able to dynamically change port/IP redirection (I'd be writing an API 
  or script if necessary)

No loss of connectivity for non-affected IP/Port routes.
(ie. if it doesn't change current streams should not be affected)

I'm curious if this is possible or not.

Basically I want to have different types of servers on the internal 
network on different boxes (several of the same type, but not the same 
actual information) and to be able to refer the same IP (on differing 
ports) to different boxes, and want to be able to dynamically change 
those without affecting other streams.

The bandwidth I'd be looking at could get in upwards of 100Mbit and 
likely no less than 2-5Mbit steadily (if not higher in the future)


Thanks,

Mark Beaver
'There is no cause for alarm , but there probably will be.' --Brain

