From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: RFC 1035 Bind
Date: Tue, 9 Nov 2004 11:22:47 -0800
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E473235@FSNSAB30>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Mark-Walter@t-online.de'" <Mark-Walter@t-online.de>, netfilter@lists.netfilter.org


use of port 53 is for zone transfers between dns servers and for when dns
tries to mux up traffic over tcpmux service on tcp port 1.
if one is defining what dns traffic to allow internally trhen in order to
prevent a bunch of needless coding include tcp port 53 in your plans
else you aewe asking for resolution problem down the road.
4.2.2. TCP usage

Messages sent over TCP connections use server port 53 (decimal). The message
is prefixed with a two byte length field which gives the message length,
excluding the two byte length field.  This length field allows the low-level
processing to assemble a complete message before beginning to parse it. this
is an advantage as this extends the bogus 512 byte limit set by udp.


as far as connectivity management, the dns server should not block other
activities waiting for TCP data and should support multiple connections,
should assume that the client will initiate
close a dormant connection to reclaim resources, it wait 120 seconds of idle
time before killing the connex.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of
Mark-Walter@t-online.de
Sent: Tuesday, November 09, 2004 11:02 AM
To: netfilter@lists.netfilter.org
Subject: RFC 1035 Bind 


Hi,

there's quite a lot to read about open UPD and TCP port for DNS
queries.

I read an article from a tech guru from microsoft as follow:-)

http://certcities.com/editorial/columns/story.asp?EditorialsID=144&page=2

As I understand RFC 1035 answering packet's over TCP are truncated
at a limit of 512 bytes but it could be more ...

Isn't it the comparing this document the best way while using 
UDP to DROP TCP packets over port 53 and to allow only UDP port 
53 at it does not use the IP protocol ?

Ok, I know there could be a problem in the inside of a webserverfarm
and you need to allow both protocols and he is refering to this
but generally I would like prefer to avoid TCP over port 53 concerning
to avoid a man-in-the-middle attack.

-- 
Best Regards, Mark. 
"Hello, I am brand new to meditation, and I have a frustrating habit of
falling asleep in class. I don't know how to stop this. When my teacher
tells us to relax our bodies and focus on breathing, my body relaxes, but so
does my brain."

