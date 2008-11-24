From: "Jesse Thompson" <jesset@gmail.com>
Subject: iptables and SOCKS4
Date: Mon, 24 Nov 2008 06:54:13 -0800
Message-ID: <af62343b0811240654s4ad3c7eo98a961665ae258c2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=nlBxIGpHg2/Mzezfoj4jWWLJcZG3HmAMmoJLKkaSl/M=;
        b=RzS4Uiduvap75/YxCzD2aiumwWcvqlamsTxnprsEc3Xa0zgSEbFzqcAw46zf82t0/H
         m4LuBhAlgTxjX2DRd4h1zh0zFY+x2DKyIz1wrhw7XFQmaScWlol1/Kbt49l/25jMifKG
         hPzyYE3579dI94R0/jG1DixBhb3jJ/YIvJ0RY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello netfilter citizens. :)

I would like to be able to tunnel all traffic on a client machine
through a SOCKS proxy.

My scenario is thus:
I have a laptop. I need to be able to use a particular software suite
for my business. This software only uses well behaved TCP connections
and DNS requests via UDP, so no netbios or wierdness there.

The problem is this software tends to pass tons of sensitive data in
cleartext on the network. Client data, business communications, it's a
real pain. I need to be able to use my laptop from home, ideally at
wireless hotspots, etc and would not like that data to be snoopable
by: our ISP, malicious hotspot users, etc.

I am able to run the software in Ubuntu via WINE. Our techs are
working out a stupidly complex and expensive VPN systen, but I believe
I can just configure an IPtables firewall to route all the laptop
traffic through an SSH Socks4 tunnel whose other endpoint is at the
office. This would be tons simpler and require no expensive hardware.
It would also allow our software, or virtually any sloppy app to be
protected by the socks/ssh tunnel with no extra hassle.

My plan is working smoothly with one hitch: I can't figure out how to
coax iptables into funneling traffic into the SOCKS server.

My process is as follows:

# connect to office, prep socks4 port at localhost 1234 and dns tcp
tunnel from laptop localhost 5353 to office localhost 5353
localuser@laptop$ ssh -D1234 -L5353:localhost:5353
officeuser@office.ssh.ip.address

# at far end, pipe all traffic from the ssh 5353 tunnel to the local
DNS resolver
officeuser@office$ socat tcp4-listen:5353,fork upd4:office.dns.server.ip:53 &

# at near end, pipe DNS requests directed to udp4:localhost:53 into
the tcp4:localhost:5353 tunnel we've prepared
localroot@laptop# socat udp4-listen:53,fork tcp4:localhost:5353 &


This part works to tunnel the DNS requests. I test "nslookup abc.com
localhost" and the requests traverse the tunnel and succeed.
Luckily we have no sensitive client data traversing DNS, but I don't
want my DNS hijacked at a hotspot and I do like being complete. :)

However, It's the tcp part that I am having trouble with. I am able to
redirect connections to the 1234 port with the following script,
however such connections are not socks aware which is useless to us.
To compensate, I have researched socksifying solutions such as:
* transocks: appears unmaintained now, source only available via
defunct sourceforge cvs
* transocks_ev: http://oss.tiggerswelt.net/transocks_ev/ , though the
iptables examples there don't seem to make much sense to me .. and I
couldn't get it to install properly.
* tor: has some kind of built in TransPort feature now which does the
magic I want of bridging iptables to their brand of SOCKS proxy; but I
want to go across an SSH proxy and not use the Tor network.. which
would be incredibly slow and the end points would not be under our
control. I want to protect the content of our data, anonymizing our IP
addresses would be pointless. So no tor, please.
* Sockscap, proxycap, socksify, etc etc: Applications that try to
hijack the network library calls to redirect through socks seem to
either cause problems with our software, or fail to socksify important
traffic. Our software doesn't seem sensitive to delays or jitter, but
it spawns unpredictable processes and makes outbound connections to
unpredictable ports.

So my iptables script presently resembles this:

#!/bin/sh

# destinations to not firewall
# when at home, my lan is 192.168.157.0/24
# office.ssh.ip.address is not used by target software, just my ssh tunnel.
NO_FW="192.168.157.0/24 office.ssh.ip.address"

# This should be my SSH port if iptables can socksify packets
directly, or the port of a socksifier if I end up using that
TCP4_SOCKS4_PORT=1234

# flush tables for a clean start
iptables -F
iptables -t nat -F

# exempt localhost traffic and our whitelisted networks
iptables -t nat -o lo -j RETURN
for NET in $NO_FW 127.0.0.0/8; do
  iptables -t nat -A OUTPUT -d $NET -j RETURN
done

# funnel all DNS requests, regardless of destination IP, into the
local udp end of our working DNS tunnel.
iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53

# um.. socksify all the tcp traffix? Anyone? Bueller? :D
iptables -t nat -A OUTPUT -p tcp ???? profit?

# I copied these rules from somewhere, I think this bit helps the
exempt above work.. I don't know if I'm clear about how packets get
into the "nat" table to start with, you see. :(
iptables -o lo -j ACCEPT
for NET in $NO_FW 127.0.0.0/8; do
  iptables -A OUTPUT -d $NET -j ACCEPT
done

# yeah, whatever traffic we can't push through the SSH tunnel (udp non
port 53, non udp/tcp, etc) we torch. :)
iptables -A OUTPUT -j REJECT


So what say ye, the netfilter community? You know more about making
packets go interesting places than anyone, and I feel pretty certain
this project can most easily be solved using iptables.. I don't know
if iptables can just feed packets into a SOCKS port however or if it
needs a socksifier to help, and if so I don't know what's a good
socksifying app.

I heard someone talking about using OpenVPN at some point, but I'm not
sure how one would proceed with that to solve this kind of problem.
Also, working with hardware VPN's has demonstrated to me that a VPN
connection will die if you ever lose a single packet, while SSH
tunnels appear much more resiliant to sketchy carrier networks.

Any suggestions? Thanks! :D

- - Jesse
