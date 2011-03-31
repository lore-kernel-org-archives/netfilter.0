From: ahnkle <ahnkle+netfilter@gmail.com>
Subject: selective routing of port 80
Date: Thu, 31 Mar 2011 17:50:55 +0100
Message-ID: <AANLkTi=fVGwx-XeQg0DJofvehGG3RkneRnwg2J1Tmy3_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
         :message-id:subject:from:to:content-type;
        bh=9+JwhGcFVB8L7l+UYd8mq7Yi0zzRVNltyz7ZiMv1Mck=;
        b=aXfjQNa0WA/Hila06aVhUQJY6wn1n37XFTvtqxC+M9iw2euiARTOjBd8IOhH9/I142
         YWS2hoxnHX11uf5SVrvulES6Q1yQ7AYXNvnW1JWxYKFfqa31dCiJTyADkYI08FWSF0UC
         A5uiIJPVS3TY31HqlR6bg3kx5bdZ6VnECqFpc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have a temporary webserver I want to access from the internet.

internet========router======gateway
                                   |
                                   =====webserver

Above is my setup. I want to check that what I am doing is suitable,
and to check for pitfalls.

Gateway is default gateway for all devices on local network: it
provides dns & dhcp.

Port 80 is forwarded by the router to webserver. I marked returning
packets, and route just packets returning from port 80 to the router.

I have used

      iptables -A OUTPUT -t mangle -i eth0 -p tcp -s <local network> -j ACCEPT
      iptables -A OUTPUT -t mangle -i eth0 -p tcp --sport 80 -j MARK
--set-mark 0x1

to mark returning http packets.

Then using iproute2:

      echo "1 HTTP" >> /etc/iproute2/rt_tables
      echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
      echo 1 > /proc/sys/net/ipv4/conf/eth0/rp_filter

      ip route add default via <router ip> dev eth0 table HTTP
      ip rule add from all fwmark 0x1 table HTTP

Is this a good solution, or is this flawed?

Regards,
ahnkle
