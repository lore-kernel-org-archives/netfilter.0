From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IPTBLE rule for Slapper" Linux Worm
Date: Fri, 20 Sep 2002 00:44:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209200044.24379.netfilter@newkirk.us>
References: <00cf01c26051$9a2a5c00$0200000a@ramasamy>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00cf01c26051$9a2a5c00$0200000a@ramasamy>
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
To: netfilter@lists.samba.org

On Thursday 19 September 2002 10:56 pm, Sundaram wrote:
> What is the IP rule, I have set for following worm??
>
>
> Security Alert: Eradicating the "Slapper" Linux Worm
>
> http://www.extremetech.com/article2/0,3973,538734,00.asp

(rules example below)
Inbound 443 is the most useful of these, IF you can do it, since the othe=
rs depend
on the machine already being infected, which you can easily and quickly d=
etermine
yourself just after you start blocking inbound port 443, the infection ve=
ctor.
Just "ls -a /tmp" and make sure there's no ".bugtraq" or ".bugtraq.c" the=
re.
If they are you're already infected.

ExtremeTech tells us:
   Delete the files if they are already present. Do "mkdir -m a=3D /tmp/.=
bugtraq" and=20
   "mkdir -m a=3D /tmp/.bugtraq.c", then reboot if you were already infec=
ted. =20
   The permissionless directories prevent an incoming infection from taki=
ng up residence.=20

They fails to mention that three seconds with an editor will create a ver=
sion that=20
saves itself under different names, but still partakes of the same DDoS n=
etwork.

(Symantec tells us: * Run LiveUpdate, which is the easiest way to obtain =
virus definitions :^)

If we want to be helpful, we can log any attempt to connect to us on UDP =
2002,
meaning the source is infected and thinks we are/were, and notify those s=
ervers
that they appear to be infected.


# Block "Linux.Slapper.Worm" or "apache/mod_ssl worm"
#
# log & drop any inbound packets for UDP port 2002,=20
# prevents already infected system receiving instructions.
# this should only happen if we are/were infected.
# If we're feeling charitable, let the source of any 2002
# packets know that they are probably infected as well.  :^)
/sbin/iptables -A INPUT -p UDP --dport 2002 -j LOG
/sbin/iptables -A INPUT -p UDP --dport 2002 -j DROP
#
# Block inbound port 443 (Infection point) ONLY if you don't
# need to serve HTTPS from machine.
/sbin/iptables -A INPUT -p TCP --dport 443 REJECT
#
# Block outbound port 443 ONLY if you don't need to browse=20
# to HTTPS from this machine.
# This blocks an already infected system from propogating.
/sbin/iptables -A OUTPUT -p TCP --dport 443 -j REJECT
#

# j

