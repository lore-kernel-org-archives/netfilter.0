From: "TestMail" <testmail@peterpaul.com.ph>
Subject: Re: masqued AND forwarded
Date: Thu, 27 Jan 2005 17:22:55 +0800
Message-ID: <018b01c50451$c87378c0$0200a8c0@etpi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: TestMail <testmail@peterpaul.com.ph>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Try this one :

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

 iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d $PUBLICIPADD \
   --dport 21 -j DNAT --to-destination $LOCALADDOFFTP

 iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $LOCALADDOFFTP
 \ --dport 21 -j ACCEPT


iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # This is
the stateful inspection command.

# It only allows in what you send out first.

Milo

----- Original Message -----
From: "TestMail" <testmail@peterpaul.com.ph>
To: <travis@visionsbeyond.com>
Sent: Thursday, January 27, 2005 05:15 PM
Subject: Re: masqued AND forwarded


> Try this one :
>
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
>
>  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d $PUBLICIPADD \
>    --dport 21 -j DNAT --to-destination $LOCALADDOFFTP
>
>  iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $LOCALADDOFFTP
>  \ --dport 21 -j ACCEPT
>
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # This
is
> the stateful inspection command.
>
> # It only allows in what you send out first.
>
> Milo
>
> ----- Original Message -----
> From: <travis@visionsbeyond.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, January 27, 2005 06:44 AM
> Subject: ftp: masqued AND forwarded
>
>
> > Hi all,
> >      I have spent several hours scouring the
> > archives trying to find out how to send external ftp requests to an
> > internal server while at the same time allowing clients behind the
> > firewall to access external ftp servers.  (currently requests from
> > internal clients to external ftp servers time out).
> >
> > Any suggestions would be greatly appreciated!
> >
> > Here are the rules that I have in place:
> >
> > #Load Modules
> > /sbin/modprobe ip_tables
> > /sbin/modprobe iptable_filter
> > /sbin/modprobe ip_conntrack
> > /sbin/modprobe ip_conntrack_ftp
> > /sbin/modprobe ip_nat_ftp
> >
> > #Send ftp to an internal machine
> > $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport
20
> > -j DNAT --to 192.168.2.5:20
> > $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 20 -j
> > ACCEPT
> > $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport
21
> > -j DNAT --to 192.168.2.5:21
> > $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 21 -j
> > ACCEPT
> >
> > #Masquerade internal connections going out.
> > $IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE
> >
> >
> > $MYADDR is the firewall external address
> > $EXTERNALIF is the external interface (eth0)
> > $INTERNALIF is the internal interface (eth1)
> >
> > My apologies if this question has already been answered (probable) and
ask
> > forgiveness for my lack of being able to find it.
> >
> > Travis Crook
> > Visions Beyond
>



