From: =?UTF-8?B?SMO8c2V5aW4gw4dPVFVL?= <hcotuk@gmail.com>
Subject: Conntrackd failover problem
Date: Tue, 28 Mar 2017 11:12:40 +0300
Message-ID: <3c8a2d61-284f-d8d2-aff9-d4717553c1ee@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=9m09CrMbhXXTwDclr1KbkjMXw8NIztuoOimdZ3TdSYg=;
        b=i6cOE1SuKKfy/GpvENNrCnflul9wbKXPj9S0a0O3PlrEQ7n3ePGu3dC3Vd9selv4Pp
         kWvsySnheIrmwg/60WWb9qldBNk+uH55KGkPci3TdJERcXPdjnJDpo+OWmpextpRkl+A
         BNEh4NUXkrGuwXiN8MDAWo1grFcw7lIUa0WMpU4Oa3AlKFCsnxA/SCpkt9OxZhqzIDRZ
         bmn18ljHmrugTH9rLrWAxzeFe7FmhMqD18pOZELDO5KUZDWL4aXfHcYe0VH/Ctai7oP0
         BXUb1JCQfiu7ASq8DJjYopvl7EUTylZ0EhMED+LcFhTty30vLoPl8ay5Xiz2DkzsmMJf
         aSvQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Everyone,

I am using a pair of HA FW clusters with iptables, conntrackd, and 
keepalived on Debian Jessy with kernel 4.9.15. I compiled 
conntrack-tools 1.4.4 from the sources. I configured keeplived and 
conntrackd exactly same with the documentation.

Everything works flawlessly when I restart keepalived service or put the 
interfaces down on the master or on the backup. Failover occurs without 
any problem and the backup FW takes the load without interruption. But 
when I reboot the master FW server, backup server takes the load without 
problem, but whenever the master server becomes online again and takes 
the load back, ongoing sessions like ssh are dropped.

I found a similar thread with the topic "Suggested improvement for 
conntrack-tools primary-backup.sh script " about the similar problem, 
and tried that solution with adding "conntrackd -n" to the original 
primary-backup.sh script with no luck.

I read the test case in netfilter page several times, and check my rules 
according to the scenario. Here is my firewall rules related with the 
ssh session: (variables with $ are defined in my script)

iptables -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p ALL -d $DMZ_LAN -j dmz_input
iptables -A FORWARD -p tcp -s $DMZ_LAN  --syn -m state --state NEW -j ACCEPT
iptables -A FORWARD -p tcp -s $DMZ_LAN  -m state --state ESTABLISHED -j 
ACCEPT
iptables -A FORWARD -p ALL -s $DMZ_LAN -j dmz_output
iptables -A dmz_output -s $DMZ_LAN -j ACCEPT
iptables -A dmz_input -p tcp -s 88.231.63.35 -d $DMZ_SERVICE_IP -m 
multiport --dports 22 -j ACCEPT # Service SSH

Before rebooting the master server, when I compare the conntrackd 
internal and external caches on the master and backup servers, I can see 
a difference. Real IP of the server that I connect with ssh is shown by 
{ssh_server_IP}.

On the master:

root@IST-FW01:~# conntrackd -i | grep {ssh_server_IP} | grep sport=22
tcp      6 ESTABLISHED src=88.231.63.35 dst={ssh_server_IP} sport=55190 
dport=22 src=192.168.164.99 dst=88.231.63.35 sport=22 dport=55190 
[ASSURED] [active since 4s]

On the backup:

root@IST-FW02:~# conntrackd -e | grep {ssh_server_IP} | grep dport=22
tcp      6 ESTABLISHED src=88.231.63.35 dst={ssh_server_IP} sport=55190 
dport=22 [ASSURED] [active since 45s]

As you can see, the ssh server is behind the firewall and is accessed 
with the help of nat rules. But nat part from the dmz to the internet is 
only seen on the master server, and missing on the backup.

I do not know whether this is the expected behavior or not. When I 
restart the keepalived service or put the interfaces down, it works as 
expected. It does not work only when I reboot the master and it becomes 
online again. Am I missing something? Any suggestion?

Thanks in advance.

Regards,

Huseyin

