From: Jeremy Schaeffer <service@phonesplus.biz>
Subject: netfilter dropping wanted packets
Date: Mon, 25 Jun 2012 18:20:15 -0500
Message-ID: <4FE8F22F.3010008@phonesplus.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080900070304070202090408"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080900070304070202090408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I keep having an issue where I have a ipsec tunnel and on the remote end 
there is a megeco IP phone. It keeps dying and I get the following error:

Message from syslogd@services at Jun 21 07:17:33 ...
  kernel:nf_ct_RAS: dropping packetIN= OUT=eth0 SRC=172.29.102.105 
DST=172.28.130.5 LEN=175 TOS=0x00 PREC=0x00 TTL=63 ID=40 PROTO=UDP 
SPT=49736 DPT=1719 LEN=155

I noticed that port 1719 is a H.32x port, is there a way to have 
netfilter not try to decode that packet? I am not using H.32x, I want 
those packets to forward instead of being dropped. - Jeremy

--------------080900070304070202090408
Content-Type: text/x-vcard; charset=utf-8;
 name="service.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="service.vcf"

begin:vcard
fn:Jeremy Schaeffer
n:Schaeffer;Jeremy
org:Phones Plus of Janesville
adr:;;123 W. Milwaukee St.;Janesville;WI;53548;US
email;internet:jeremy@phonesplus.biz
title:Service Technician
tel;work:(608) 531-6290
tel;fax:(608) 756-8810
url:http://www.phonesplus.biz
version:2.1
end:vcard


--------------080900070304070202090408--
