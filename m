From: "IT Clown" <iptables@mailbox.co.za>
Subject: client on local network
Date: Sun, 28 Mar 2004 10:31:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-269277793@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi

i have setup a local network users iptables as follow to
access webpages:

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A INPUT -i eth0 -p tcp -m multiport --sport 80,8080 -j
ACCEPT
-A INPUT -i eth0 -p tcp --sport 53 -j ACCEPT
-A OUTPUT -o eth0 -p tcp -m multiport --dport 80,8080 -j
ACCEPT
-A OUTPUT -o eth0 -p udp --dport 53 -j ACCEPT
COMMIT

I would like to know the way i set it up is it correct or
is there a better way.The client can browse.

What i dont really understand is the sport and the dport.
When i say: -A INPUT -i eth0 -p tcp -m multiport --sport
80,8080 -j ACCEPT. Does that mean any ip external and port
80,8080 from external?

-A OUTPUT -o eth0 -p tcp -m multiport --dport 80,8080 -j
ACCEPT. The output and dport is that arguemant for the
network client to go out onto port 80,8080?

The rules i have here i did with trile and error.

Regards
__________________________________________________________________________
http://www.webmail.co.za/dialup Webmail ISP - Cool Connection, Cool Price

