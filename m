From: "Christian Gmeiner" <christian@visual-page.de>
Subject: Re: Problem with passiv FTP
Date: Wed, 25 Feb 2004 22:56:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c3fbea$307db690$0600a8c0@blackbox>
References: <7C9884991ADAE0479C14F10C858BCDF567918C@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Daniel Chemko" <dchemko@smgtec.com>
To: "Christian Gmeiner" <christian@visual-page.de>;
<netfilter@lists.netfilter.org>
Sent: Wednesday, February 25, 2004 10:31 PM
Subject: RE: Problem with passiv FTP


>
> Run these shell commands at boot, or any time before you want FTP to
> work properly
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
>
> For the an FTP server on the firewall itself, use
> # Allow anyone to inbound to the FTP server
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> # ALWAYS HAVE THIS RULE & FIRST IN LIST
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> For machines behind your firewall connecting to the internet, use
> # You should tighten up this rule a bit specifying -i
> <internal_interface_address> as well as the following
> iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
> # ALWAYS HAVE THIS RULE & FIRST IN LIST
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> For internet clients connecting to an internal server, use
> # This forwards the FTP request to the right internal FTP server
> iptables -t nat -A PREROUTING --destination
> <external_ftp_address> -p tcp --dport 21 -j DNAT --to
> <internal_ftp_server>
> # Allow traffic to DNAT'd IP address
> iptables -A FORWARD --destination <internal_ftp_server> -p tcp
> --dport 21 -j ACCEPT
> # ALWAYS HAVE THIS RULE & FIRST IN LIST
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> That is all!

I have chaned my ftp rules now to:
     # Port 21
    iptables -A INPUT     -p tcp --sport 21 -m state --state ESTABLISHED -j
ACCEPT
    #iptables -A OUTPUT -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT

    # aktiv - works
    iptables -A INPUT     -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
    #iptables -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j
ACCEPT

    # passiv
    iptables -A INPUT     -p tcp --sport ${UNPRIVPORTS} --dport
${UNPRIVPORTS}  -m state --state ESTABLISHED -j ACCEPT
    #iptables -A OUTPUT -p tcp --sport ${UNPRIVPORTS} --dport
{UNPRIVPORTS}  -m state --state ESTABLISHED,RELATED -j ACCEPT


    iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

And active and passive ftp works :)


This rule allows all connections on every protocol and port., if the
connections was made bevore or it is related to an
other allows port. is this correct?
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Thanks, Christian Gmeiner
>
> PS: Never fck around with OUTPUT unless you're a pro.
> FORWARD goes through the firewall INPUT/OUTPUT are just for local
> firewall PC connections.
>
>
> Christian Gmeiner wrote:
> > Hi people.
> >
> > I got active FTP working, but i also need the passive one.
> >
> > Here is my stuff:
> >
> >     # Port 21
> >
> >     iptables -A INPUT     -p tcp --sport 21 -m state --state
> >     ESTABLISHED -j ACCEPT iptables -A OUTPUT -p tcp --dport 21 -m
> > state --state NEW,ESTABLISHED -j ACCEPT
> >
> >     # aktiv - works
> >     iptables -A INPUT     -p tcp --sport 20 -m state --state
> >     ESTABLISHED,RELATED -j ACCEPT iptables -A OUTPUT -p tcp --dport
> > 20 -m state --state ESTABLISHED -j ACCEPT
> >
> >     # passiv
> >     iptables -A INPUT     -p tcp --sport ${UNPRIVPORTS} --dport
> >     ${UNPRIVPORTS}  -m state --state ESTABLISHED -j ACCEPT iptables
> > -A OUTPUT -p tcp --sport ${UNPRIVPORTS} --dport ${UNPRIVPORTS}  -m
> > state --state ESTABLISHED,RELATED -j ACCEPT
> >
> > I have everything set to drop and i am alowing this protocols and
> > ports:
> >
> > # TCP in+out
> > #
> > #
> > TCP_IN_OUT="ssh"
> >
> > # TCP out
> > #
> > # 5190 = ICQ
> > #
> > TCP_OUT="5190 http https 25 ftp ftp-data pop3 smtp"
> >
> > # TCP in
> > #
> > TCP_IN=""
> >
> > # UDP in+out
> > #
> > UDP_IN_OUT="domain ssh"
> >
> > # UDP out
> > #
> > #
> > UDP_OUT="https"
> >
> > # UDP in
> > #
> > UDP_IN=""
> >
> > UNPRIVPORTS="1024:65535"
> >
> > So.. i must now allow the UNPRIVPORTS, but how i am doing this?
> >
> > Thanks, Christian Gmeiner
>



