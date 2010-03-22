From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Nat and firewall holes
Date: Mon, 22 Mar 2010 17:10:08 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1003221708430.21248@obet.zrqbmnf.qr>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2010-03-22 16:46, ratheesh k wrote:

>We have machine called A , connected to LAN network and is assigned an
>ip 192.168.1.100 and its gateway is machine B's eth0 interface (
>192.168.1.1 ) .
>if i access "google.com " from machine A , syn packet with dest ip as
>a.b.c.d ( google.com ip ) and  dest port 80 will go to machine B
>(default gateway ) . Since we are masquerading all the packets , it
>will change  source ip with 192.168.55.1 and source port with some
>random port ( say portx ) . Packets from server will be having
>192.18.55.1 ip and port as portx . This will be changed to original ip
>and port by conntrack module .
>
> My qustion is : if i create a packet with source ip as 192.168.55.1
>and dest port as portx , can i get into the machine B from WAN side .

Yes.
