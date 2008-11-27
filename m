From: Zagato <zagato.gekko@gmail.com>
Subject: NAT for locahost to IP LAN for mail services
Date: Thu, 27 Nov 2008 17:46:13 -0500
Message-ID: <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=0qOLAuNpjB/rks2cLsl3wIjiKz92J71dO5AxfzY6ZEM=;
        b=fAjSOtDYHlHwlfmVHIFkZT5eB++lHpjJ4dedF2C0/ow9e/YMy1I1+z2IHACri3xXzy
         iq0Wsuy9iUZ/i9/UagBnm10Mks9m77KC8pOxsxoxRQKKjfnqkw2arYcIkfIVHxzWxyq3
         GWUXKiP/cUXpd7QhrbPLs2bEPS1I+3WVyf8/8=
In-Reply-To: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.... im trying to forward the conecction to mail services like smtp(
port 25) from one pc to another, im using:

_mail_services=25,110,143,995,993
_mailserver=192.168.0.3
iptables -t mangle -A ftolocal -p tcp -m multiport --destination-ports
$_mail_services -j MARK --set-mark 1
iptables -t nat -A ftolocal -p tcp -m multiport --destination-ports
$_mail_services -j DNAT --to-destination 192.168.0.3

where ftolocal its a chain name for mangle and nat...

the ip addres source it's 192.168.0.5 and i want to send localhost
connections to 192.168.0.3...
when i use the lines above i can:
telnet 192.168.0.5 25
and it works... giving me:
Trying 192.168.0.5...
Connected to beta.gps.com.co (192.168.0.5).
Escape character is '^]'.
220 alpha.gps.com.co ESMTP Postfix

But when i use:
telnet localhost 25 or telnet 127.0.0.1 25 tha must be equal i get..
Trying 127.0.0.1...
and statys there forever.....

without using the lines above i just get:
[root@beta beta]# telnet localhost 25
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused
telnet: Unable to connect to remote host: Connection refused
[root@beta beta]# telnet 192.168.0.5 25
Trying 192.168.0.5...
telnet: connect to address 192.168.0.5: Connection refused
telnet: Unable to connect to remote host: Connection refused

What i do wrong.... why i cannot use localhost to connect.... can
someone give me a hand....

Lot of Thanks..

Alan Jairo Acosta
