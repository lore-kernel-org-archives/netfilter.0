From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Internal ip exiting network on firewall external nic despight
 rule
Date: Sat, 21 Sep 2002 15:01:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8C6D95.1070308@fugmann.dhs.org>
References: <000101c260f4$c5861260$0801a8c0@s3ac>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Rowan Reid <rreid@studio3arc.com>
Cc: netfilter@lists.netfilter.org

Rowan Reid wrote:
> Since I'm cheap I don=92t want to purchase another hub, I have my T1,
> connected to a hub with my Firewall extif, my VPN extif and the hub is
> connected to my switch this allows my to access the net directly and
> through the firewall from my station, this is for diagnostic purposes s=
o
> I don=92t have to play cable switcher.=20
I really do not understand why you do not want all traffic to go through =

your firewall. A firewall is supposed to shield off any unwanted traffic =

to ever enter the internal network, which is only accomplised, if all=20
traffic _must_ go through the firewall.

This could be accomplished simply by connecting your external interface=20
on the firewall directly to the T1 entry point, and the switch/hub to=20
the internal network interface.

The "diagnostic purposes" you are talking about are rendered useless=20
with the configuraion you are describing - not to mention the _serious_=20
degradation of your network.

Regards
Anders Fugmann



