From: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Subject: DNAT and VPN Tunnel problems, traffic checks in, but doesn't check out
Date: Mon, 3 Mar 2003 16:23:11 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007f01c2e1d3$7b7fd740$0a02010a@danbeck>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm seeing a strange issue with DNAT'ed traffic over a VPN.  Incoming
packets arrive just fine, but outgoing traffic has trouble for large streams
of tcp data.

My setup is fairly simple.   A group of machines on a private network behind
a gateway/firewall (netfilter) connect through an OpenVPN tunnel to a remote
group of machines on a different private network.

Local subnet: 10.1.2.0/24
Remote Subnet 10.1.1.0/24

Client machines on the local subnet can freely talk to servers on the remote
subnet through the vpn with out any problems.

Until the vpn tunnel was functional, client machines on the local private
network connected to mail.dealnews.com to retrieve and send mail, a public
interface of the mail server on the remote private network.  Now that the
vpn is working, they need to retrieve and send mail using the private
address 10.1.1.7.

For several reasons, one being laptop administration, I don't want to change
all of the mail client's ip addresses to 10.1.1.7.  I want to use iptables
to DNAT packets headed for the public mail address (mail.dealnews.com) to
the private mail address 10.1.1.7 so that packets are routed over the vpn
instead of the internet.

This is how I attempted to configure iptables:
iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -p all -j
DNAT --to-destination 10.1.1.7

The -s option is there so that I can test the config myself without Borking
the rest of the network.

This seems to work at first as I can see traffic sent from the client to
mail.dealnews.com over the tunnel interface on the remote network.  What
happens though, is although that I can connect to the remote mail server
just fine through IMAP and even send out a very small email message through
SMTP, large mail messages just stall and fail.  Ftp is the same way.  I can
transfer files from the remote server, but I can not send any sizeable file
to the server.  I know for sure that traffic is traveling over the vpn
tunnel because I'm dumping the tunnel interface up at the remote network.
This sounds like something to do with fragmentation or possibly something
along that line of thinking, but I can not for the life of me figure out
what this is.

I wondered if possibly, I needed another rule to DNAT packets coming from
the remote network over the tunnel back to the public mail.dealnews.com ip
address:
iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p all -j
DNAT --to-destination 129.41.69.137

But this didn't seem to help anything.

Could anyone help me figure out how I can work around this?  Again, incoming
traffic through the tunnel seems to work just fine, but outgoing traffic
only half seems to work.  As strange as that sounds.

Thanks,

Daniel
dealnews.com



