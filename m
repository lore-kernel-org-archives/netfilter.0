From: "Shazad Malik" <smalik@vistawiz.com>
Subject: [Fwd: Anyone with vpn and iptable strange error message??]
Date: Fri, 31 May 2002 16:10:07 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <2522.192.168.1.27.1022875807.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi all,

I have iptables and freeswan VPN working in my lab but a very interesting
thing is happening and not sure if someone else has seen this:

When I start my ipsec client from my windows2000 to my iptables servers
which is running NAT too works perfectly fine.  It's when i logoff my
ipsec connection then I get this error message on my iptables logs which
start to drop all packets in  both directions! This is the message I get:

ip_conntack: table full, dropping packets

Then whether I stop and restart iptables, i keep getting this message
until I reboot the server!  Now, thats very strange! ANyone with any
ideas.  When I start my iptables it does show me: ip_conntrack (1011
buckets, 8088 max)!

Cheers
hallian



