From: "Larry Flathmann" <larryf@sdintegrators.com>
Subject: W2000 Domain Controller & IIS in DMZ
Date: Wed, 9 Oct 2002 16:14:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEOLBJEBJGNEOCBICHDCEADCCAA.larryf@sdintegrators.com>
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
To: Netfilter Mailing List <netfilter@lists.samba.org>

I would very much appreciate any ideas and suggestions in solving this
problem that has come up with our firewall.

We have an internet connection with multiple real IP's, and a network in
different segments. The firewall does NAT for most PC's, and
forwarding/routing (using proxy_arp) to a few servers.

The problem we're having is in how to set up a Windows 2000 server which is
both the domain controller for one segment of the network, but is also
running IIS to serve pages to both the internet and the local network.

Here is our setup:
The Windows 2000 server has a primary ip of 192.168.0.x, which is on the
local network.
The w2000 server also has additional ip's in a different range (we've tried
several - 192.168.80.x, 172.16.80.x, etc.) for the web sites that it's
serving.
The firewall forwards http requests from an external address to the
192.168.80.x ip of the appropriate website.

It works great for the outside world - anyone on the internet has no
problem.

But, when someone on the local network (ip=192.168.0.y) tries to browse to a
page on the local server, the packets for their request get forwarded to the
IIS server, but nothing comes back. By testing i verified that the Win2K
server was sending the response packets back using its primary address
(192.168.0.x) because it saw that the request was coming from 192.168.0.y.
So the packets never went back through the firewall and as a result the web
browser that requested the web page didn't know how to interpret the
response, because it requested a page at external address a.b.c.d, and got a
response back from 192.168.0.x.

Now, if i move the Win2k server physically onto a different network, then
the IIS server works fine for everybody, inside and out of our network. BUT,
PC's on the network cannot connect to the domain controller. i've tried
forwarding  all packets back and forth between the win2k server and the LAN,
but it still doesn't work.

BTW, when i separated the LAN and the win2k server onto different physical
networks, they were still on teh same interface of the firewall, but
separated using different VLAN's on a switch.

Any ideas?
Can i somehow force the IIS server to send packets back to the LAN through
the firewall, rather than directly through its 192.168.0.x interface?
Or, is there some trick to forwarding packets so that the PC's on the LAN
can connect to the domain controller even when the DC is on a separate VLAN
(i.e., the only connection between them is through the firewall).
Is there some way to do SNAT on the http requests from the local LAN so that
IIS will think they're coming from the internet, and then to map the
responses back correctly?

I can't wait to find out!
Thank you very much in advance!

Larry Flathmann
Systems & Data Integrators



