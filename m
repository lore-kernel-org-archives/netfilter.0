From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: iptables and the  RELATED option
Date: Wed, 13 Aug 2003 10:46:57 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <033101c361a1$5d33ca50$49caa8c0@caris.priv>
References: <01f801c36103$00a67150$49caa8c0@caris.priv> <1060723749.3781.77.camel@vimes.localdomain>
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
To: Rob Verduijn <rverduij@dds.nl>, netfilter@lists.netfilter.org

Thanks for the help.  I guess I just needed to add the ip_contrack_ftp
module.  After that, every thing worked great.


----- Original Message -----
From: "Rob Verduijn" <rverduij@dds.nl>
To: <netfilter@lists.netfilter.org>
Cc: <peter.marshall@caris.com>
Sent: Tuesday, August 12, 2003 6:29 PM
Subject: Re: iptables and the RELATED option


> Hi there,
>
> The description is a bit vague...
>
> But I assume you have a machine with more than 1 network card
> Let's say you got 2
>
> You need the established and the related for ip connection tracking
> If you would use a script like the one below asuming eth2 is the
> external ontrusted network card
>
> Have a look at this example using connection tracking
>
>
> modprobe ip_conntrack_ftp # load ftp conntracking module
> IPTABLES="/path/to/iptables"
> INTERNAL_INT="eth?" # your thrusted network interface
> INTERNAL_IPADDR="1.2.3.4" # internal network card ip
> INTERNAL_NETWORK="10.0.0.0/255.0.0.0 #your internal thrusted network
> EXTERNAL_INT="eth?" # untrusted network card
> EXTERNAL_IPADDR="1.2.3.4" # untrusted network card ip
>
> UNPRIVPORTS="1024:65535"                # unprivileged port range
>
> # wipe old chains and erase personal created chains
> CHAINS=`cat /proc/net/ip_tables_names 2>/dev/null`
> for I in $CHAINS; do $IPTABLES -t $I -F; done
> for I in $CHAINS; do $IPTABLES -t $I -X; done
>
> # set policy to drop
> $IPTABLES -t filter -P INPUT DROP
> $IPTABLES -t filter -P OUTPUT DROP
> $IPTABLES -t filter -P FORWARD DROP
>
> # accept local traffic
> $IPTABLES -A INPUT -i lo -d 127.0.0.1 -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT
>
> # turn on connection tracking and some logging
> $IPTABLES -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A INPUT -m state --state INVALID -j LOG \
>         --log-prefix "INVALID input: "
> $IPTABLES -A INPUT -m state --state INVALID -j DROP
> $IPTABLES -A OUTPUT -m state --state INVALID -j LOG \
>         --log-prefix "INVALID ouput: "
> $IPTABLES -A FORWARD -i $INTERNAL_INT -m state --state INVALID -j DROP
> $IPTABLES -A FORWARD -i $INTERNAL_INT -m state --state INVALID -j LOG \
>         --log-prefix "INVALID ouput: "
>
> # allow all traffice from internal over internal interface
> # to external interface
> $IPTABLES -A FORWARD -i $INTERNAL_INT -s $INTERNAL_NETWORK \
>         -m state --state NEW -j ACCEPT
>
> # above script allows all traffic from internal network to the
> # external network and answers to that traffic
> # including ftp
> # no traffic is allowed from the external network to the gateway
> # no traffic is allowed from the external network to the internal
> # network
> # no traffic is allowed from the internal network to the gateway
> # no traffic is allowed from the gateway to the internal network
> # no traffic is allowed from the gateway to the internet
> # in other words a pretty restricted ruleset
>
> # if you want traffic from and to the gateway a examples (ssh) below
>
> # allow ssh traffic from thrusted network towards gateway
> # you can even be more restrictive by replacing the network with
> # a single ip address.
> $IPTABLES -A INPUT -i $INTERNAL_INT -p tcp \
>         -s $INTERNAL_NETWORK --sport $UNPRIVPORTS \
>         -d $INTERNAL_IPADDR --dport 22 \
>         -m state --state NEW -j ACCEPT
>
> # or an ftp (client) example :-P
> # gateway is the ftp client here
> # remember ftp == very unsecure protocol
> $IPTABLES -A OUTPUT -0 $EXTERNAL_INT -p tcp \
> --sport $UNPRIVPORTS \
> -d $EXTERNAL_IPADDR -dport 21 \
> -m state --state NEW -j ACCEPT
>
>
> # or an ftp (server) example :-P
> # gateway is the server here
> # remember ftp == very unsecure protocol
> # consider sftp uses the same ruleset as ssh (yup same port number)
> # or else try scp , comes free with openssh as does sftp
> $IPTABLES -A INPUT -i $EXTERNAL_INT -p tcp \
> --sport $UNPRIVPORTS \
> -d $EXTERNAL_IPADDR -dport 21 \
> -m state --state NEW -j ACCEPT
>
> # compare the client and server examples ....see something
> # oddly repetetive  ;)
>
> # end script
>
> Well that's it,nothing fancy no special things no tricks against
> portscanners.
> Just something that keeps out most basic bad things from the internet.
>
> Regards
> Rob
>
>
>
> On Tue, 2003-08-12 at 20:53, Peter Marshall wrote:
> > Hi, My name is Peter Marshall.  I am having some problems letting ftp
> > through my firewall without opening all of the ports.  I was trying to
get
> > RELATED to work, but for some reason it will not.  Here is an example of
> > what my file looks like
> >
> > $TABLENAME -A FORWARD -d x.x.x.x -o eth2 -j mychain
> >
> > $TABLENAME -A mychain -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $TABLENAME -A mychain -j DROP
> >
> > I don't think I need the ESTABLISHED, but I put it in anyways.
> >
> > If anyone could help it would be greatly appriciated.
> >
> > Thanks
> >
> >
> > Peter Marshall
> > PS.  Sorry if te message appears twice.  I sent it the first tiem before
I
> > became a member
> >
> >
>


