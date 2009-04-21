From: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Subject: traffic shaping documentation
Date: Tue, 21 Apr 2009 11:50:05 +0300
Message-ID: <49ED88BD.4070406@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I have a gateway on which I would like to implement traffic shapping based 
only on ports.
The simple schema:

     15-PCs-LAN <-> (eth0)[Gateway](eth1) <-> Internet

The gateway is also my workstation and it holds many services accessibles 
from the LAN and from Internet.

The problem is HTTP traffic is so much that SSH connection to the remote 
servers I manage are slow.

Therefore, I would like to give:
- highest priority to SSH (INPUT/OUTPUT/FORWARD dport 22)
- normal priority to others (INPUT/OUTPUT/FORWARD dport:FTP, SVN,...)
- lowest priority to HTTP
   (dport 80 REDIRECTed INPUT on squid's 3128, OUTPUT dport 80)

The perfect would be to shape it on the OUTPUT chain, because I would like 
also the shape affects my (Gateway) behaviour.

I am not asking for the direct solution, I am first asking if what I want:
  - is a good idea
  - implementable
  - is documented in another place than lartc.org
    (which is good but too much big for my simple needs)

Thank you for any tips.

-- 
                              Chef de projet chez Vectoris
                                  Phone: +261 33 11 207 36
System: xUbuntu 8.10 with almost all from package install
    http://www.google.com/search?q=mihamina+rakotomandimby
