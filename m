From: "Arthur DiSegna" <adisegna@authentium.com>
Subject: RE: First rule in the list seems to allow everything?
Date: Wed, 25 Jan 2006 12:13:12 -0500
Message-ID: <B584AAC32ED8DE49A8EAD2CF3D847FE0022255DD@auth-fl-mail1.commandsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Cancel my last. The output below is from my other test firewall.=20

The actual output from the firewall in question of the iptables -nvL
command does in fact show the accept all rule for the loopback addresss
only.

Thank you.

 pkts bytes target     prot opt in     out     source
destination
   32  1600 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
	RULES
	MORE RULES


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Arthur
DiSegna
Sent: Wednesday, January 25, 2006 12:07 PM
To: netfilter@lists.netfilter.org
Subject: RE: First rule in the list seems to allow everything?

iptables -nvL output

Chain INPUT (policy ACCEPT 214K packets, 11M bytes)
 pkts bytes target     prot opt in     out     source
destination                                             =20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination                                             =20

Chain OUTPUT (policy ACCEPT 195K packets, 356M bytes)
 pkts bytes target     prot opt in     out     source
destination     =20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob
Sterenborg
Sent: Wednesday, January 25, 2006 10:09 AM
To: netfilter@lists.netfilter.org
Subject: Re: First rule in the list seems to allow everything?

On Wed, January 25, 2006 15:58, Arthur DiSegna wrote:
>
>
> Hello,
>
> I set my IPTABLES policy to clear all rules and then drop everything=20
> before defining a policy. I suspect this is the default procedure=20
> everyone uses from the looks of the web. Anwyay, when I run iptables=20
> -L -n the first line reads:
>
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> RULES      --------			---	------
> RULES      --------			---	------
>
> Doing an nmap scan on the box only shows the open ports I specified in

> the ruleset. This is good. However, the Accept all above in the first=20
> line has me a little confused. What is happening here?

Try listing the rules with :
iptables -nvL


Gr,
Rob







