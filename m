From: "Michael K" <micke@klintan.se>
Subject: RE: How filter IP address if it *changes* often?? (think dhcp)
Date: Fri, 28 Mar 2003 09:15:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2f502$2fe6a6a0$0200a8c0@klintan.local>
References: <20030327222617.A19911@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030327222617.A19911@spawar.navy.mil>
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

I'm using this in my script. The script runs _after_ the network script

EXTERNAL_IP=`ifconfig $EXTERNAL_INTERFACE | awk '/inet/ { print $2 }' |
awk -F "
But if your ip changes even when your computer is up, then this wont
work. Perhaps you could use the MAC-address match instead.

Here is the full config.

INTERNAL_INTERFACE='eth0'
EXTERNAL_INTERFACE='eth1'

INTERNAL_IP=`ifconfig $INTERNAL_INTERFACE | awk '/inet/ { print $2 }' |
awk -F "
INTERNAL_BROADCAST=`ifconfig $INTERNAL_INTERFACE | awk '/inet/ { print
$3 }' | a
INTERNAL_MASK=`ifconfig $INTERNAL_INTERFACE | awk '/inet/ { print $4 }'
| awk -F
INTERNAL_NETWORKID=`ipcalc -n $INTERNAL_IP $INTERNAL_MASK|awk -F "="
'{print $2}
INTERNAL_PREFIX=`ipcalc -p $INTERNAL_IP $INTERNAL_MASK |awk -F "="
'{print $2}'`
INTERNAL_NETWORK=$INTERNAL_IP/$INTERNAL_PREFIX

EXTERNAL_IP=`ifconfig $EXTERNAL_INTERFACE | awk '/inet/ { print $2 }' |
awk -F "
EXTERNAL_BROADCAST=`ifconfig $EXTERNAL_INTERFACE | awk '/inet/ { print
$3 }' | a
EXTERNAL_MASK=`ifconfig $EXTERNAL_INTERFACE | awk '/inet/ { print $4 }'
| awk -F
EXTERNAL_NETWORKID=`ipcalc -n $EXTERNAL_IP $EXTERNAL_MASK|awk -F "="
'{print $2}
EXTERNAL_PREFIX=`ipcalc -p $EXTERNAL_IP $EXTERNAL_MASK |awk -F "="
'{print $2}'`
EXTERNAL_NETWORK=$EXTERNAL_IP/$EXTERNAL_PREFIX
EXTERNAL_DNS=`grep nameserver /etc/resolv.conf|tail -n1|awk '{print
$2}'`

echo "    I N T E R N A L  C O N F I G"
echo "Internal Interface:   $INTERNAL_INTERFACE"
echo "Internal IP-address:  $INTERNAL_IP"
echo "Internal Networkmask: $INTERNAL_MASK"
echo "Internal Broadcast:   $INTERNAL_BROADCAST"
echo "Internal NetworkID:   $INTERNAL_NETWORKID"
echo "Internal Network:     $INTERNAL_NETWORK"

echo -e "\n"
echo "    E X T E R N A L  C O N F I G"
echo "External Interface:   $EXTERNAL_INTERFACE"
echo "External IP-address:  $EXTERNAL_IP"
echo "External Networkmask: $EXTERNAL_MASK"
echo "External Broadcast:   $EXTERNAL_BROADCAST"
echo "External NetworkID:   $EXTERNAL_NETWORKID"
echo "External Network:     $EXTERNAL_NETWORK"
echo "External NameServer:  $EXTERNAL_DNS"

/Klintan


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> seberino@spawar.navy.mil
> Sent: Friday, March 28, 2003 7:26 AM
> To: Steve Mickeler
> Cc: netfilter@lists.netfilter.org
> Subject: Re: How filter IP address if it *changes* often?? 
> (think dhcp)
> 
> 
> Steve
> 
> Thanks for the email.  Let me rerephrase my question.
> Perhaps I wasn't clear....
> 
> How can you have a rule on your INPUT chain that
> only allows your local box's IP address if "local box IP 
> address" can change without notice due to your DSL ISP's decision?
> 
> Chris
> 
> 
> On Thu, Mar 27, 2003 at 11:16:55PM -0500, Steve Mickeler wrote:
> > 
> > Thats what the INPUT and OUTPUT chains are for.
> > 
> > They are for packets destined to and orignated from the local box 
> > running iptables.
> > 
> > 
> > 
> > 
> > On Thu, 27 Mar 2003 seberino@spawar.navy.mil wrote:
> > 
> > > My iptables script filters incoming packets.
> > >
> > > One filter is whether the destination address is
> > > MY machine.
> > >
> > > How do this if IP address changes uncontrollably
> > > like with DHCP??
> > >
> > > Thanks,
> > >
> > > Chris
> > >
> > > --
> > > _______________________________________
> > >
> > > Dr. Christian Seberino
> > > SPAWAR Systems Center San Diego
> > > Code 2872
> > > 49258 Mills Street, Room 158
> > > San Diego, CA 92152-5385
> > > U.S.A.
> > >
> > > Phone: (619) 553-9973
> > > Fax:   (619) 553-6521
> > > Email: seberino@spawar.navy.mil 
> > > _______________________________________
> > >
> 
> -- 
> _______________________________________
> 
> Dr. Christian Seberino
> SPAWAR Systems Center San Diego
> Code 2872
> 49258 Mills Street, Room 158
> San Diego, CA 92152-5385
> U.S.A.
> 
> Phone: (619) 553-9973
> Fax:   (619) 553-6521
> Email: seberino@spawar.navy.mil 
> _______________________________________
> 
> 



