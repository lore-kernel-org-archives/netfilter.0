From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Passing X11 through  IPTABLES NAT
Date: Fri, 13 May 2005 08:56:03 +0200
Message-ID: <200505130656.j4D6u8dc007171@smtp26.wxs.nl>
References: <D1D49B61B5B64B4A8FB647B97BEC4ED9025521D9@DCEVS1.tekelec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D1D49B61B5B64B4A8FB647B97BEC4ED9025521D9@DCEVS1.tekelec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "'Hammond, Jeffrey'" <Jeffrey.Hammond@tekelec.com>, netfilter@lists.netfilter.org

If you have only one IP address on the 'outside' interface of your firewall
(the IP you NAT to/from), you will never be able to export a display on port
6000 to more than one client on your private network.

I don't know your complete setup, as you have not specified it here. But if
you configure your firewall / X displays to use different ports (6000 for
one, 6001 for another etc.) you will be able to use more clients on your
private network.

For example, if your NAT ip is 1.1.1.1 you can do the follwing.

NAT 1.1.1.1 port 6000 to 192.168.10.50 port 6000
NAT 1.1.1.1 port 6001 to 192.168.10.51 port 6001
Etc.

Than configure you X applications for the correct display and port. (export
DISPLAY=1.1.1.1:0.0 for 192.168.10.50 port 6000) or (export
DISPLAY=1.1.1.1:0.1 for 192.168.10.51 port 6001). Lots of X applications
will allow you to use a -display option btw.

Hope this clarifies some more.

-----Original Message-----
From: Hammond, Jeffrey [mailto:Jeffrey.Hammond@tekelec.com] 
Sent: 12 May 2005 13:56
To: netfilter@lists.netfilter.org
Cc: Sietse van Zanen
Subject: RE: Passing X11 through IPTABLES NAT

Thank you;

	I actually got this to work doing exactly what you mentioned. I went
from masquerading to dnat & snat and it worked. 

	My problem now is that when I have 2 clients connected via the same
VPN I can only get the DISPLAY back to an individual client (which ever one
is the source IP in the SNAT statement). Putting a range of I.P.'s (i.e.
--to-source 192.168.10.50-192.168.10.70) doesn't give me any display back.

	I'm assuming I'm not connection or stream tracking.

Jeff Hammond
Customer Suppport
972 461 4152

-----Original Message-----
From: Sietse van Zanen [mailto:sietse@wizdom.nu]
Sent: Thursday, May 12, 2005 2:12 AM
To: Hammond, Jeffrey
Subject: RE: Passing X11 through IPTABLES NAT

 Hi,

This is most likely due to the fact, that the X11 connection is opened in
the other direction. You will need to do some SNAT back to your clients.

It goes like this:
Client telnets ---> Server
Server X11 ---> Client. (In fact your clients runs the X11 server, and the
server the X11 client).

Greets.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Hammond, Jeffrey
Sent: 10 May 2005 14:20
To: netfilter@lists.netfilter.org
Subject: Passing X11 through IPTABLES NAT

All;

            I'm using IPTABLES to NAT various client LINUX boxes through a
VPN server. I'm able to connect through the server, NAT the client and out
the VPN connection successfully. Telnet is successful. However when I try to
export the X display back to my client I receive 'Can't open Display <I.P.>'
where the I.P. is that of the NAT'd client from the host, and see and
'invalid data' packet while sniffing on the client.
I've tried DNATting X11 port 6000 packets back to the original I.P. with no
success.

 

            Any help would be appreciated.

 

Jeff Hammond

 






