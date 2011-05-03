From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Tue, 3 May 2011 12:23:41 -0500
Message-ID: <BANLkTi=xSZ_X8brBbPrn6xbxEEwFSj6duQ@mail.gmail.com>
References: <4DB817A5.3020604@atc.tcs.com>
	<BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
	<4DB90AE6.9070909@atc.tcs.com>
	<BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
	<1304150575.1579.15.camel@andybev>
	<20110430165041.GN2976@cardinal>
	<BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
	<20110430190257.572819zc1kr5bkr5@www.simplelists.com>
	<BANLkTikQVte5hCN5cFua43R6h8iqaPni3w@mail.gmail.com>
	<1304190535.2488.13.camel@andybev>
	<20110430192411.GQ2976@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110430192411.GQ2976@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thanks guys.

Alright. You are correct. I am new to Linux. I have been blind for a
long time and am learning exponentially. Thanks for your help.

I was able to get the applications working this weekend. (so proud,yeah=
!)

However, I got my A$$ handed to me this morning with massive input
errors from the LAN side.

I am doing the following, can you provide me any assistance?
eth2=3DWAN
eth1=3DLAN

/etc/ufw/before.rules
# nat Table rules
*nat
: POSTROUTING ACCEPT [0:0]
# Forward traffic from eth2 through eth0.
-A POSTROUTING -s 172.20.0.0/16 -o eth2 -j MASQUERADE
-A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to- 8080
#iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
# don't delete the 'COMMIT' line or these nat table rules won't be proc=
essed
COMMIT


UFW logging:
Below is the copy of BLOCKed content, from this mornings headache.
XXX.XXX.XXX.XXX=3D eth2 , public IP address. I replaces to protect the =
innocent.

sudo vi UFWMay3BLOCK.log
May  3 09:16:36 squidGuard kernel: [64639.938264] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D209.85.225=
=2E83
DST=3Dxxx.xxx.xxxx LEN=3D1263 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D3942=
0 PROTO=3DTCP
SPT=3D443 DPT=3D1856 WINDOW=3D16260 RES=3D0x00 ACK PSH URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.105950] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6300=
6 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.107154] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6300=
7 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.108390] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6300=
8 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.109614] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6300=
9 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.110842] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
0 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.112078] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
1 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.113306] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
2 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.114539] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
3 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.115768] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
4 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.118231] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
5 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.119464] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
6 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.121923] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
7 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:16:45 squidGuard kernel: [64649.125610] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
8 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK PSH FIN URG=
P=3D0
May  3 09:16:46 squidGuard kernel: [64649.221610] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D74.125.95.=
97
DST=3Dxxx.xxx.xxxx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D10841 =
PROTO=3DTCP
SPT=3D443 DPT=3D1790 WINDOW=3D11219 RES=3D0x00 ACK FIN URGP=3D0
May  3 09:16:46 squidGuard kernel: [64649.929228] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D209.85.225=
=2E83
DST=3Dxxx.xxx.xxxx LEN=3D1263 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D3942=
1 PROTO=3DTCP
SPT=3D443 DPT=3D1856 WINDOW=3D16260 RES=3D0x00 ACK PSH URGP=3D0
May  3 09:16:55 squidGuard kernel: [64659.201813] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D74.125.95.=
97
DST=3Dxxx.xxx.xxxx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D10842 =
PROTO=3DTCP
SPT=3D443 DPT=3D1790 WINDOW=3D11219 RES=3D0x00 ACK FIN URGP=3D0
May  3 09:16:56 squidGuard kernel: [64659.934100] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D209.85.225=
=2E83
DST=3Dxxx.xxx.xxxx LEN=3D1263 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D3942=
2 PROTO=3DTCP
SPT=3D443 DPT=3D1856 WINDOW=3D16260 RES=3D0x00 ACK PSH URGP=3D0
May  3 09:16:58 squidGuard kernel: [64661.599044] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D199.34.228=
=2E106
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D6301=
9 DF
PROTO=3DTCP SPT=3D80 DPT=3D50808 WINDOW=3D60 RES=3D0x00 ACK URGP=3D0
May  3 09:17:05 squidGuard kernel: [64669.158398] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D74.125.95.=
97
DST=3Dxxx.xxx.xxxx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D10843 =
PROTO=3DTCP
SPT=3D443 DPT=3D1790 WINDOW=3D11219 RES=3D0x00 ACK FIN URGP=3D0
May  3 09:17:06 squidGuard kernel: [64669.978711] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D209.85.225=
=2E83
DST=3Dxxx.xxx.xxxx LEN=3D1263 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D3942=
3 PROTO=3DTCP
SPT=3D443 DPT=3D1856 WINDOW=3D16260 RES=3D0x00 ACK PSH URGP=3D0
May  3 09:17:07 squidGuard kernel: [64671.174946] [UFW BLOCK] IN=3Deth2
OUT=3D MAC=3D00:15:5d:04:81:10:00:50:73:f6:f4:a0:08:00 SRC=3D65.54.95.9=
3
DST=3Dxxx.xxx.xxxx LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D56 ID=3D1507=
5 DF
PROTO=3DTCP SPT=3D80 DPT=3D52652 WINDOW=3D6335 RES=3D0x00 ACK URGP=3D0

Thanks for your input

On Sat, Apr 30, 2011 at 2:24 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Sat, Apr 30, 2011 at 08:08:55PM +0100, Andrew Beverley wrote:
>> On Sat, 2011-04-30 at 13:23 -0500, Mike Hendrie wrote:
>> > Now to lock it down? I should just create rules to block ports?
>>
>> Well it depends how paranoid you are. You might just want to block
>> new incoming connections to the local network:
>>
>> iptables -P FORWARD DROP
>> iptables -A FORWARD -i $ext_IF -o $int_IF \
>> =A0 =A0 =A0 -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables -A FORWARD -i $int_IF -o $ext_IF -j ACCEPT
>>
>> You'd probably also want to drop all incoming connections to the
>> server apart from your web server:
>>
>> iptables -A INPUT -p tcp --dport 80 -i $ext_IF -j ACCEPT
>> iptables -A INPUT -i $ext_IF -j DROP
>>
>> As Rob says though, you're probably best going through a few basic
>> tutorials first - you'll be up to speed in no time. Also check out
>> iptables-save and iptables-restore.
>>
>> Let's hope I haven't made any more mistakes that Rob is going to
>> spot :)
>
> Hehe ... well ... I would suggest that you look at the enhanced
> feature set of -m conntrack --ctstate vs. -m state --state. That's
> not a mistake, though; that is preference. :)
