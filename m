From: "J. Bakshi" <joydeep@infoservices.in>
Subject: really need your help about iptables
Date: Tue, 25 Aug 2009 17:03:48 +0530
Message-ID: <4A93CC1C.3070100@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear list,

I really really need your help to configure iptables to cope with
"connection time out problem"  Here what actually the situation is.

I have configured iptables to drop nmap and other port scanning
techniques ( collected from internet, like XMAS scan, FIN scan etc...).
If I run nmap against the server ( like nmap -P0 <myserver> or nmap -P0
-sT <myserver> ) then the firewall successfully dropping the scan
packets and  make the nmap scan  to wait for *looooong* .  Good.  But on
the other hand  the  http and mail server running on the  server
providing "time out error" hence it is not possible to connect the mail
/apache and other services running on that  server during port scanning
against it. Could any one kindly suggest how to cope with this situiation ?

Thanks for your time.
