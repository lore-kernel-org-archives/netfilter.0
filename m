From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 11:41:41 +0800
Message-ID: <4ECF0E75.7030000@gmail.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <4ECEEC11.5010701@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000402010505060304050805"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type;
        bh=JB4HOKAhlFgoceLvHjRDpM2fw49e3j8SDLf7+9yWaHo=;
        b=WkFbmkizrCSZJaVsgz6B4NOdWGHR3rDs4uMCrAtSVDNbOta3FS/gQJ6HJKxnMgCoc5
         EH0ZXgAEzsm9qfQ1NQm5mPExSKknPn7M0f6eREVGiFihm+MNOEz0zUf8tL73XkWKvdm7
         7MUJ0c/tQEdkcbYxsMA/eW4wDYp53feM3FE68=
In-Reply-To: <4ECEEC11.5010701@cn.fujitsu.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gao feng <gaofeng@cn.fujitsu.com>
Cc: netfilter@vger.kernel.org, "Brian J. Murrell" <brian@interlinx.bc.ca>

This is a multi-part message in MIME format.
--------------000402010505060304050805
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi, Gao Feng:
     First thanks for your response!
     I set the two timeout to their corresponding value:
     echo 60 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
     echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose

     The ESTABLISHED item for port 9999 was inserted after connection 
created and removed after 60 seconds timeout.
     Using tool conntrack supplied by iptables also proved this:

     conntrack -E
     [DESTROY] tcp      6 src=192.168.2.194 dst=192.168.2.166 
sport=41570 dport=9999 packets=4 bytes=218 src=192.168.2.166 
dst=192.168.2.194 sport=9999         dport=41570 packets=3 bytes=166

     However netstat indicated that the physical connection was still 
there and the communication between two endpoints was not blocked or 
dropped.

     netstat -an | grep 9999
     tcp        0      0 192.168.2.166:9999          
192.168.2.194:41570         ESTABLISHED

     The state related rule set in my configuration did not work at all:

     -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
     -A INPUT -p tcp -m state --state ESTABLISHED -j LOG --log-prefix 
"conn established::"
     -A INPUT -p tcp -m state --state INVALID -j DROP
     -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state 
--state NEW -j LOG --log-prefix "DROP invalid::"
     -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state 
--state NEW -j DROP

     The communication was not affected by the rules and no log in 
/var/log/iptables.log.
     For an explanation, I redirected my Linux kernel log to 
/var/log/iptables.log

     However other rule in /etc/sysconfig/iptables did logged file, log 
found in /var/log/iptables.log
     -A INPUT -p tcp -m tcp --dport 9999 -j LOG --log-prefix "ACCEPT 
9999::"

     I attached my iptables rule set for reference.
     Hope you can give me another hint and related rule set.
     Thanks for your support.


On 2011-11-25 9:14, Gao feng wrote:
> 于 2011年11月24日 17:46, lu zhongda 写道:
>>      The timeout is defined in //proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established/ , which is defaulted to 5 days, I change it to a short value for testing, such as 1 min.
>>      the linux shell command is: echo "60">  //proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established/
>>      The timeout for ESTABLISHED type item does works, and the item is removed after timeout, however the connection is not blocked or dropped at all.
> Hi zhongda.
>
> How about echo 0>  /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose
>


--------------000402010505060304050805
Content-Type: text/plain;
 name="iptables"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="iptables"

IyBHZW5lcmF0ZWQgYnkgaXB0YWJsZXMtc2F2ZSB2MS4zLjUgb24gVGh1IE5vdiAyNCAxNTox
OTo1OSAyMDExCipmaWx0ZXIKOklOUFVUIERST1AgWzIwMDoyOTUzMl0KOkZPUldBUkQgRFJP
UCBbMDowXQo6T1VUUFVUIEFDQ0VQVCBbMDowXQotQSBJTlBVVCAtcCB0Y3AgLW0gdGNwIC0t
ZHBvcnQgMjIgLWogQUNDRVBUIAotQSBJTlBVVCAtcCB0Y3AgLW0gdGNwIC0tZHBvcnQgOTk5
OSAtaiBMT0cgLS1sb2ctcHJlZml4ICJBQ0NFUFQgOTk5OTo6IiAKLUEgSU5QVVQgLXAgdGNw
IC1tIHRjcCAtLWRwb3J0IDk5OTkgLWogQUNDRVBUIAotQSBJTlBVVCAtcCB1ZHAgLW0gc3Rh
dGUgLS1zdGF0ZSBFU1RBQkxJU0hFRCAtaiBBQ0NFUFQgCi1BIElOUFVUIC1wIHRjcCAtbSBz
dGF0ZSAtLXN0YXRlIEVTVEFCTElTSEVEIC1qIExPRyAtLWxvZy1wcmVmaXggImNvbm4gZXN0
YWJsaXNoZWQ6OiIgCi1BIElOUFVUIC1wIHRjcCAtbSBzdGF0ZSAtLXN0YXRlIElOVkFMSUQg
LWogRFJPUAotQSBJTlBVVCAtcCB0Y3AgLW0gdGNwICEgLS10Y3AtZmxhZ3MgRklOLFNZTixS
U1QsQUNLIFNZTiAtbSBzdGF0ZSAtLXN0YXRlIE5FVyAtaiBMT0cgLS1sb2ctcHJlZml4ICJE
Uk9QIGludmFsaWQ6OiIgCi1BIElOUFVUIC1wIHRjcCAtbSB0Y3AgISAtLXRjcC1mbGFncyBG
SU4sU1lOLFJTVCxBQ0sgU1lOIC1tIHN0YXRlIC0tc3RhdGUgTkVXIC1qIERST1AgCgotQSBP
VVRQVVQgLXAgdGNwIC1tIHRjcCAtLXNwb3J0IDIyIC1qIEFDQ0VQVCAKLUEgT1VUUFVUIC1w
IHRjcCAtbSB0Y3AgLS1zcG9ydCA5OTk5IC1qIEFDQ0VQVCAKLUEgT1VUUFVUIC1wIHVkcCAt
bSBzdGF0ZSAtLXN0YXRlIE5FVyxFU1RBQkxJU0hFRCAtaiBBQ0NFUFQgCi1BIE9VVFBVVCAt
cCB0Y3AgLW0gc3RhdGUgLS1zdGF0ZSBORVcsRVNUQUJMSVNIRUQgLWogTE9HIC0tbG9nLXBy
ZWZpeCAib3V0IGNvbm4gZXN0YWJsaXNoZWQ6OiIgCi1BIE9VVFBVVCAtcCB0Y3AgLW0gc3Rh
dGUgLS1zdGF0ZSBORVcsRVNUQUJMSVNIRUQgLWogQUNDRVBUIAotQSBPVVRQVVQgLXAgdGNw
IC1tIHRjcCAhIC0tdGNwLWZsYWdzIEZJTixTWU4sUlNULEFDSyBTWU4gLW0gc3RhdGUgLS1z
dGF0ZSBORVcgLWogRFJPUCAKQ09NTUlUCiMgQ29tcGxldGVkIG9uIFRodSBOb3YgMjQgMTU6
MTk6NTkgMjAxMQo=
--------------000402010505060304050805--
