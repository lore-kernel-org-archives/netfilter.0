From: "semi linux" <linuxsemi@gmail.com>
Subject: Two NICs, same network...
Date: Tue, 8 May 2007 13:17:54 -0700
Message-ID: <e53321d30705081317w3d7e6f5bsb38161f155c883da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=r6oqY7hUXXhudBbXsa9rD1N67kEwmhQJr6NxgqC4HzHD6Y/YgkDb6lK2m/xVkMqjBm7KkUDQtg63YLjtb4KWDJF38zIa4w8fKpHZrzcPcU7N1/6Y/LiLQZWi/37qDcRd9/5Gx0a+6sr0vjTmV/7SFszbDrCSLZ7pO9irWMNqgd0=
Content-Disposition: inline
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

I've got an odd problem where I've got two NICs on the same network
and I want all traffic to one IP to go out one interface and all other
traffic to use the second interface.  I'm going to try an simplify my
actual setup, because a lot of it makes no difference to this post...

I know this has to be a iptables sort of setup since the routing table
can only make a difference on different networks and not based on
looking for a specific IP address.

The question is:

eth0 IP: 10.1.1.1
eth1 IP: 10.1.1.2

target: 10.1.1.3

(these IPs are just examples, there are no hard-fast rules surrounding
the other possibilities)

How do I make sure this goes out eth1 instead of eth0?  Do I use the
mangle rule with the physdev module?

I feel like I'm overlooking something or forgetting my basic network
ideas here...

- Gareth

