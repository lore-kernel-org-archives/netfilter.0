From: "Netravali Ganesh" <gnetravali@sonusnet.com>
Subject: RE: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 12:48:22 +0530
Message-ID: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8B28@sonusinmail02.sonusnet.com>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com><CAHEKYV4NAdedVx0JM6O5Q4SNaDxk+2mVw_YvNJiQrt7OwQbsKA@mail.gmail.com> <20111005000932.2txxwdy9vrk8wkc8@mail.dalan.us>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20111005000932.2txxwdy9vrk8wkc8@mail.dalan.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Here is the iptables rules

-A INPUT -m state --state NEW -m udp -p udp --dport 22 -i eth1 -s 0/0 -=
j DROP
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -i eth1 -s 0/0 -=
j DROP
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth+ -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 5353 -d 224.0.0.251=
 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 5404 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 5405 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 11111 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 21064 -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
-A FORWARD -i lo -j ACCEPT
-A FORWARD -i eth+ -j ACCEPT

Thanks
Ganesh
-----Original Message-----
=46rom: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ke=
rnel.org] On Behalf Of David Alanis
Sent: Wednesday, October 05, 2011 10:40 AM
To: netfilter@vger.kernel.org
Subject: Re: How to block ssh on specific ethernet interface

Quoting Mauricio Tavares <raubvogel@gmail.com>:

> On Wed, Oct 5, 2011 at 12:24 AM, Netravali Ganesh
> <gnetravali@sonusnet.com> wrote:
>> Hi..
>>
>> I have multiple Ethernet =A0interface on the system. I need to enabl=
e =20
>> the ssh on eth0 and block the ssh on all the other interfaces. =20
>> Below is the iptables rules I am using. This is not working form =20
>> pls lls let me know what is wrong. I am using RHEL6.1 system.
>>
>> =A0[root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp =20
>> --dport 22 -j DROP
>> =A0[root@localhost ~]# iptables -L -v -n
>> Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
>> =A0pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=
=A0 source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =20
>> destination
>> =A0=A0=A0 0=A0=A0=A0=A0 0 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 eth1=A0=
=A0 *=A0=A0=A0=A0=A0=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =20
>> 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:22
>>
>       I do not know what are your other rules, but I tend to have my
> iptables blocking everything by default and only opening the ports I
> need. Something like
>
> iptables -P INPUT  DROP -m comment --comment "drop everything"
> [...]
> iptables -A SERVICES  -i eth0 -p tcp -m tcp --dport 22 -m comment
> --comment "allow ssh into machine, from eth0" -j ACCEPT
> --

Your way is another way of doing it, but isn't Ganesh's rule wrong?

The man page says that you can specify the protocol with *-p* or with =20
the match option *-m* so essentially that would be incorrect? I have =20
not had a chance to try it, but reading the man page I think that =20
needs to be addressed? I am new so this would be a learning =20
opportunity for me.

MATCH EXTENSIONS
iptables can use extended packet matching modules.  These are loaded =20
in two ways: implicitly, when -p or --protocol is specified, or  with  =
=20
the  -m  or  --match options,  followed  by  the  matching  module =20
name; after these, various extra command line options become =20
available, depending on the specific module. You can specify multiple =20
extended match modules in one line, and you can use the -h or --help =20
options after the module has been specified to receive  help  specific =
=20
to that module.

Cheers-
David



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
