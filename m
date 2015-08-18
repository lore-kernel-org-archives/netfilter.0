From: =?UTF-8?B?0KLQtdC9INCb0LXQsg==?= <leo.ten@gmail.com>
Subject: conntrackd and natted tcp sessions
Date: Tue, 18 Aug 2015 19:38:12 +0600
Message-ID: <55D33544.7050200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=vYuNFoirvZRMpzpATbgI80tqVXlt64AbqIzSzp6duuI=;
        b=WfHroqYvRAEHwMNpJ4stRrrmIEHAGqxSBzb+dgrPjsrvQ5JQcdP1lGGdeKKv5rFXrD
         7CA4wdBhozpVyreW6MTKLlb/Ab1bTo3TgjlY6SF+eFKhg9nYwqgma5quPgrdpfJIA7ye
         D+kaGqIQTtRdzOfZKs7gWKpTvAdEjhW4C+H5O6LUryB9Z13QWqaiyIZAsFlAwsbqnm3Z
         /c1KeMYEPB3oRJ4tY/H/DzK2odUokrq1M4u37YPehKoJs7GMKDZmdxGX87uYlGkM6/2J
         emwBGZV6c87wHINB2njjLCnN4OjdESec1EN82m387E4i2o8/B+ZqNT/NKzOyAypOLOZc
         P4PQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I have a problem running conntrackd in active-active mode. My setup is:
2 nat boxes in 2 different data centers - natbox1 and natbox2
 From each DC a single network is broadcasted through BGP, so both 
natboxes have the same IP.
Behind nat boxes are networks with addresses 10.0.0.0/16 and 
10.0.1.0/16, and there is a l2 tunnel between them, so all hosts in 
these networks are accessible to each other.
There are identical servers in both DCs in 10.0/16 networks -server1 and 
server2. Let's say the address of one of them is 10.0.1.2 and the second 
has address 10.0.0.2.

server1 is behind natbox1 and server2 is behind natbox2.

The problem I am trying to solve is that when server1 sends a TCP 
request (HTTP for example) and the remote server is replying to the 
natbox2 in another DC, instead of natbox1 due to the fact, that it is 
'closer' to it, the reply should be delivered from natbox2 to server1, 
that initially sent the request through the tunnel between natboxes.

Conntrackd perfectly syncs states and writes them into the kernel 
conntrack tables of natboxes, request gets to the natbox2, but never 
leaves it to server1.

Everything is working for UDP and ICMP packets. But TCP gets stuck on 
the natbox and never gets sent to the correct server. And also if 
requests and relies go through the same DC TCP connections also work.

I am running Ubuntu 14.04.3 LTS on Linux natbox2.reg.ru 
3.13.0-61-generic. All server are KVM virtual machines.

Thanx in advance!

leo
leo.ten@gmail.com
