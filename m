From: "Small, Jim" <jim.small@eds.com>
Subject: Questions about the workings of iptables
Date: Mon, 26 Jul 2004 08:51:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've been using netfilter/iptables for some time and I'm planning on doing a
presentation on it to a local user group.  I've used most of the major
firewalls (pf, ipfilter, iptables, PIX, and CheckPoint) and I've been
comparing features.  Note--I know there are other firewalls like G2,
NetScreen, and CyberGuard and I'm not trying to knock them by leaving them
out!

Two popular firewall features I'm exploring are stateful inspection and
initial TCP sequence randomizing.  I've looked in the archives and couldn't
find very much.  So please allow me to ask:

1)  How extensive is IPTables stateful packet filtering?  Especially with
TCP and the recent reset paranoia
(http://www.uniras.gov.uk/vuls/2004/236929/index.htm), what is checked for
stateful TCP inspection?  Are the sequence numbers carefully scrutinized as
part of the state check?  For an excellent paper on TCP state checking, I
like the following:
http://home.iae.nl/users/guido/papers/tcp_filtering.ps.gz

Is there a listing of everything the connection tracking modules do?
If connection tracking or stateful inspection does not include TCP sequence
checking, is there a way to add it?  Is it well tested/supported?


2)  Can IPTables randomize initial TCP sequence numbers?  If not, is there
an add-on that can?  I saw IP Personality, that's not really what I want.  I
would prefer something that can randomize all initial TCP sequence numbers
traversing an IPTables firewall.

As to why this is important, many clients have weak TCP ISN (Initial TCP
Sequence Number) generators.  While Linux is good in this aspect, many
clients like Windows are not.  And it is not always possible to replace
Windows clients or other clients with weak ISNs.  Proxying might be an
option, but I would really like to know if there is a stateful firewall
option or add-on.


Thanks,
   <> Jim


