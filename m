From: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Subject: conntrackd  crash after few seconds
Date: Thu, 05 Jun 2014 17:19:26 +0200
Message-ID: <53908A7E.4020802@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024; t=1401981569; bh=FpUBZNKo4ZIb91ZOn5b+OQTZ1cHcJK3qR9DUvpl9nzc=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=qTwSlXO0X2DTadUNwK34iNXUXb/+CslwCfLkZrLQcVEU/HDjKzvN82/Z3EwD8NgKvvpKUcNYN2B/QvT21fYF+PRv8NnnedaoshNhF955Po8xbc81yZH3o5MV4gKgzIWjIQNRJVMhgfEU3se+FUPv42/JwlYXXnbudQ6v/LxSHqE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
thanks for the work !
and sorry for bad english.

informations :

debian wheezy     3.2.0-4-amd64 #1 SMP Debian 3.2.57-3+deb7u2 x86_64 
GNU/Linux
packages
ii  conntrack                        1:1.2.1-1 amd64        Program to 
modify the conntrack tables
ii  conntrackd                       1:1.2.1-1 amd64        Connection 
tracking daemon
ii  libnetfilter-conntrack3:amd64    1.0.1-1 amd64

conntrackd.conf
--------------------------------------------------
Sync {
     Mode FTFW {
         DisableExternalCache On
     }
     UDP {
         IPv4_address 10.98.145.5
         IPv4_Destination_Address 10.98.145.6
         Port 3780
         Interface eth2
         SndSocketBuffer 1249280
         RcvSocketBuffer 1249280
         Checksum on
     }
}
General {
     Nice -20
     Scheduler {
         Type FIFO
         Priority 99
     }
     HashSize 32768
     HashLimit 131072
     LogFile on
     Syslog off
     LockFile /var/lock/conntrack.lock
     UNIX {
         Path /var/run/conntrackd.ctl
         Backlog 20
     }
     NetlinkBufferSize 2097152
     NetlinkBufferSizeMaxGrowth 8388608
     NetlinkOverrunResync On
     NetlinkEventsReliable Off
     PollSecs 15
     EventIterationLimit 100
     Filter From Userspace {
         Protocol Accept {
             TCP
         }
         Address Ignore {
             IPv4_address 127.0.0.1
         }
     }
}
----------------------------------------------------------

My problem :

when a start de deamon :  /etc/init.d/conntrackd start
i can see this line for ten secondes in "ps faux"

root      3764  0.0  0.0  14836  2484 ?        S<s  16:53   0:00 
/usr/sbin/conntrackd -d -C /etc/conntrackd/conntrackd.conf

and then disapear.

a try to run  with  (after deleting /var/lock/conntrack.lock )

conntrackd -C /etc/conntrackd/conntrackd.conf

then i have :

conntrackd: api.c:526: __build_query_exp: Assertion `ssh != ((void *)0)' 
failed.
abandon

at about ten seconds.

any ideas ?

others informations , i use the same conf file without any problems on 
squeeze (2.6.32-5) with .
ii  conntrack                          1:0.9.14-2 Program to modify the 
conntrack tables
ii  conntrackd                         1:0.9.14-2 Connection tracking daemon
ii  libnetfilter-conntrack3            0.0.101-1

only a every two hours avg load peak activity.

regards

-- 
Nicolas

