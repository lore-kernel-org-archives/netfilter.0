From: Patrick Maartense <patrick@patrick.at>
Subject: Re: Port forward
Date: Tue, 04 Feb 2003 14:28:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3FC012.4EAA11E@patrick.at>
References: <D007132BBC42D5118FD20002A52844414BCF31@ASC01>
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
Content-Type: text/plain; charset="iso-8859-1"
To: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>
Cc: 'Eugene Joubert' <eugenej@centratel.co.za>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

do you have MASQERADE out aktive?

for the mailserver the traffic seems to come from the internet , remeber
that yout FW needs masquerading to be aktive and the gateway of your
mailserver needs to be
the firewall



ASC - Ronald Roeleveld wrote:

>  Thanks a lot everyone for the emails...I did iptables -t nat --list
> and it now gives me this output:DNAT       tcp  --
> anywhere             anywhere           tcp dpt:smtp
> to:192.168.22.6:25But when I tried to telnet from another machine to
> 192.168.22.5 port 25 (the ip of the netfilter firewall/router) it
> didn't work at all..Do there has to be a line somewhere that says it's
> allowed to forward these connections?Regards,Ronald.
>
>      -----Original Message-----
>      From: Eugene Joubert [mailto:eugenej@centratel.co.za]
>      Sent: dinsdag 4 februari 2003 11:41
>      To: 'ASC - Ronald Roeleveld';
>      Subject: RE: Port forward
>
>      remember that you are using DNAT so you would have to
>      specify the -t nat switch in your line.eg iptables -t nat -A
>      PREROUTING -p tcp -s 0/0 --dport 25 -i eth0 -j DNAT --to
>      192.168.22.6:25Hope this helps
>
>           -----Original Message-----
>           From: ASC - Ronald Roeleveld
>           [mailto:r.roeleveld@ascinternational.nl]
>           Sent: 04 02 2003 12:31 PM
>           To: 'netfilter@lists.netfilter.org'
>           Subject: Port forward
>
>           Hi all,Iam trying to set up a port forward for
>           several hours now, but I don't seem to get it
>           working right.When I type the following
>           command:iptables -A PREROUTING -p tcp
>           --destination-port 25 -i eth0 -j DNAT
>           --to-destination 192.168.22.6:25I get this
>           output:iptables: Invalid argumentI did do iptables
>           -X PREROUTING so the chain does exist.Can anyone
>           please help me out..What I want is that all
>           incoming connections on eth0 on port 25 are routed
>           to another machine on the internal network
>           192.168.22.6Thanks in advance,Ronald Roeleveld
>           System Administrator
>
>           ASCINTERNATIONAL
>           Vlietweg 17c, 2266 KA, Leidschendam, The
>           Netherlands
>           Tel. +31 (0)70 3178400, Fax +31 (0)70 3204760
>           E-mail: r.roeleveld@ascinternational.nl, Website:
>           http://www.ascinternational.nl
>
--
-------------------------------------------------------------
Computer Service B=FCro ENTER
Patrick Maartense                 Tel:        +43  2236 42761
am Steinfeld 19a                  FAX:        +43 2236 893970
A-2344 Maria Enzersdorf           Mobil:      +43 664 4200656

e-mail: office@csbenter.at                 patrick@patrick.at
http://www.csbenter.at
-------------------------------------------------------------



