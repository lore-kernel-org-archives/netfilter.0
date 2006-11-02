From: <anisha.chandrasekaran@wipro.com>
Subject: RE: RE: INPUT and PORTS
Date: Thu, 2 Nov 2006 08:53:22 +0530
Message-ID: <2FEE63312285CF428A8480B07AC1C359037A1A5E@CHN-SNR-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: devnull@plugthebox.net, bimal_pandit@rediffmail.com
Cc: netfilter@lists.netfilter.org


I dunno much on this but I could jus help with what I know.

If the 30 ports involve consecutive numbers you could specify it as a
range, say, 10-30.

However if the all the ports are scattered and varied numbers then you
can create a user defined chain which accepts all the port numbers (use
multiport option.Then specify this chain as target when you add a rule
in FORWARD chain. Thereafter you need to specify that list of ports just
once in the user defined chain.

I think this may be helpful but I am not sure if this will suffice your
requirement.

=0D
 Regards,

Anisha Chandrasekaran
=0D
 =0D
        =0D

-----Original Message-----
From: plugthebox.net /dev/null [mailto:devnull@plugthebox.net]=0D
Sent: Wednesday, November 01, 2006 8:57 PM
To: bimal pandit
Cc: netfilter@lists.netfilter.org; Anisha Chandrasekaran (WT01 -
Broadband Networks)
Subject: Re: RE: INPUT and PORTS

I want to thank you all for contributing.=0D

I'm currently setting up a firewall and a web interface for it. My
strategy is to have:

/sbin/iptables -P INPUT -j DROP
/sbin/iptables -P FORWARD -j DROP
/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -d 10.2.2.116 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.116 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.116 -j ACCEPT
/sbin/iptables -A FORWARD -d 10.2.2.117 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.117 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.117 -j ACCEPT
etc...
/sbin/iptables -A INPUT -j DROP
/sbin/iptables -A FORWARD -j DROP

Meaning, i want to accept the connections from these 3 IPs, and drop all
the rest. Now i want to let those allowed IPs to only use 3 ports for
the INPUT and more than 30 ports for FORWARDs (p2p and misc ports).

I can't use -m multiport for each FORWARD, there are too many ports that
1 FORWARD line can run.=0D

I thought by allowing the ports BEFORE the IPs, that it would accept
allow only the ports ACCEPTed to the IPs ACCEPTed, is that correct?

thanks,
Sincerely,

On Wed, 2006-11-01 at 14:57 +0000, bimal pandit wrote:
> Dear All,
>=0D
>=0D
> On Wed, 01 Nov 2006 anisha.chandrasekaran@wipro.com wrote :
> >
> >I would like to have a little more clear idea on what you need to do
> >exactly????
> >
> >That is, DO you need to allow only 80 and 20 ports from the specified
> >ip?
> >In that case you can have
> >Iptables -P FORWARD DROP
> >Iptables -A FORWARD -p tcp -s 10.2.2.115 -m multiport --dports 80,22
> -j
> >ACCEPT
> >
> >The above rule will allow only 80 and 22 requests from that ip. Is
> this
> >clear or am I not answering what you are asking????
> >
> >
> >  Regards,
> >
> >Anisha Chandrasekaran
> >
> >
> >
> >-----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> >[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> >plugthebox.net /dev/null
> >Sent: Wednesday, November 01, 2006 6:19 PM
> >To: netfilter
> >Subject: INPUT and PORTS
> >
> >Hello,
> >I want to do the following, accept in comings from 10.2.2.115 only
> >restricting to port 80,22
> >
> >is this correct?
> >
> >-P rules ...
> >-F rules ...
> >/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j ACCEPT
> >/sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT
> >
> >Eventhough i saw this setup in many tutorials/howtos,  when ever i
> want
> >to block 10.2.2.115 (by not listing him in the INPUT -j ACCEPT), that
> ip
> >can still connect to port 80 and 22.
> >
> >
> >
> >Thanks
> >Sincerely,
> >
> >
> in my view, since you have already accepted all the connections from
> 10.2.2.115, so there is no question of blocking it as iptables work on
> "FIRST MATCH FOUND".
>=0D
> regards,
>=0D
> Bimal Pandit
>=0D
>=0D
>=0D
>=0D



The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and=
 may contain proprietary, confidential or privileged information. If you=
 are not the intended recipient, you should not disseminate, distribute or=
 copy this e-mail. Please notify the sender immediately and destroy all=
 copies of this message and any attachments.=0D

WARNING: Computer viruses can be transmitted via email. The recipient=
 should check this email and any attachments for the presence of viruses.=
 The company accepts no liability for any damage caused by any virus=
 transmitted by this email.
=0D
www.wipro.com

