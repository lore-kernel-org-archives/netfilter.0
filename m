From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: When writing rules for multiple sequenced firewalls, does the 
	source IP of client need to be modified at each firewall
Date: Sun, 8 Nov 2009 15:29:48 +0100
Message-ID: <33be4bb30911080629t2b6b7cfdq5959661423e70f5f@mail.gmail.com>
References: <ac5c74140911080335t3c58400t653b8eaaf3343f4d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=UX6iSjJYXMCwhdBgaj5LbHjSiXb7WsGh/GIo8a/OPFY=;
        b=RCNrMW7rOimKnZncGAc6iokzE4deI8xHBF3K28COxPZtoSWyawWZX4bfA/vJonzEuo
         MxMl+vQQKncWH5CfUYwHEHS3Bn8yWzBNVGazNzSRo+WM3uHEDWRyAFxixFAU/8Ak+Sdm
         ixoP2ifKxD72BHryl/jgTrSIF4F9NXCwBjTuM=
In-Reply-To: <ac5c74140911080335t3c58400t653b8eaaf3343f4d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

=46or NAT to happen you need to create SNAT and DNAT rules in mangle
table, chain PREROUTING and POSTROUTING. No NAT happens other than
what you have specified. In most cases, you should not need to
translate the source address of traffic coming from a public
ip-address available on the internet. For your scenario you seem to
need DNAT rules to translate the target address of traffic destined to
your SSH-server.

(You would also need SNAT rules to translate the source address of
packets coming _from_ you own network, if you want to reach other
stations on the Internet.)

/Oskar


2009/11/8 paddy joesoap <paddyjoesoap@gmail.com>:
> Dear Experts,
>
> Suppose I have two firewalls in the network and suppose the network
> consisted of the following:
>
> Internet -- gwFirewall -- tier2firewall -- sshServer
>
> gwFirewall has two interfaces:
> eth0 =3D Internet facing (IP address 1.2.3.4)
> eth1 =3D Internal facing (IP address 192.168.1.1)
>
> tier2firewall has two interfaces:
> eth2 =3D gwFirewall facing (IP address 192.168.1.4)
> eth3 =3D deep internal facing (IP address 192.168.2.1)
>
> sshServer =3D IP address 192.168.2.2, Port 22
>
> Now suppose the two firewalls where a typical SOHO box like the
> linksys 54G WRT runnning dd-wrt, so they handle my Netfilter firewall=
s
> rules and NAT etc.
> Or the Firewalls could be any PC's converted to a netfilter firewall
> (filter, nat and mangle enabled).
>
> My question is, when writing rules to permit Internet access to a
> system deep in the network, do you keep the original source IP addres=
s
> of the internet client in your firewall rules for each firewall in th=
e
> path?
>
> That is, if a internet client (source IP address 94.108.94.75) needs
> to access a ssh server (destination IP address 192.168.2.2) across tw=
o
> firewalls how should the inbound rules look?
>
>
> Scenario 1)
>
> On the gwFirewall you permit the internet client access to
> tier2Firewall on the IP address of eth2 and from there, tier2Firewall
> will permit that same client IP to the ssh sever.
>
> For example:
>
> iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 22=
 =A0-j ACCEPT
> iptables -A FORWARD -i eth2 -s 94.108.94.75 -d 192.168.2.2 --dport 22=
 =A0-j ACCEPT
>
> Scenario 2)
>
> On the gwFirewall you permit the internet client access to
> tier2Firewall on the IP address of eth2 and from there, tier2Firewall
> will permit the *gwFirewall* internal IP to the ssh sever. Because of
> NAT etc I wonder will the source IP addresses etc be changed.
>
> For example
>
> iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 22=
 =A0-j ACCEPT
> iptables -A FORWARD -i eth2 -s 192.168.1.1 -d 192.168.2.2 --dport 22 =
=A0-j ACCEPT
>
> I presume its Scenario 1 above is correct and the original source IP
> address of requesting Internet client is carried through the chain of
> firewalls towards the destination.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
