From: Emmanuel Guiton <emmanuel@netlab.hut.fi>
Subject: How do I use ip_conntrack_destroyed?
Date: Wed, 03 Dec 2003 12:17:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FCDB83F.3010703@netlab.hut.fi>
Reply-To: emmanuel@netlab.hut.fi
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
To: netfilter <netfilter@lists.netfilter.org>


Hei!

I am writing a new target module which needs to be aware about the 
number of conntracks that are currently known for a particular 
destination. Thus, to make my counter I wish to detect when a conntrack 
is destroyed. I have noticed the following in ip_conntrack.h :

/* Call me when a conntrack is destroyed. */
extern void (*ip_conntrack_destroyed)(struct ip_conntrack *conntrack);

So I guess it particularly fits with my needs. But what about using it?

Is it that I have to write something like:
ip_conntrack_destroyed = &my_counter_function
in my ipt_xxxx_target function and then do my stuff in my_counter_funtcion?

Does it work like this?

              Emmanuel


