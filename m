From: "Brent Clark" <bclark@eccotours.biz>
Subject: RE: Ruleset
Date: Tue, 10 Aug 2004 11:15:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIKEAKCHAA.bclark@eccotours.biz>
References: <200408100945.18144.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408100945.18144.Antony@Soft-Solutions.co.uk>
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
To: iptables <netfilter@lists.netfilter.org>

Once again, thanks Anthony

Correcting my mistakes right now

Kind Regards
Brent Clark

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Tuesday, August 10, 2004 10:45 AM
To: iptables
Subject: Re: Ruleset


On Tuesday 10 August 2004 9:27 am, Antony Stone wrote:

> On Tuesday 10 August 2004 8:22 am, Brent Clark wrote:
> > Hi all
> >
> > If possible would someone be so kind as to have a look at my ruleset and
> > if possible, share some pointers.  I have another linux box (Ip address
> > 192.168.3.3, connected to eth1 on the FW)  I have a lan (192.168.2.0/24)
> > connected to eth0 For my internet handling I have a ppp connection.  Im
> > also currently toying with dyndns (ez-ipupdate).
>
> 4. Do you *really* want to allow *all* NEW packets from the Internet to
the
> DMZ, no matter what protocol they are?   You might as well simply stick
> your 192.168.3.3 machine on a public IP address with no firewall....

The above comment is not quite accurate - you are, of course, only DNATting
packets to TCP port 80, therefore only HTTP should get through to the DMZ,
however I would still recommend narrowing down the FORWARD rule just to make
it obvious that's what's happening when you look at the filter rules, rather
than having to refer to the nat rules to figure out what traffic is being
allowed.

In other words, make the ruleset slightly more obvious, so you don't make
the
same mistake I did, when you come to read the ruleset in 3 months' time :)

Regards,

Antony.

--
People who use Microsoft software should be certified.

                                                     Please reply to the
list;
                                                           please don't CC
me.




