From: Mauricio Tavares <raubvogel@gmail.com>
Subject: newbie: forward rule to itself
Date: Wed, 27 Oct 2010 15:02:36 -0400
Message-ID: <4CC8774C.1070908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=vZEQ4V0bis3xLElWazIGvhLXq0jE4j3g8g71C+N6qVI=;
        b=Z4CgU4FoZqp80itxkD/wUU0raEkwiWnRfKdMeJ+XynocXUOEghsZH+stP63zAwL2vW
         UHg8bNZpcFB2pb92jkBXeamafrpvlSsR3XQ4TigEoq0wF9ArdMkNnhd4fq1tvYMoimuD
         CkY8bLZtsjZzrPktyr++h9IyHgu7pDjgG1ips=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

	Let's say I have server1 with two ports, eth0 and eth0, and server2 
whose eth0 port is connected to server1's eth1. And let's say the subnet 
between them is 192.168.1.0/24 while the one server1's eth0 is connected 
to is 192.168.4.0/24.

I have the following rules to forward port 6969 coming on eth0 on 
server1 to port 6969 on server2's eth0:

iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to 
192.168.1.server2:6969
iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state 
NEW --dport 6969 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Any machine in 192.168.4.0/24 seems to be able to get to server2 by 
using 192.168.1.server1:6969. But, if I try to connect to 
192.168.1.server1:6969 on server1 itself, I will not be forwarded to 
server2. What am I missing here?
