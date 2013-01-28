From: Roman Gelfand <rgelfand2@gmail.com>
Subject: SSL Handshaking Failure
Date: Mon, 28 Jan 2013 13:09:50 -0500
Message-ID: <CAJbW+rkmqvvQD7KbohPMSxLfEAataQyiqU4vUZYf5c3Xbche9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=W3aWO5TiWB3sbdIdbtfcmg7HTtM2DU4XgmF4iqrgJiE=;
        b=c2MAMhCqX6KB1pHUqF6g3crEcTP/fE5o4XS70wRpcewcaZYrbq+IanbNLsjTkrEFJ0
         syGR1YK/CN1xL3RKQqwnUd4+OxDa25zNYH66y7gA57eGaNahYKeF7jFDR8mxiWBs1ZIt
         bFqh37X9IYhgkdiKEMXr7rsBkrb1glYqtGPmnIYDmMNogCLCv2dFwq55NV8uFKiitHi9
         e6VC9M6IxzRJ8Lg6PowBib07JULWj+/0n0ItJhRLs+qAr8uU/EXHpIgOPy5ST7u1q94U
         gsrlf+HpHd/Rzi3n5cdmLWfoC1heO7D3x1toqrQg9ETdHaXkQ9gaHu9ulZB74b7MqjZ7
         7MGg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have configured iptables on a squid proxy server machine for the
purpose of forwarding http/s requests transparently.  This machine is
located behind fortigate firewall and sits on it's own vlan.  Clients,
sitting on different vlan, requests  1) hit fortigate 2) fortigate
redirects them to squid server via gre tunnel/wccp.  I created the
entries below in rc.local to reroute ports to the onces listened by
squid .  http works great.  However, https is failing with ssl
handshake where 2 client hello's get  get client hello out of order
message.  There is only one lan ip is associated with only one
interface.  The same interface is used for gre tunnel and to go out.
Using the same clients and squid server in an non-transparent proxy,
both http and https works.  I was wondering if you could help me out
with this.

BTW... the os is debian lenny.

modprobe ip_gre
ip tunnel add wccp0 mode gre remote 192.168.5.3 local 192.168.5.21 dev
eth0 # 192.168.5.3 is firewall internal gateway.  The lan ip address
is DNATed firewall to default wan ip address.
ip addr add 192.168.5.21/32 dev wccp0
ip link set wccp0 up

# Route to send the content back to the GRE tunnel
route add -net wan_ip netmask 255.255.255.255 dev wccp0  # where
wan_ip, different from the above wan ip address, translates SNAT to
the squid server which is this machine.

# Disabling reverse path filtering and enable routing in the kernel
echo 0 > /proc/sys/net/ipv4/conf/wccp0/rp_filter
echo 1 > /proc/sys/net/ipv4/ip_forward

# Setup the redirection of traffic from the GRE tunnel to squid port 3128
iptables -t nat -F

iptables -t nat -A PREROUTING -i wccp0 -m tcp -p tcp --dport 80 -j
REDIRECT --to-ports 3228
iptables -t nat -A PREROUTING -i wccp0 -m tcp -p tcp --dport 443 -j
REDIRECT --to-ports 3229
