From: Rakotomandimby Mihamina <mihamina@gulfsat.mg>
Subject: force a MAC to have one IP
Date: Thu, 05 Nov 2009 07:06:46 +0300
Message-ID: <4AF24F56.6010308@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all

On our LAN, we have a DHCP server that offers fixed IPs to some MACs.
(We dont use such solutions as NuFW yet)

We would like to ensure one IP adress is used by the assigned MAC.
(QoS matter)

Is this a good enough solution:
-A INPUT   -m mac --mac-source 00:15:C5:F4:29:7C -s ! 192.168.1.13 -j REJECT
-A FORWARD -m mac --mac-source 00:15:C5:F4:29:7C -s ! 192.168.1.13 -j REJECT

Is there any better one?

-- 
        Architecte Informatique chez Blueline/Gulfsat:
    Administration Systeme, Recherche & Developpement
                                    +261 33 11 207 36
