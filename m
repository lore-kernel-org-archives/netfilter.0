From: "GoMi" <gomi@perezoso.net>
Subject: RV: Changing the amount of tokens in the conntrack
Date: Tue, 28 Oct 2003 12:21:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAdMZbo8ar0EerVxNjQLkOigEAAAAA@perezoso.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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



-----Mensaje original-----
De: GoMi [mailto:gomi@arrakis.es] 
Enviado el: martes, 28 de octubre de 2003 12:21
Para: 'netfilter@lists.netfilter.org'
Asunto: Changing the amount of tokens in the conntrack


Hi there, its my first email to the list, so i will explan a little bit
my setup:

I have a linux box with 1GB RAM Athlon 1.8GHz and 3 eth cards.


                        ______
                 eth2  |      |eth0
LAN (300 users) <----->|      |<--->ADSL 2Mbit
                       |      |<--->ADSL 2MBit
                       |______|eth1

I am doing load balancing at the moment, but thats nothing to worry
about since it works great. I am also using a QoS setup based on HTB and
SFQ queues, and due to the load balancing i have a stateful firewall. 

Some aplications my users use quite often, like msn messenger, kazaa or
other p2p automatically disconnects themselves. I have comed to the
conclusion thats because of the amount of simultaneous connections the
box can handle. So i want to change the amount of tokens the conntrack
is using.

I have the conntrack module built-in the kernel, hence i am driving
myself mad to find a way to increase this value. Does anybody knows how
to change that?

Thank you very much,in advanced. If any of you knows anything i could
change as well to improve my setup, i am welcome to suggestions



