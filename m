From: Tim Cronin <tim@13-colonies.com>
Subject: RE: iptables and linuxVirtualServer
Date: Thu, 3 Oct 2002 10:56:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <71FD63241A2DD511AFED00010236A4B33224BF@LIVAUDAIS>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Walther@gehag-dsk.de'" <Walther@gehag-dsk.de>, Tim Cronin <tim@13-colonies.com>
Cc: netfilter@lists.netfilter.org

yup, I've checked the packet exchange for a single page request.

the problem is that since lvs is handling the NAT for http
iptables doesn't look like it's tracking state.

if I let iptables handle nat to the web server the line below
works.


-----Original Message-----
From: Walther@gehag-dsk.de [mailto:Walther@gehag-dsk.de]
Sent: Wednesday, October 02, 2002 12:01 PM
To: Tim Cronin
Cc: netfilter@lists.netfilter.org
Subject: Re: iptables and linuxVirtualServer


this is based on tcp-connection basics

client ->syn-> server
server ->ack(syn-ack) and syn(time-sync)-> client
client ->ack-> server (HERE you get the ack-problems)
server ->ack->client


Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04




Tim Cronin <tim@13-colonies.com>
Sent by: netfilter-admin@lists.netfilter.org
02.10.2002 17:52

 
        To:     "'netfilter@lists.netfilter.org'"
<netfilter@lists.netfilter.org>
        cc: 
        Subject:        iptables and linuxVirtualServer


I have a box I'm using as a gateway to a private network.
It does lvs_nat to expose http and ftp services.
eth0 is my external nic.
it's running rh 7.3 /w kernel 2.4.19
I've go the connection tracking modules loading.

I've posted this on the lvs mailing list and it was suggested 
I post here as well.

I'm having problems with the following
iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state NEW -j DROP 
if this rule is set I'm unable to connect to my web server.

I added the following 

iptables -A INPUT -i eht0 -p tcp ! --syn \
-m state --state NEW \
-j LOG --log-prefix "IPTABLES SYN: "

and I get the following log

Oct  1 11:12:24 loadbalancer kernel: 
IPTABLES SYN: 
IN=eth0 OUT= 
MAC=00:80:ad:98:14:94:00:b0:d0:2c:96:16:08:00 
SRC=172.24.1.24 
DST=172.24.1.251 
LEN=411 TOS=0x00 PREC=0x00 TTL=128 ID=61175 DF 
PROTO=TCP 
SPT=1262 
DPT=80 
WINDOW=64240 RES=0x00 ACK PSH URGP=0

if I add the following before the rule above

iptables -A INPUT -i eth0 -p tcp ! --syn --dport http -m state --state NEW
-j ACCEPT

I can get access, but this seems to defeat the purpose.

I'm guessing that since the http requests are being handled by
lvs iptables doesn't track the state, but this is just a swag on my part.

any help would be appreciated.








