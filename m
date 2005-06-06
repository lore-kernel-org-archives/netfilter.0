From: Phani Kumar <pkumar@students.iiit.net>
Subject: redirect unauthenticated traffic to a registration portal
Date: Mon, 6 Jun 2005 15:17:21 +0530 (IST)
Message-ID: <Pine.LNX.4.61.0506061504430.23665@students.iiit.ac.in>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
    I have implemented a linux router with 4 interfaces.

eth0 -- outside net
eth1 --
eth2 --    diff Internal n/ws
eth3 --

Now I had to allow only authenticated traffic to pass through the 
router(i.e through interface eth0).
I have a list of all authenticated Mac-addresses in a file.

All unauthenticated traffic (i.e non-authenticated mac-address traffic) 
had to be redirected to default registration site.


Pls can anyone suggest me how to do above task.
I am able to allow only authenticated traffic by using

iptables -t filter -A FORWARD -m --mac-source xx.xx.xx... -i eth0 -j 
ACCEPT

and so on for all authenticated users

iptables -t filter -A FORWARD -i eth0 -j DROP

How do I redirect the unathenticated traffic to a registration portal 
rather than dropping it??


Phani
IIIT-Hyd

