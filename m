From: "Brent Wilkinson" <brent@air2data.com>
Subject: RE: Wireless Login Page
Date: Wed, 9 May 2007 23:14:09 -0600
Message-ID: <000001c792c2$0b7adae0$227090a0$@com>
References: <1178307309.2896.63.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1178307309.2896.63.camel@ws1.walco02.com>
Content-Language: en-us
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
To: netfilter@lists.netfilter.org

Sorry just noticed this. From what it sounds like you are describing a
captive portal. I have setup a few systems that do this.

Basically how it works is you let them get a ip address from the dhcp
server. Once they have this ip address they then open up a website. What the
captive portal does is redirects the http packets to your server (your
firewall needs to also rewrite to header ip address they are requesting so
your web server likes it).

I would be happy to forward a working rc.firewall file with it already
presetup. The ones I have allow a person to visit certain pages like my web
page and the hotels webpage but don't allow them to visit anything else. 

Now if you want to get more complicated like charging them for a certain
amount of time and then after that time expires you need to use ap's that
support radius and use a radius server for timing or use what's called
NoCat.

Thanks
Brent
Air2Data.com

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Kirk Wallace
Sent: Friday, May 04, 2007 1:35 PM
To: netfilter@lists.netfilter.org
Subject: Re: Wireless Login Page

On Wed, 2007-05-02 at 19:18 +0200, Michelle Konzack wrote:
> Hello Kirk and *,
> 
> Am 2007-04-28 11:43:27, schrieb Kirk Wallace:
> > I was using 192.168.21.2 just to test whether httpd would respond to
any
> > IP address sent on the 192.168.21.0/24 address space. 
> > 
> > I envision that a person would boot their wireless laptop and scan
for
> > hotspots. They would see my hotspot and connect. Then my DHCP server
> > would give the laptop an IP address, subnet mask, gateway address,
DNS1
> > and DNS2. Then the user would start firefox and try to open a link
to
> > anywhere.com, but I have FORWARD denied to all but logged in users
> > (which have a tunnel IP address on another subnet). At this point, I
> > want the anywhere.com request to invoke the httpd on the wireless
router
> > to reply with a login page. Currently dhcpd, httpd, radiusd and
pptpd
> > are on the same PC.
> 
> This is exactly what I want to do to.
> 
> But if the $CLIENT has gotten its DHCP-IP-Addressm then ANY
> connections (any Ports except DNS and DHCP) nust be blocked
> until the user has once started a Webbrowser and authentificated.

If the above comment relates to restricting the wireless client's access
to providing only a login, I do that by setting the policy for INPUT and
OUTPUT to ACCEPT, then FORWARD to DROP. Then I add a rule to FORWARD to
allow forwarding of the tunnel traffic. Users cannot get to the Internet
with out first logging in and being assigned a tunnel IP address. The
wireless clients have access to all the open ports running locally on
the wireless router.

> I was thinking, that if the $USER open a connection plus auth,
> the connection will be droped for example 5 minutes after the
> last traffic going over the Interface with the specified MAC/IP.

Currently, I allow my clients a full time connection. In fact I have set
them all up with an OpenWRT router with pptpd and a five minute ping
from cron to keep the connection alive. I use the ifconfig data to
record the tunnel traffic (ppp0, ppp1, ...) then cross reference this
with the Radius data in order to bill based on a user's data volume.

> I have not found any examples ho to do this.
> 
> Would you like to share your config?
> 
> And speciay how you have setup your "fist-connect" page to auth?

Well, that's my problem, I don't have an authorization page yet.
Currently, I have to pre-configure a client's router or PC to log in
using pptp. I would like to have a client cruise for hotspots and if
they find mine, then be able to connect themselves.

My first goal is to just figure out how to get an opening page on a
person's screen, after they have found my hotspot. After selecting my
ssid, I am assuming that the client would have their PC setup to get the
connection settings from DHCP. Then I am assuming that they would
recognize that they have a valid connection and try to browse the
Internet. A this point, I want the wireless router to detect the http
request and reply to that request with my opening page instead. The more
I am learning about this, the more I think that iptables is just part of
the solution, but I don't know yet know enough to realize what I need to
know.

Below is my iptables related configuration so far.
~~~~~~~~~~
root@ls:~# cat /etc/rc.d/rc.local
#!/bin/sh
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local setup commands in here:

# Fix iwconfig mode problem called from rc.wireless 20060927 KW
/usr/bin/wlanconfig ath0 destroy
/usr/bin/wlanconfig ath0 create wlandev wifi0 wlanmode Master

# rc.wireless seems to have a problem with essid and channel too
20060927 KW
/sbin/iwconfig ath0 essid walco04 channel 10

# Todo - make these autoload as normal rc files do
/etc/rc.d/rc.wlvpn_iptab
/etc/rc.d/rc.pptpd
/etc/rc.d/rc.radiusd
/etc/rc.d/rc.dhcpd

~~~~~~~~~~~~~~~

root@ls:~# cat /etc/rc.d/rc.wlvpn_iptab
#!/bin/sh
#
# wlvpn_iptab.sh - 20060926 KW
# Set IP tables to foward only wireless VPN traffic

wlvpn_iptab_start() {
/usr/sbin/iptables -F
/usr/sbin/iptables -t nat -F

/usr/sbin/iptables -P INPUT ACCEPT
/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/iptables -P FORWARD DROP

/usr/sbin/iptables -A INPUT -s 0/0 -d 0/0 -j ACCEPT
/usr/sbin/iptables -A OUTPUT -s 0/0 -d 0/0 -j ACCEPT

/usr/sbin/iptables --table nat --append POSTROUTING \
      --out-interface eth0 --jump SNAT --to-source 192.168.12.7
/usr/sbin/iptables -A FORWARD -s 192.168.123.0/24 -d 0/0 -j ACCEPT
/usr/sbin/iptables -A FORWARD -s 0/0 -d 192.168.123.0/24 -j ACCEPT
}

# Stop VPN forwarding:
wlvpn_iptab_stop() {
/usr/sbin/iptables -F
/usr/sbin/iptables -t nat -F

/usr/sbin/iptables -P INPUT ACCEPT
/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/iptables -P FORWARD ACCEPT

/usr/sbin/iptables -A INPUT -s 0/0 -d 0/0 -j ACCEPT
/usr/sbin/iptables -A OUTPUT -s 0/0 -d 0/0 -j ACCEPT
/usr/sbin/iptables -A FORWARD -s 0/0 -d 0/0 -j ACCEPT

}

# Restart IP packet forwarding:
wlvpn_iptab_restart() {
  wlvpn_iptab_stop
  sleep 1
  wlvpn_iptab_start
}

case "$1" in
'start')
  wlvpn_iptab_start
  ;;
'stop')
  wlvpn_iptab_stop
  ;;
'restart')
  wlvpn_iptab_restart
  ;;
*)
 # Default is "start", for backwards compatibility with previous
 # Slackware versions. This may change to a 'usage' error someday.
 wlvpn_iptab_start
esac

> Greetings
>     Michelle Konzack
>     Systemadministrator
>     Tamay Dogan Network
>     Debian GNU/Linux Consultant
> 
> 





