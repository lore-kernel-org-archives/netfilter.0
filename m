From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Access VNC Server via DNAT
Date: Mon, 22 Sep 2003 18:28:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOGEIBCBAA.markee@bandwidthco.com>
References: <bkhmas$bjt$1@sea.gmane.org>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <bkhmas$bjt$1@sea.gmane.org>
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
To: Joel Pearson <pearj@writeme.com>, netfilter@lists.netfilter.org

Other than connection tracking, if you are using stateful, there are not any
special modules needed.  I will also add, allowing VNC to penetrate the
firewall is not the best of ideas, but very possible to do it securely if
you are smart and crafty about it.  Here are a couple of thoughts which
should help you.  First, confirm what port your VNC server is Listening on.
The VNC port range is:  VNC_PORTS="5900:5910".  So, take a look at this.

Having said that, it will also take a minimum of two rules to penetrate the
firewall. 1) DNAT correct listening port through to the correct server as
you have done with:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 59xx -s 192.168.0.2 -j
DNAT --to 192.168.0.25:59xx

That's only half of it.  You must then accept the packet once it is has been
DNATTED, such as:

$IPT -t filter -A FORWARD -i $FW_INET_IFACE -p tcp --destination-port
$VNC_PORTS -m state --state NEW -j LOG --log-prefix "ACCEPT INBOUND VNC: "
$IPT -t filter -A FORWARD -i $FW_INET_IFACE -p tcp --destination-port
$VNC_PORTS -m state --state NEW -j ACCEPT
$IPT -t filter -A FORWARD -o $FW_INET_IFACE -p tcp --destination-port
$VNC_PORTS -m state --state NEW -j LOG --log-prefix "ACCEPT OUTBOUND VNC: "
$IPT -t filter -A FORWARD -o $FW_INET_IFACE -p tcp --destination-port
$VNC_PORTS -m state --state NEW -j ACCEPT

Additionally, if you are using connection tracking, you must ACCEPT as
ESTABLISHED and RELATED as well.  Hope this helps.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Joel Pearson
Sent: Saturday, September 20, 2003 6:57 AM
To: netfilter@lists.netfilter.org
Subject: Access VNC Server via DNAT


Hey,

I have a vnc server that is on my local lan at home that I'd like to be able
to access from the internet via my internet gateway linux box.  I've read a
little bit about it but I can't get my gateway to forward to ports, I've
tried this:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 5904 -s 192.168.0.2 -j
DNAT --to 192.168.0.25:5904
But it says it can't connect to the server. At the moment I'm just trying to
get the port forwarding to work on my local lan, but it doesn't seem to be
working. I've read of people haveing this working using a somewhat similar
iptables command, is there some module I'm supposed to load to make this
happen?  My server is running RedHat 8 with iptables v1.2.6a

Does anyone know why this isn't working?

Thanks

Joel






