From: xavier droubay <xavier.droubay@gmail.com>
Subject: port forwarding to web server with different netmask than default netmask.
Date: Sun, 28 Apr 2013 05:11:27 +0200
Message-ID: <CAHyoP5wSne5W_ufVD8OzVmsH=eFrXon-uoDrohT_yCAyrkmEcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=jWu9NXrbCr0JBpu97WUJXF9kF9vwf0hRhG6ltF+S+CY=;
        b=ZIwkmAP3/WfgarMBVyB0GrA/SUq9V7sRu/dK6CEzBbgOZmllwQ56MSYkIqhjRXXHAv
         FFV4WBSisstjT2nM4kdYqQjGZ3tp4pAIfc3BUSwDv/EkFn96k+WBhgSPSNlBw8Ffz/XX
         YNgWfT71U6cdGQxe2hEWl2UiU9BTUv2sVFzfVlKjFhkdxYkh9OlZJlkpJd3nK+cMXmdB
         eIfZvPs6zsQmPjbz9bPNTfH6tK/j6KYzdkC3Hp+u/tvCK9k0E9Jui8Zaif9YKJEbwNje
         tWl6RppmTk2eWopyb8hwkqMPneCzOGxKZyWGuh301nvXPCYPcCatC1USiHmpua+kiXOz
         I3eQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

have the following config.


Internet  ----(WAN)- pfsense -(DMZ)------(eth0)- COOVA Hostpot box
-(eth1)----WIFI + AP Zone

I configured pfsense to forward 8001 to 172.1.1.1 port 8001
eth0 : 172.1.1.1/248
eth1 : 10.0.0.1/16


My pbm is to port forward port 8001 to several WEB servers APS.

All my APs have /24 netmask, ie 10.127.127.11/24

On the coova, I defined alias eth1:AP1 to 10.127.127.251/24 in order
to ping the AP1 (no ping without this alias)

nmap -sT 10.127.127.11 -p 80
PORT   STATE SERVICE
80/tcp open  http

And to confirm, "lynx 10.127.127.11" is ok

But I cannot reach AP1 from internet.
tcpdump shows www queries reaching eth1, but ther is no www answer from the AP1.
# tcpdump -i eth1 'host 10.127.127.11'
04:23:40.647819 ARP, Request who-has 10.127.127.11 tell 10.127.0.1, length 28
04:23:40.648375 ARP, Reply 10.127.127.11 is-at c0:c1:c0:1a:7a:e1 (oui
Unknown), length 46
04:23:40.648387 IP myhomeip.org.53874 > 10.127.127.11.www: Flags [S],
seq 3716296767, win 8192, options [mss 1352,nop,wscale 2,sackOK,TS val
14138801 ecr 0], length 0
...
04:23:49.647643 IP myhomeip.org.53874 > 10.127.127.11.www: Flags [S],
seq 3716296767, win 8192, options [mss 1352,sackOK,TS val 14139701 ecr
0], length 0
04:23:49.897440 IP myhomeip.org.42759 > 10.127.127.11.www: Flags [S],
seq 1470074896, win 8192, options [mss 1352,sackOK,TS val 14139726 ecr
0], length 0
04:24:13.331817 ARP, Request who-has 10.127.127.11 tell 10.127.0.1, length 28
04:24:13.332183 ARP, Reply 10.127.127.11 is-at c0:c1:c0:1a:7a:e1 (oui
Unknown), length 46
04:24:17.329358 IP myhomeip.org.51567 > 10.127.127.11.www: Flags [S],
seq 2987723356, win 8192, options [mss 1352,sackOK,TS val 14142469 ecr
0], length 0
...


For me problem in port forwarding comes from the AP1 netmask set to
"24" while default netmask is "16".

I am at the end of my tests.

Any help is appreciated.

Regards,

Xavier Droubay

Here are below netfiler rules :

# iptables -L -n -v -t filter
Chain INPUT (policy ACCEPT 373K packets, 53M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 801K   44M TCPMSS     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
  21M 4405M ACCEPT     all  --  eth1   *       0.0.0.0/0            0.0.0.0/0
  31M   37G ACCEPT     all  --  *      eth1    0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
10.127.127.0/24     tcp dpt:8011

Chain OUTPUT (policy ACCEPT 310K packets, 44M bytes)
 pkts bytes target     prot opt in     out     source               destination

# iptables -L -n -v -t nat
Chain PREROUTING (policy ACCEPT 758K packets, 59M bytes)
 pkts bytes target     prot opt in     out     source               destination
  103  6180 DNAT       tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:8011 to:10.127.127.11:80

Chain POSTROUTING (policy ACCEPT 7872 packets, 330K bytes)
 pkts bytes target     prot opt in     out     source               destination
 238K   18M MASQUERADE  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 107K packets, 6925K bytes)
 pkts bytes target     prot opt in     out     source               destination
root@baltimo-radius:~#
