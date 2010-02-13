From: Bojan Sukalo <shukalo83@gmail.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 13:22:54 +0100
Message-ID: <368e93c51002130422la851213ud93649e9ccc5519c@mail.gmail.com>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
	 <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OgoVsFKKGx6wOXxKNeyf85FBnfCYrnVJuYHVSXs6OSA=;
        b=kUm2c+sjPE3C0rVci4thGmjA5Sl11wSdnmCME3iNDqztwbk6BT9vdgKPTquHqvTtvY
         sxCJmRSD9g9jfiDHhANJTt0YH4E0o4dHfKPT2B9AH1y5QE7HvRBCH/H+X/BzD+Al2cnq
         dlD00HH5ONRBc2qYyufRQIqu2sXxokOODurYM=
In-Reply-To: <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Oskar Berggren <oskar.berggren@gmail.com>, guido@trentalancia.com
Cc: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>, netfilter@vger.kernel.org

2010/2/13 Oskar Berggren <oskar.berggren@gmail.com>:
> 2010/2/13 =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <caspe=
r@meteor.dp.ua>:
>> =F7 =F3=D5=C2, 13/02/2010 =D7 00:18 +0100, Guido Trentalancia =D0=C9=
=DB=C5=D4:
>>> On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
>>> > Telnet from inside machine to www.google.com 80 works but I can't=
 get
>>> > any messages after I get connected (Just successfull telnet
>>> > connection)
>>>
>>> You can't telnet www.google.com on port 80, as google is not a teln=
et
>>> server and therefore it can't deal with the telnet protocol. Google
>>> deals with the http protocol.
>>
>> Why one can't use telnet program to test http server?
>>
>
>
> Sure you can. Of course you need to type in a valid HTTP request to
> get a response. This worked for me just now:
>
> ~$ telnet www.google.com 80
> Trying 74.125.79.104...
> Connected to www.l.google.com.
> Escape character is '^]'.
>
> Then I typed this, followed by enter twice:
> GET http://www.google.se/ HTTP/1.1
>
> And I got this reply from the server:
> HTTP/1.1 200 OK
> Date: Sat, 13 Feb 2010 09:51:26 GMT
> Expires: -1
> Cache-Control: private, max-age=3D0
> Content-Type: text/h_t_m_l; charset=3DISO-8859-1
> [... plus lots more, shortened...]
>
>
> By the way, I had to mangle the content type above to fool the vger
> spam filter, which seems to think that my message contains HTML
> because of the line, even though any reasonable MIME parser should
> realize that line is part of a text/plain content, and not a header
> for a new section.
>
> /Oskar
>

OK, just not to go off topic here (telnet can be used to comunicate
with lots of stuff)

Here are my iptables rules with comments.

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT
iptables -F -t nat

##from internal to outside world
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

##from vpn clients to inisde
iptables -A FORWARD -i tap0 -o eth1 -j ACCEPT


##established sessions from outside to inside
iptables -A FORWARD -i eth0 -o eth1 -m state --state
ESTABLISHED,RELATED -j ACCEPT
## established session from inside to vpn clients
iptables -A FORWARD -i eth1 -o tap0 -m state --state
ESTABLISHED,RELATED -j ACCEPT

##Allow inputs from the internal network and local interfaces
iptables -A INPUT -i eth1 -s 192.168.60.0/24 -d 0/0 -j ACCEPT
iptables -A INPUT -i tap0 -s 192.168.168.0/24 -d 0/0 -j ACCEPT
iptables -A INPUT -i lo -s 0/0 -d 0/0 -j ACCEPT

## NAT to public source ip (also tried -j MASQUARADE here but that
also didn't help)
iptables -A POSTROUTING -t nat -s 192.168.60.0/24 -o eth0 -j SNAT
--to-source my_public_ip

##prevent some spoofing from outside
iptables -A INPUT -i eth0 -s 192.168.60.0/24 -j DROP
iptables -A INPUT -i eth0 -s 127.0.0.0/8 -j DROP

##add some access rules for ssh and openvpn
iptables -A INPUT -i eth0 -p tcp -s ssh_allowed_public_ip
--destination-port 22 -j ACCEPT
iptables -A INPUT -i eth0 -p udp -s 0/0 --destination-port 1194 -j ACCE=
PT

##giving trust to my public dns, just in case
iptables -A INPUT -p udp -s my_public_dns --source-port 53 -d 0/0 -j AC=
CEPT

##trying hard nat to work by clamping mss to mtu
iptables -t mangle -A FORWARD -i eth1 -o eth0 -p tcp --tcp-flags
SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
