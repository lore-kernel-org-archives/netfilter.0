From: Blesson Paul <blessonpaul@softhome.net>
Subject: Cable and ISDN connection
Date: Wed, 05 Feb 2003 11:33:15 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030205111632.00a301d0@mail.SoftHome.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
                 I am using NetFilter for connecting from the LAN to the 
Internet. We have a linux server and using the NAT(SNAT) feature and that 
linux server is the gateway. Presently we have cable connection. We need to 
have a backup method if the cable connection fails. For that we subscribed 
a ISDN connection.  Now these are some of our  requirements

1)   Is it possible to have both connection(Cable and ISDN) simultaneously 
and Netfilter diverts the traffic from the LAN through both 
ISDN            and Cable.

2)   If the above is not possible, is it possible to connect through ISDN 
is something goes wrong with Cable connection
        One problem here is that, for Cable connection, we have a constant 
IP address and for ISDN we have a dynamic address

                 Is any of the above possible with IP Tables

Blesson Paul,
Software Engineer,
Integrated Computing Environments Ltd,
Cochin Special Economic Zone,
Cochin - 682 030, India.
Tel: +91-484-2413 083(O),  +91-484-2413 096(O)
       +91-481-2380 893(R)



