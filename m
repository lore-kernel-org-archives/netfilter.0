From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Nat and firewall holes
Date: Mon, 22 Mar 2010 22:57:06 +0530
Message-ID: <cfeab66d1003221027v65611783vf342e3038744a0f6@mail.gmail.com>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
	 <4BA7A4F9.6020001@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BtlOZxYb+8HDWk9hfCUULg4FMvxvJv3o508s8WAaLSg=;
        b=UguYJ9IT5NXUF+IDpfUoufnS/+Fz0tFLZRbYY9FSvtmnoO21xU2u3RqNy0Huo8UkFs
         b/eTKad6S5G1hEMzyZS+v6pyEml6EJlAaLSg04tkoasGrL2T1YSuVmi/HG5zpCu2TaKw
         efSib8G9mXEwXUTFoaUCaX53sV9znos+Rf1fA=
In-Reply-To: <4BA7A4F9.6020001@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>On Mon, Mar 22, 2010 at 10:42 PM, Pascal Hambourg <pascal.mail@plouf.f=
r.eu.org> wrote:
> If a crafted packet matches all the characteristics of the conntrack
> entry for that connection (including reply source port 80, TCP sequen=
ce
> number), then it will be considered belonging to the reply direction =
of
> that connection and the NAT will process it accordingly.


i thought ,  only a tuple of ip and port is kept for connection
tracking ( not tcp sequence )  .



On Mon, Mar 22, 2010 at 10:42 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> ratheesh k a =E9crit :
>>
>> I have a linux machine'( say B ) =A0with two interfaces ( eth0
>> -192.168.1.1 =A0and eth1 - 192.168.55.1 ) .This linux machine works =
as a
>> gateway machine . eth0 is connected to LAN network and eth1 is
>> connected to WAN network . below rules are applied on the gateway
>> machine .,
>>
>> =A0 =A0 iptables -A =A0INPUT -i eth0 -j ACCEPT
>> =A0 =A0 iptables -A INPUT =A0-i eth1 -j DROP
>>
>> =A0 =A0 iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
>> =A0 =A0 iptables -A FORWARD -i eth1 -o eth0 -j DROP
>
> Hmm, not sure that dropping everything received on eth1 is a good ide=
a.
>
>> =A0 =A0 iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE .
>>
>>
>> LAN ---> eth0 : Gateway linux machine :eth1 ---> WAN
>>
>> We have machine called A , connected to LAN network and is assigned =
an
>> ip 192.168.1.100 and its gateway is machine B's eth0 interface (
>> 192.168.1.1 ) .
>> if i access "google.com " from machine A , syn packet with dest ip a=
s
>> a.b.c.d ( google.com ip ) and =A0dest port 80 will go to machine B
>> (default gateway ) . Since we are masquerading all the packets , it
>> will change =A0source ip with 192.168.55.1 and source port with some
>> random port ( say portx ) .
>
> MASQUERADE won't change the source port unless specified otherwise by
> --random or --to-ports options, or if it is necessary in order to avo=
id
> a "collision" with an existing connection (e.g. two clients connectin=
g
> to the same server with the same source port). See iptables man page.
>
>> Packets from server will be having
>> 192.18.55.1 ip and port as portx . This will be changed to original =
ip
>> and port by conntrack module .
>
> Actually the conntrack module will only associate the packet to the
> existing connection, and the nat module will change the addresses and=
 ports.
>
>> =A0My qustion is : if i create a packet with source ip as 192.168.55=
=2E1
>> and dest port as portx , can i get into the machine B from WAN side =
=2E
>
> Do you mean machine A (the client) ?
> If a crafted packet matches all the characteristics of the conntrack
> entry for that connection (including reply source port 80, TCP sequen=
ce
> number), then it will be considered belonging to the reply direction =
of
> that connection and the NAT will process it accordingly.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
