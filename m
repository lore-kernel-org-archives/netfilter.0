From: <david@suarapembaruan.co.id>
Subject: iptables for backup connection
Date: Mon, 14 Jun 2004 16:56:44 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1171.172.16.128.100.1087207004.squirrel@mail.suarapembaruan.co.id>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,
In my office i using 2 connection (Wireless connection direct to ISP "A"
and backup connection to ISP "B" with ADSL Modem), how to configure Linux
iptables (gateway) so when connection to ISP "A" down client can still
work with ISP "B" without reconfiguration at client computer (see network
diagram B).


Network diagram "A" (current)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

     ISP "A"
       :
       :
       :
       \/
:-----------------:
:LINUX ROUTER/GW  :
:eth0 202.x.x.1   :
:eth1 172.16.x.100:
:-----------------:
       /\
       :
       :
       \/
:-----------------:
:Client computer's:
:-----------------:
       /\
       :
       :
       \/
:--------------------:
:ADSL MODEM/ROUTER/GW:
:eth0 Dynamic        :
:eth1 172.16.x.200   :
:--------------------:
       /\
       :
       :
     ISP "B"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Network Diagram "B"

     ISP "A"                   ISP "B"
       :                          :
       :                          :
       :                          :
       \/                         \/
:-----------------:        :-----------------:
:LINUX ROUTER     :        :ADSL MODEM/ROUTER:
:eth0 202.x.x.1   :        :eth0 Dynamic     :
:eth1 172.16.x.100:        :eth1 172.16.x.200:
:-----------------:        :-----------------:
        :                           :
        :                           :
        :                           :
        -----------------------------
                     :
                     :
                     :
            :-----------------:
            :LINUX GATEWAY    :
            :eth0 172.16.x.1  :
            :-----------------:
                     :
                     :
                     :
              Client Computer's

Regards,
David Kandou






















