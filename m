From: SaVaGE  <pc-secure@home.nl>
Subject: Re: How to block a range of IPs?
Date: Mon, 28 Apr 2003 19:52:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304281952.37671.pc-secure@home.nl>
References: <20030427140602.30833.28944.Mailman@kashyyyk> <1051546485.1427.7.camel@jasiiitosh.nexusmgmt.com> <200304281941.38386.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304281941.38386.pc-secure@home.nl>
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

Op maandag 28 april 2003 19:41, schreef u:
> Op maandag 28 april 2003 18:14, schreef John A. Sullivan III:
> > You can  use the tool at http://subnetcreator.sourceforge.net/ to eas=
ily
> > determine which subnets are contained in your IP address range.  The
> > same logic is being built into the iptables+ management tool being
> > developed in http://iscs.sourceforge.net/ .  However,even better,it
> > appears there is a patch available in patch-o-matic that allows one t=
o
> > enter a range directly in iptables.  I haven't tried it yet but hope =
to
> > do so soon to replace that logic in ISCS.  Good luck - John
> >
> > On Sun, 2003-04-27 at 10:06, netfilter-request@lists.netfilter.org
> >
> > wrote:
> > > --__--__--
> > >
> > > Message: 4
> > > From: "Afshin Lamei" <linux_st@hotmail.com>
> > > To: netfilter@lists.netfilter.org
> > > Subject: How to block a range of IPs?
> > > Date: Sun, 27 Apr 2003 10:41:54 +0430
> > >
> > > Hi,
> > > How can I write a rule for a custom range of IPs? for example, I wa=
nt
> > > to block every WWW packet incoming from eth1, which source is an IP
> > > between 192.168.1.10 and 192.168.1.20.
> > > please help me writing an example.
> > > thank you
> > > afshin
> > >
> > >
> > >
> > >
> > >
> > > _________________________________________________________________
> > > Help STOP SPAM with the new MSN 8 and get 2 months FREE*
> > > http://join.msn.com/?page=3Dfeatures/junkmail
>
> AT_HOME_RANGE=3D"213.51.16.0/21 213.51.24.0/21"
>
>  ${ECHO} -n "Drop and log @HOME_USERS in range: "
>     for athomerange in ${AT_HOME_RANGE} ; do
>            ${IPTABLES} -A INPUT -i ${EXT_INTERFACE} -s ${athomerange} -=
m
> limit \
>                -j LOG --log-prefix "@HOME_USER:DROP "
>           ${IPTABLES} -A @HOME_CHK -i ${EXT_INTERFACE} -s ${athomerange=
} -j
> DROP
>         ${ECHO} -n "${athomerange} "
>   done
>
> this is an example off a line i use  , if you wish to have more ranges,=
 you
> have to make a new rule like this ,but another name like "AT_HOME_RANGE=
2"
>
> good luck
>
> Pascal (PC-Secure)



so in your picture it would be like this ::


EXT_INTERFACE=3D"eth1"
IPTABLES=3D"/usr/bin/iptables
AT_HOME_RANGE=3D"192.168.1.10/24 192.168.1.20/24"

 ${ECHO} -n "Drop and log @HOME_USERS in range: "
    for athomerange in ${AT_HOME_RANGE} ; do
            ${IPTABLES} -A INPUT -i ${EXT_INTERFACE} -s ${athomerange} -m
 limit \
                -j LOG --log-prefix "@HOME_USER:DROP "
           ${IPTABLES} -A INPUT -i ${EXT_INTERFACE} -s ${athomerange} -j
 DROP
         ${ECHO} -n "${athomerange} "
   done

ready and go

Pascal (PC-Secure)

