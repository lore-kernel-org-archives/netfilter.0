From: Nirgal =?ISO-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into nftables
Date: Sat, 22 Aug 2020 03:24:43 +0200
Message-ID: <13661805.z8pgfqvs6W@deimos>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com> <20200821152333.GA22135@salvia> <1667802.tW6joTg63a@deimos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2816662.dMPzKlu11J"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1667802.tW6joTg63a@deimos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Balazs Scheidler <bazsi77@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart2816662.dMPzKlu11J
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I applied the patches to my kernel and to nftables.

>>> table inet haproxy {
>>>   chain prerouting {
>>>      type filter hook prerouting priority -150; policy accept;
>>>      socket transparent 1 socket wildcard 0 mark set 0x00000001

This works like a charm for ipv4. :)

But ipv6 outbound connections still are grabbed by the socket rather than be routed to the wan and masqueraded.
This works with 
> ip46tables -m socket --transparent -j MARK --set-mark 1

Attached is a more complete extract from my haproxy.cfg, with both v4 and v6.
--nextPart2816662.dMPzKlu11J
Content-Disposition: attachment; filename="haproxy.cfg"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="haproxy.cfg"

############################################################################
# DO NOT EDIT THAT FILE
# Notice: That file was generated using:
#    /root/bin/update-virtualhosts /etc/haproxy/virtualhosts.haproxy
# See /etc/haproxy/virtualhosts.haproxy/config
############################################################################
global
	log /dev/log	local0
	log /dev/log	local1 notice
	chroot /var/lib/haproxy
	stats socket /run/haproxy/admin.sock mode 660 level admin
	stats timeout 30s
	# user haproxy  # transparent proxying requires root privileges
	group haproxy
	daemon

	# Default SSL material locations
	ca-base /etc/ssl/certs
	crt-base /etc/ssl/private

	# Default ciphers to use on SSL-enabled listening sockets.
	# For more information, see ciphers(1SSL). This list is from:
	#  https://hynek.me/articles/hardening-your-web-servers-ssl-ciphers/
	# An alternative list with additional directives can be obtained from
	#  https://mozilla.github.io/server-side-tls/ssl-config-generator/?server=haproxy
	ssl-default-bind-ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:RSA+AESGCM:RSA+AES:!aNULL:!MD5:!DSS
	ssl-default-bind-options no-sslv3

defaults
	source 0.0.0.0 usesrc clientip
	log	global
	#mode	http
	#option	httplog
	option	dontlognull
        timeout connect 5000
        timeout client  50000
        timeout server  50000
	errorfile 400 /etc/haproxy/errors/400.http
	errorfile 403 /etc/haproxy/errors/403.http
	errorfile 408 /etc/haproxy/errors/408.http
	errorfile 500 /etc/haproxy/errors/500.http
	errorfile 502 /etc/haproxy/errors/502.http
	errorfile 503 /etc/haproxy/errors/503.http
	errorfile 504 /etc/haproxy/errors/504.http

frontend http4-in
        bind :80 transparent
        mode http
        option  httplog
        default_backend http4-www2.in.nirgal.com
        use_backend http4-vcs.in.nirgal.com if { hdr(host) -i vcs.nirgal.com }
        use_backend http4-vcs.in.nirgal.com if { hdr(host) -i svn.nirgal.com }
        use_backend http4-vcs.in.nirgal.com if { hdr(host) -i git.nirgal.com }

frontend https4-in
        bind :443 strict-sni transparent
        mode tcp
        tcp-request inspect-delay 5s
        tcp-request content accept if { req_ssl_hello_type 1 }
        default_backend https4-www2.in.nirgal.com
        use_backend https4-vcs.in.nirgal.com if { req_ssl_sni -i vcs.nirgal.com }
        use_backend https4-vcs.in.nirgal.com if { req_ssl_sni -i svn.nirgal.com }
        use_backend https4-vcs.in.nirgal.com if { req_ssl_sni -i git.nirgal.com }

backend http4-www2.in.nirgal.com
        mode http
        server http4-www2.in.nirgal.com ipv4@192.168.1.99:80

backend http4-vcs.in.nirgal.com
        mode http
        server http4-vcs.in.nirgal.com ipv4@192.168.1.98:80

backend https4-www2.in.nirgal.com
	server https4-www2.in.nirgal.com ipv4@192.168.1.99:443

backend https4-vcs.in.nirgal.com
        server https4-vcs.in.nirgal.com ipv4@192.168.1.98:443

frontend http6-in
        bind :::80 v6only transparent
        mode http
        option  httplog
        default_backend http6-www2.in.nirgal.com
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i vcs.nirgal.com }
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i svn.nirgal.com }
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i git.nirgal.com }

frontend https6-in
        bind :::443 v6only strict-sni transparent
        mode tcp
        tcp-request inspect-delay 5s
        tcp-request content accept if { req_ssl_hello_type 1 }
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i vcs.nirgal.com }
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i svn.nirgal.com }
        use_backend http6-vcs.in.nirgal.com if { hdr(host) -i git.nirgal.com }

backend http6-www2.in.nirgal.com
        mode http
        server http6-www2.in.nirgal.com ipv6@[fd77:7777:7777::99]:80

backend http6-vcs.in.nirgal.com
        mode http
        server http6-vcs.in.nirgal.com ipv6@[fd77:7777:7777::98]:80

backend https6-www2.in.nirgal.com
        server https6-www2.in.nirgal.com ipv6@[fd77:7777:7777::99]:443

backend https6-vcs.in.nirgal.com
        server https6-vcs.in.nirgal.com ipv6@[fd77:7777:7777::98]:443



--nextPart2816662.dMPzKlu11J--



