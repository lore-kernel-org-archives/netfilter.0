From: "lee Leahu " <lee@ricis.com>
Subject: Re: iptables and mtu
Date: Mon, 10 Jun 2002 14:58:32 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101458.AA13435028@imail.ricis.com>
Reply-To: <lee@ricis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org, J=?ISO-8859-1?Q?=F6?=rgen Danielsson <jorgen_d@yahoo.com>


hi, i solved this on my adsl conn and i thought you could use it.


iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to=
-pmtu



basically what this command does, is tell everyone to *NERVER* send any pac=
ket with mtu size larger than it can support.


---------- Original Message ----------------------------------
From: "J=F6rgen" Danielsson <jorgen_d@yahoo.com>
Date:  Mon, 10 Jun 2002 12:49:25 -0700 (PDT)

>
>
>> What is the MTU on the firewall interface connected
>> to the ADSL ?
>> 
>> I would have thought that if this was set to 1492,
>> then things should sort 
>> themselves out quite transparently...
>> 
>
>ppp0 is 1492 and its "connected" to eth0 that is 1500,
>and eth1 is connected to local net and it is 1500
>
>> 
>> You *are* allowing the appropriate ICMP messages
>> into / out of / through your 
>> firewall box, aren't you ?
>
>Uhmmm, no idea actually, hehe, i just configures it to
>reject or accept access on certain ports, not dropping
>every package coming that isn't matching a certain
>port (hmm, hope anyone understands that sentence). 
>Why lock down everything when i know what service that
>is on the linux and on ever computer behind it.
>
>/J=F6rgen
>
>__________________________________________________
>Do You Yahoo!?
>Yahoo! Health - your guide to health and wellness
>http://health.yahoo.com
>
>


