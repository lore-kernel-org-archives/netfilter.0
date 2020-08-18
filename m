From: Nirgal =?ISO-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into nftables
Date: Tue, 18 Aug 2020 13:08:43 +0200
Message-ID: <32610365.DCq6cjG4UW@deimos>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com> <CAKcfE+anbh1OoHt7vgyYRt89J-fjsKK48Fzy8SCm3RP=HQQcOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart21026257.Zcmz9MDH7y"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKcfE+anbh1OoHt7vgyYRt89J-fjsKK48Fzy8SCm3RP=HQQcOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: pablo@netfilter.org, Balazs Scheidler <bazsi77@gmail.com>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart21026257.Zcmz9MDH7y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 18 August 2020 11:18:50 CEST Balazs Scheidler wrote:
>> Does any one know the proper equivalent to
>>     iptables -t mangle -A PREROUTING -m socket --transparent -j MARK --set-mark 1
>> using nft?
>
> The original iptables "socket" match had an extra check so that it wouldn't
> match listener sockets, at least by default (that is if --nowildcard is not
> specified).
> 
> I don't see however how "outbound masqueraded connection" could be
> impacted. The "socket transparent 1" expression should require that the
> socket being matched has IP_TRANSPARENT setsockopt set. Are those
> connections also initiated by haproxy?
> 
> In any case, I think the check to ignore wildcard bound listener sockets is
> definitely missing, however I am not sure how to properly add it to
> nftables. If I added it to the socket match implementation that might break
> a few currently well behaving use-cases. @pablo@netfilter.org
> <pablo@netfilter.org> can you please advise? This is the check that is in
> iptables -m socket:
> 
>                 wildcard = (!(info->flags & XT_SOCKET_NOWILDCARD) &&
>                             sk_fullsock(sk) &&
>                             inet_sk(sk)->inet_rcv_saddr == 0);
> 
> And then if --transparent is used, these sockets are not accepted / the
> rule does not match.

That's it I guess:

I tried adding --nowildcard to my working iptables rules and I got the same error, https connections from the lan side are not masqueraded toward the wan, but routed locally to the socket listening to *:443.
(thanks tcptraceroute for the info)

So basically
    nft > socket transparent 1 meta mark set 1
may be the equivalent of
    iptables > -m socket --transparent --nowildcard -j MARK --set-mark 1
while I'm looking for *not* having "--nowildcard".

Any idea about how work around this? I was thinking of using the "fib" rules to match the wan side packets since they have a destination ip address that match one of the local address, while the wan bound packets don't.


Regarding your question about IP_TRANSPARENT setsockopt, I don't quite know how to look at that easily. Attached is a fragment from my haproxy.cfg file, the key points being "source 0.0.0.0 usesrc clientip" and "bind :443 strict-sni transparent".
--nextPart21026257.Zcmz9MDH7y
Content-Disposition: inline; filename="haproxy.cfg"
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

frontend https4-in
        bind :443 strict-sni transparent
        mode tcp
        tcp-request inspect-delay 5s
        tcp-request content accept if { req_ssl_hello_type 1 }
        default_backend https4-www2.in.nirgal.com

backend https4-www2.in.nirgal.com
	server https4-www2.in.nirgal.com ipv4@192.168.1.99:443


--nextPart21026257.Zcmz9MDH7y--



