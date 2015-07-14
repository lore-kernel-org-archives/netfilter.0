From: Steve Hill <steve@opendium.com>
Subject: Mangling and blocking
Date: Tue, 14 Jul 2015 15:20:15 +0100
Message-ID: <55A51A9F.8050800@opendium.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040609010403080705060702"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------040609010403080705060702
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


I'm writing some fairly complex firewall rules, which will be 
controllable through a GUI.  The basic requirement is:

1. The user can select whether or not to allow some traffic.
2. Traffic the user has opted to disallow, will be directed at a 
transparent proxy, if there is a suitable proxy, otherwise it will be 
dropped.  This is done by setting a MARK on the traffic and applying 
special routing to it.

I can obviously construct rules to make a decision about 
allowing/blocking traffic and apply them to the FORWARD chain in the 
filter table.  However, the rules to make a decision about what gets 
sent to the transparent proxy are almost identical to the filtering 
rules, but iptables only lets you MARK in the mangle table - this means 
I need to duplicate all the filter rules into the mangle table, which 
seems like a very inefficient way of doing things when there are a large 
number of rules.

Doing any kind of filtering in the mangle table seems to be strongly 
discouraged, so I'm looking for some advice on the best way to approach 
this.  What are the problems associated with either filtering in the 
mangle table's PREROUTING chain, or at least just having mangle rules to 
MARK packets that are to be allowed and then rules in the filter table 
that allow/drop based on that MARK?

 From looking at 
https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Netfilter-packet-flow.svg/2000px-Netfilter-packet-flow.svg.png 
it looks like:
- mangle:PREROUTING will carry both INPUT and FORWARD traffic, so care 
would need to be taken to ensure the rules are acting on the right traffic.
- mangle:PREROUTING rules won't be able to use -o, whereas 
filter:FORWARD could.
- mangle:PREROUTING will happen before any NAT, so some traffic would 
have the "wrong" addresses on it.


Secondly, am I right in thinking that a MARK that affects routing needs 
to be set in mangle:PREROUTING - i.e. by the time mangle:FORWARD is 
traversed, its too late?


Thanks.

-- 
  - Steve Hill
    Technical Director
    Opendium Limited     http://www.opendium.com

Direct contacts:
    Instant messager: xmpp:steve@opendium.com
    Email:            steve@opendium.com
    Phone:            sip:steve@opendium.com

Sales / enquiries contacts:
    Email:            sales@opendium.com
    Phone:            +44-1792-824568 / sip:sales@opendium.com

Support contacts:
    Email:            support@opendium.com
    Phone:            +44-1792-825748 / sip:support@opendium.com

--------------040609010403080705060702
Content-Type: text/x-vcard; charset=utf-8;
 name="steve.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="steve.vcf"

begin:vcard
fn:Steve Hill
n:Hill;Steve
org:Opendium Limited
adr:1 Brue Close;;Highfield House;Bruton;Somerset;BA10 0HY;England
email;internet:steve@opendium.com
title:Technical Director
tel;work:+44-1792-824568
x-mozilla-html:FALSE
url:http://www.opendium.com
version:2.1
end:vcard


--------------040609010403080705060702--
