From: matthias <mensch0815@googlemail.com>
Subject: Re: ftp and nat
Date: Wed, 3 Jun 2009 13:17:29 +0200
Message-ID: <3e4778d50906030417x1a3feef9i3ea2de0d421d9786@mail.gmail.com>
References: <3e4778d50905270448o4a10936bi37acf8eea86be692@mail.gmail.com>
	 <1243426388.1634.46.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Fh/88kqVDUrNfRxkJgyGonBGO+Vqv8TCqY3L87L9mvM=;
        b=lZPeaaBcgGovV3hlgf78GN1KGHw/aedvyYh7WL5Kd1c4Y9bm7aka67B8Vvp7YAOZuU
         TWzamQswSg3nRsNXVCV8KqcMk1Haxm7MeQcCIVY6O5kRGqiRAWNia1us5aCQuTnUSraN
         mWdb5JEgvGlFaJhPAaH/lSNOYYEHWxwSi5L9g=
In-Reply-To: <1243426388.1634.46.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Hi all,

2009/5/27 Thomas Jacob <jacob@internet24.de>:
> On Wed, 2009-05-27 at 13:48 +0200, matthias wrote:
>> Hi all,
>>
>> i have a network like this:
>> client <-> router <-> server
>>
>> the router is linked via eth0 to the client-network and via tun0 to =
the server.
>> when i try to log from the client into the server via ftp I get a
>> delay of about 30 seconds.
>> does anyone tell me why, is it, that iptables doesn't support active=
 ftp?
>>
>> here are tcpdump extracts taken by the router:
>>
>> root@router# tcpdump -i eth0
>> listening on eth0, link-type EN10MB (Ethernet), capture size 96 byte=
s
>> 15:57:01.949614 IP client.43278 > router.ftp: S
>> 2612647763:2612647763(0) win 5840 <mss 1460,sackOK,timestamp 5381639=
18
>> 0,nop,wscale 2>
>> 15:57:01.951314 IP router.ftp > client.43278: S
>> 3833629446:3833629446(0) ack 2612647764 win 5792 <sackOK,timestamp
>> 109271440 538163918,mss 1460,nop,wscale 2>
>> 15:57:01.951615 IP client.43278 > router.ftp: . ack 1 win 1460
>> <nop,nop,timestamp 538163921 109271440>
>
> 3 way handshake is complete here
>
>> 15:57:32.417873 IP router.ftp > client.43278: P 1:99(98) ack 1 win
>> 1448 <nop,nop,timestamp 109279056 538163921>
>
> And then your router does not send the FTP ready message for about
> 30s, at this point nothing FTP specific has yet taken place.
>
> Suggest you look into your "ident"-checks in the FTP server config
> and disable them.
>
> Once you get the FTP prompt right away, don't forget to load the FTP
> support modules for iptables/NAT:
>
> =C2=A0modprobe nf_conntrack_ftp
> =C2=A0modprobe nf_nat_ftp

=46irstly I missed to caputer auth communication on eth0. After changin=
g
the tcpdump call (tcpdump -i eth0 port ftp or port ftp-data or port
auth) I recongnized, that the auth-messages from the server are
delivered to the client without changing the corresponding ip adress,
so that the client received a auth-request with source-ip=3Dserver.
I think this happens due to the fact that iptables couldn't recognize
the answer of the server, because it uses a different port.

As a workaround I added the folowing rule to my iptables initalization =
script:
iptables -A FORWARD -i tun0 -o eth0 -p tcp --dport 113 -j REJECT -v

So that I get a ftp prompt right away. Seems as if the FTP server
doesn't have any config flag to disable ident-checks.

Thanks,
Matthias
