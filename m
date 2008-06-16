From: "Artem Y. Pervin" <artempervin@gmail.com>
Subject: rule is ignored for the localhost
Date: Mon, 16 Jun 2008 23:41:50 +0400
Message-ID: <86ff9a9a0806161241r65b5a734o2b0ebc8e2ef0c4fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=LCYhRf/0bsHHntZAfzwDBjHQOB22fMbYjmhf2H+znU4=;
        b=GZQITNsGuPSCqnppTv96paoHI2WbDHmxzH3tvb3XSaPvKdSVq9AL1K5mlBgJiRLJgF
         m1z2IY+seKHYScXQFKEDg31xRtdsS2g1oUwsHU/dZ53XcVuPENUsjqJuD0TI3LtrLgu7
         w5AbLkLaBJ3get6SuktsIOQ5oco7GyjupP61I=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear netfilter/iptables users!

Can you please help me with iptables setup?
I want to do a simple thing. I want some port of the external
interface to redirect TCP traffic to the private network.
So, I have the following rule sequence:

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
$ cat rules.sh
INTIF="eth1"
EXTIF="eth2"

# Default policy
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Flush tables
iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT
iptables -F -t nat

# Setup NAT
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

# Port forwarding
iptables -t nat -I PREROUTING -i $EXTIF -p tcp --dport 30099 -j DNAT
--to 192.168.10.119:22
iptables -t nat -I PREROUTING -i lo -p tcp --dport 30099 -j DNAT --to
192.168.10.119:22
iptables -I INPUT -i $EXTIF -p tcp --dport 30099 -j ACCEPT
iptables -I INPUT -i lo -p tcp --dport 30099 -j ACCEPT
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.

When I try to access my machine from a remote host, everything works fine:
[versus@demo ~]$ ssh -p 30099 root@somehost.somedomain
...
Are you sure you want to continue connecting (yes/no)?

But when I try to access the 30099 port from the localhost, I get
connection refused:
[root@somehost ~]# ssh -vp 30099 root@localhost
OpenSSH_3.9p1, OpenSSL 0.9.7a Feb 19 2003
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Applying options for *
debug1: Connecting to localhost [127.0.0.1] port 30099.
debug1: connect to address 127.0.0.1 port 30099: Connection refused
ssh: connect to host localhost port 30099: Connection refused

I've tried to use the external ip adress as well, but I'm getting the
same result:
[root@somehost ~]# ssh -vp 30099 root@somehost.somedomain
OpenSSH_3.9p1, OpenSSL 0.9.7a Feb 19 2003
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Applying options for *
...
ssh: connect to host somehost.somedomain port 30099: Connection refused

What is wrong with my configuration? Why iptables ignore the rule for
the localhost case?
I'm using iptables v1.3.7, kernel is 2.6.21.1.

--
Best regards,
Artem Pervin
