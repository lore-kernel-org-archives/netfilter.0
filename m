From: matthias <mensch0815@googlemail.com>
Subject: ftp and nat
Date: Wed, 27 May 2009 13:48:05 +0200
Message-ID: <3e4778d50905270448o4a10936bi37acf8eea86be692@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=J/xHutGT+1H+/708w8YdaLOdRrfQk7bchdh2yrxF3RE=;
        b=HjynWeNCib4D7+2uveq7zmYak7Nc6M6/cGaGpDjbeQl/k+3IQ1Gsf9nVUbJmooBQ/F
         DhwybYhd48k7loPQ/Fihqf/WcrfCz6PwAGdGD6VGqjfa7Yk4u3v1OoRjgzQ9qYoy+5AT
         t8oaBbtdhv0YxoyCW/KWOCCPFe52L4XX4R9tk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

i have a network like this:
client <-> router <-> server

the router is linked via eth0 to the client-network and via tun0 to the server.
when i try to log from the client into the server via ftp I get a
delay of about 30 seconds.
does anyone tell me why, is it, that iptables doesn't support active ftp?

here are tcpdump extracts taken by the router:

root@router# tcpdump -i eth0
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
15:57:01.949614 IP client.43278 > router.ftp: S
2612647763:2612647763(0) win 5840 <mss 1460,sackOK,timestamp 538163918
0,nop,wscale 2>
15:57:01.951314 IP router.ftp > client.43278: S
3833629446:3833629446(0) ack 2612647764 win 5792 <sackOK,timestamp
109271440 538163918,mss 1460,nop,wscale 2>
15:57:01.951615 IP client.43278 > router.ftp: . ack 1 win 1460
<nop,nop,timestamp 538163921 109271440>
15:57:32.417873 IP router.ftp > client.43278: P 1:99(98) ack 1 win
1448 <nop,nop,timestamp 109279056 538163921>
15:57:32.418179 IP client.43278 > router.ftp: . ack 99 win 1460
<nop,nop,timestamp 538194387 109279056>
15:57:32.418181 IP client.43278 > router.ftp: P 1:14(13) ack 99 win
1460 <nop,nop,timestamp 538194387 109279056>
15:57:32.421947 IP router.ftp > client.43278: . ack 14 win 1448
<nop,nop,timestamp 109279057 538194387>
15:57:32.445852 IP router.ftp > client.43278: P 99:127(28) ack 14 win
1448 <nop,nop,timestamp 109279063 538194387>
15:57:32.446238 IP client.43278 > router.ftp: P 14:32(18) ack 127 win
1460 <nop,nop,timestamp 538194415 109279063>
15:57:32.461960 IP router.ftp > client.43278: P 127:155(28) ack 32 win
1448 <nop,nop,timestamp 109279068 538194415>
15:57:32.502703 IP client.43278 > router.ftp: . ack 155 win 1460
<nop,nop,timestamp 538194471 109279068>

root@router:~# tcpdump -i tun0
listening on tun0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
15:57:01.948253 IP client.43278 > server.ftp: S
2612647763:2612647763(0) win 5840 <mss 1460,sackOK,timestamp 538163918
0,nop,wscale 2>
15:57:01.951289 IP server.ftp > client.43278: S
3833629446:3833629446(0) ack 2612647764 win 5792 <sackOK,timestamp
109271440 538163918,mss 1460,nop,wscale 2>
15:57:01.951626 IP client.43278 > server.ftp: . ack 1 win 1460
<nop,nop,timestamp 538163921 109271440>
15:57:01.963271 IP server.36897 > client.auth: S
3840123331:3840123331(0) win 5840 <sackOK,timestamp 109271443 0,mss
1460,nop,wscale 2>
15:57:04.959422 IP server.36897 > client.auth: S
3840123331:3840123331(0) win 5840 <sackOK,timestamp 109272193 0,mss
1460,nop,wscale 2>
15:57:10.959785 IP server.36897 > client.auth: S
3840123331:3840123331(0) win 5840 <sackOK,timestamp 109273693 0,mss
1460,nop,wscale 2>
15:57:22.964568 IP server.36897 > client.auth: S
3840123331:3840123331(0) win 5840 <sackOK,timestamp 109276693 0,mss
1460,nop,wscale 2>
15:57:32.417840 IP server.ftp > client.43278: P 1:99(98) ack 1 win
1448 <nop,nop,timestamp 109279056 538163921>
15:57:32.418195 IP client.43278 > server.ftp: . ack 99 win 1460
<nop,nop,timestamp 538194387 109279056>
15:57:32.418213 IP client.43278 > server.ftp: P 1:14(13) ack 99 win
1460 <nop,nop,timestamp 538194387 109279056>
15:57:32.421924 IP server.ftp > client.43278: . ack 14 win 1448
<nop,nop,timestamp 109279057 538194387>
15:57:32.445824 IP server.ftp > client.43278: P 99:127(28) ack 14 win
1448 <nop,nop,timestamp 109279063 538194387>
15:57:32.446250 IP client.43278 > server.ftp: P 14:32(18) ack 127 win
1460 <nop,nop,timestamp 538194415 109279063>
15:57:32.461933 IP server.ftp > client.43278: P 127:155(28) ack 32 win
1448 <nop,nop,timestamp 109279068 538194415>
15:57:32.502736 IP client.43278 > server.ftp: . ack 155 win 1460
<nop,nop,timestamp 538194471 109279068>


my iptable rules are:

iptables -F
iptables -t nat -F
#FTP
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 21 -j DNAT
--to-destination server:21 -v
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 20 -j DNAT
--to-destination server:20 -v
#Telnet
iptables -t nat -A PREROUTING -i $ext_dev -p tcp --dport 23 -j DNAT
--to-destination server:23 -v
#ip forward
echo "1" > /proc/sys/net/ipv4/ip_forward


root@router:~# iptables -V
iptables v1.3.6

root@router:~# uname -a
Linux dt4k042 2.6.24.7-DTSG-0.0.15 #2 SMP Thu Oct 30 12:20:46 CET 2008
i686 GNU/Linux

telnet is working fine, while i got this unforwarded messages from the
server (server.36897 > client.auth).

any idea?
