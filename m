From: Minh Cao <minhcao123@yahoo.com>
Subject: Iptables Rules
Date: Tue, 8 Apr 2008 15:01:12 -0700 (PDT)
Message-ID: <526636.41691.qm@web82601.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, 
Is that matter if I placed the options/extensions ( -m
and -p ) in different orders ? 

Please tell me these 4 configurations make any
difference ... in term allows ssh to my workstation. 


-A INPUT -s 1.2.3.0/24 -p tcp -m tcp --dport 22 -j
ACCEPT 


-A INPUT -s 1.2.3.0/24 -m tcp -p tcp --dport 22 -j
ACCEPT 


-A INPUT -s 1.2.3.0/24 -p tcp -m state --state NEW -m
tcp --dport 22 -j ACCEPT 


-A INPUT -s 1.2.3.0/24 -m state --state NEW -m tcp -p
tcp --dport 22 -j ACCEPT 


Thanks ! 



