From: Pavlos Parissis <p_pavlos@freemail.gr>
Subject: ssh behind a firewall
Date: Wed, 27 Nov 2002 19:51:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127195137.427c6da0.p_pavlos@freemail.gr>
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

Hello all,
I have a firewall running iptables and connected to the internet with ISDN
and
it has static ip.
Behind the firewall i have a samba server which also has ssh server.
I want people from internet to connect with ssh and use the sftp-server in
order
to put/get files to that server.
So i said i will use these rules

$IPT -t nat -A PREROUTING -i $EXT_IFACE -p tcp -s ! $LAN_IP_RANGE --dport
2222 -j DNAT --to-destination $SSH_SERVER
$IPT -A internet-lan -p tcp -d $SSH_SERVER --dport 2222 -m state --state
NEW,ESTABLISHED -j ACCEPT
$IPT -A lan-internet -p tcp -s $SSH_SERVER --sport 2222 -m state --state
ESTABLISHED -j ACCEPT

I did n't try it so i would like to know
if is it possible this scenario to work?

Yours,
PAvlos


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


