From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: RE: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 16:46:46 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFAE965A@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>, netfilter@lists.netfilter.org

Hi,

Is this the way it should be in iptables?

#Open SNMP Ports
$IPTABLES -A INPUT -p udp -m udp --dport 161 -j ACCEPT

Have tried it, not working

Thanks.=20
Gy

-----Original Message-----
From: Daniel F. Chief Security Engineer -
[mailto:danielf@supportteam.net]=20
Sent: Wednesday, January 07, 2004 4:45 PM
To: Gilles Yue; netfilter@lists.netfilter.org
Subject: Re: MRTG and IPTABLES

SNMP UDP Ports 161 and 162 MRTG typically only uses 161.=20


Thanks

On Wednesday 07 January 2004 00:54, Gilles Yue wrote:
> MRTG cannot work properly due to iptables running.
>
>
>
> Anybody knows which port number to open to enable MRTG to work
properly.
>
>
>
> Thanks.
>
>
>
> Rgds
>
> gy

--=20
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter
how=20
close you get to nothing.

