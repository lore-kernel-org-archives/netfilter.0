From: decompose <decompose@orcon.net.nz>
Subject: I'm sure you can solve this
Date: Thu, 01 Apr 2004 18:47:24 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406BBAFC.8020600@orcon.net.nz>
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

Hi Ive read the docs and still can't work it out (Yes I'm stupid)

Background: I want to forward traffic from hosts on the switch to 
through router A to router B. (and later from router B to a host on the 
switch, but i guess I could just invert the first problem).

I think one of the reasons i'm having trouble with this is because all 
hosts are on the same subnet (here is the setup)

[switch]-->[router A]-->[router B]-->(Inet)
         192.168.0/24

Ive tryed various things this being one of them (where x is a host on 
the switch)
iptables -t mangle -A POSTROUTING -p tcp -s 192.168.0.x -d 192.168.0.223 
--destination-port 80

I hope my question is clear enough. Thanks in advance



