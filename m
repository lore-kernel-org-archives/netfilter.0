From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: Changing the amount of tokens in the conntrack
Date: Fri, 31 Oct 2003 16:43:52 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01b701c39f8b$1cc21da0$de0018ac@admin.monash.edu.my>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAdMZbo8ar0EerVxNjQLkOigEAAAAA@perezoso.net>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAdMZbo8ar0EerVxNjQLkOigEAAAAA@perezoso.net>
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

This was answered by a previous thread not to long ago.

>>Security <security@ezsm.net> wrote: 

Your max setting on the conntrack table can be seen at:
> cat /proc/sys/net/ipv4/ip_conntrack_max
> 
> Your current number of entries in the conntrack table can
> be found like this:
> cat /proc/net/ip_conntrack | wc -l
> 
> Now, you have 2 choices on how to sort this out...
> 
> 1) raise the limit in /proc/net/ip_conntrack
> To raise that limit:
> echo ## > /proc/net/ip_conntrack 
> (where ## is the new max you wish to set).


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of GoMi
Sent: Tuesday, October 28, 2003 7:22 PM
To: netfilter@lists.netfilter.org
Subject: RV: Changing the amount of tokens in the conntrack



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



