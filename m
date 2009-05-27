From: Thomas Jacob <jacob@internet24.de>
Subject: Re: ftp and nat
Date: Wed, 27 May 2009 14:13:08 +0200
Message-ID: <1243426388.1634.46.camel@enterprise.ims-firmen.de>
References: <3e4778d50905270448o4a10936bi37acf8eea86be692@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e4778d50905270448o4a10936bi37acf8eea86be692@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: matthias <mensch0815@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2009-05-27 at 13:48 +0200, matthias wrote:
> Hi all,
> 
> i have a network like this:
> client <-> router <-> server
> 
> the router is linked via eth0 to the client-network and via tun0 to the server.
> when i try to log from the client into the server via ftp I get a
> delay of about 30 seconds.
> does anyone tell me why, is it, that iptables doesn't support active ftp?
> 
> here are tcpdump extracts taken by the router:
> 
> root@router# tcpdump -i eth0
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 15:57:01.949614 IP client.43278 > router.ftp: S
> 2612647763:2612647763(0) win 5840 <mss 1460,sackOK,timestamp 538163918
> 0,nop,wscale 2>
> 15:57:01.951314 IP router.ftp > client.43278: S
> 3833629446:3833629446(0) ack 2612647764 win 5792 <sackOK,timestamp
> 109271440 538163918,mss 1460,nop,wscale 2>
> 15:57:01.951615 IP client.43278 > router.ftp: . ack 1 win 1460
> <nop,nop,timestamp 538163921 109271440>

3 way handshake is complete here

> 15:57:32.417873 IP router.ftp > client.43278: P 1:99(98) ack 1 win
> 1448 <nop,nop,timestamp 109279056 538163921>

And then your router does not send the FTP ready message for about
30s, at this point nothing FTP specific has yet taken place.

Suggest you look into your "ident"-checks in the FTP server config
and disable them.

Once you get the FTP prompt right away, don't forget to load the FTP
support modules for iptables/NAT:
 
  modprobe nf_conntrack_ftp
  modprobe nf_nat_ftp
 

