From: Damian Gatabria <damian_g@speedy.com.ar>
Subject: iptables dnat to loopback
Date: Fri, 06 Aug 2004 08:38:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091792314.2256.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: Lista Netfilter <netfilter@lists.netfilter.org>

Hello listers.

I know this is probably not the proper place to ask 
a support question, but after a long googling
session and asking in my regular lists i was unable to 
get an answer for what i think is a rather tough situation..

So, flame me if you must, but here it is =oP

I have a rather busy server box hosting several web
sites in separate independent installation directories,
which means several apache, mysql and tomcat installations
running simultaneously, with each mysql instance binding
a port in the loopback interface.

Now, for a very specific reason, i need to provide someone
with remote access to one of these mysql instances. 

It would be a real hassle to change mysql's config
(and the webapps' working with it) so i just decided
to use DNAT to redirect incoming tcp connections 
to the loopback interface.... but for some reason you
hopefully already know about, it doesn't seem to work. 

So, while this iptables rule does work for port forwarding
to another host:

iptables -t nat -A PREROUTING -p tcp -i eth0 -m multiport \
        --dports mysql -j DNAT --to some.other.host

changing "some.other.host" to 127.0.0.1 doesn't work
as expected, and packets seem to be dropped altogether.
Using tcpdump i can see packets reaching eth0, but
never reaching loopback.

Is there any way to make iptables do what i'm looking
for? Any help will be greatly appreciated.

Thanks much.

-- 
Damian Gatabria <damian_g@speedy.com.ar>


