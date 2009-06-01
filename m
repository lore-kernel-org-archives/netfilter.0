From: vitry <vitry.es@gmail.com>
Subject: Possible bug in owner match
Date: Mon, 01 Jun 2009 18:36:42 +0200
Message-ID: <4A24039A.3080006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=xPqGEfKeB/vjWM7C6nuJSl9zDvVSD6i/WL7xehmgq3U=;
        b=ftezmdTNuLabM8InU14dAQ+RVtjMonR+pemrF5c95HPCYEEP+nFxlumIwzhXS7XUOy
         ynxHUzWX0lCmbGDK7xq3ZsI1/znM1PHNVWksltF3bfKefQUoXDaG4pV16fNB1E50lYz+
         TtZ/cEvX8NgxKnY+DSeDcGHv0/+kE6ukwT/dk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi to all,

I want to report a possible bug in owner match with uid test not submit
in iptables.git (in olders versions it works fine)

host: Linux iris 2.6.26-2-amd64 #1 SMP Fri Mar 27 04:02:59 UTC 2009
x86_64 GNU/Linux
          iptables v1.4.3.1

fw:     Linux Firewall-2 2.6.28.9 #5 Fri Mar 27 06:52:33 CET 2009 mips
unknown
          iptables v1.4.3.1

Problem with UID (Not match):

/iris:~# iptables -t mangle -L OUTPUT -v -n
Chain OUTPUT (policy ACCEPT 3538K packets, 216M bytes)
 pkts bytes target     prot opt in     out     source              
destination        
 1806  152K TOS        all  --  *      *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>          
owner UID match 1002 TOS set 0x40/0xc0


root@Firewall-2:~# iptables -t mangle -Z


1002:1002@iris//# ping -c 1 192.168.10.1


root@Firewall-2:~# iptables -t mangle -L PREROUTING -v
-n                         
Chain PREROUTING (policy ACCEPT 226 packets, 76471 bytes)
 pkts bytes target     prot opt in     out     source              
destination        
    0     0 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0x40/0xc0 MARK xset 0x2/0xffffffff
    0     0 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0x80/0xc0 MARK xset 0x3/0xffffffff
    0     0 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0xc0/0xc0 MARK xset 0x4/0xffffffff


/Solved with GID (Match correctly):

/iris:~# iptables -t mangle -L OUTPUT -v -n
Chain OUTPUT (policy ACCEPT 3538K packets, 216M bytes)
 pkts bytes target     prot opt in     out     source              
destination        
 1806  152K TOS        all  --  *      *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>          
owner GID match 1002 TOS set 0x40/0xc0


root@Firewall-2:~# iptables -t mangle -Z


1002:1002@iris//# ping -c 1 192.168.10.1


root@Firewall-2:~# iptables -t mangle -L PREROUTING -v -n
Chain PREROUTING (policy ACCEPT 7151 packets, 4273K bytes)
 pkts bytes target     prot opt in     out     source              
destination        
    1    84 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0x40/0xc0 MARK xset 0x2/0xffffffff
    0     0 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0x80/0xc0 MARK xset 0x3/0xffffffff
    0     0 MARK       all  --  eth0.0 *       0.0.0.0/0
<http://0.0.0.0/0>            0.0.0.0/0 <http://0.0.0.0/0>           tos
match 0xc0/0xc0 MARK xset 0x4/0xffffffff

/

Best regards,
vitry
