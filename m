From: aksingh@hss.hns.com
Subject: Re: libnet 1.1.2.1 installation
Date: Wed, 5 May 2004 19:21:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF6C629AAD.12D29306-ON65256E8B.004AD7D8@hss.hns.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org





Hi Jee,

Thanks Jee, Yes I did that in the afternoon its working fine for me too,
though havent been able to setup the man pages, dunno if thats possible,
help is in form of htmls, but cant I do something to get help on functions
like normal manpages, for eg: man libnet_write ? ...

newaz, other more imp doubts  :

1) the queue handler for ipv4 in libipq is ip_queue kernel module, this
uses netlink sockets for user space/ kernel space communication .... can we
change sock options for this socket, like the socket buffer and all,
because under high load conditions a small buffer may result in packet
drops, is this possible with ip_queue ?

2) any way of installing libipq, without compiling ip_tables, i have
iptables-1.1.1-2, but guess dont have libipq, no libipq.h in
/usr/local/include ?

regards,
Amit




"Jee J.Z." <jz105@york.ac.uk> on 05/05/2004 07:11:29 PM

To:    Amit Kumar Singh/HSS@HSS
cc:    <libnet@securityfocus.com>

Subject:    Re: libnet 1.1.2.1 installation


Hi Amit,

1. $tar xvfz libnet-1.1.2.1.tar.gz
2. Enter the decompressed directory:
    $./configure
3. $make
4. $make install

I've tried libnet and it works well. If I remember correctly, then it
should
work.

Jee

> hi,
>
>  How do I install libnet-1.1.2.1 on my redhat linux box (2.4.2-2) ?. I
have
> downloaded the tar file libnet-1.1.2.1.tar.gz from
> http://www.packetfactory.net/libnet/dist/
>
> thanks,
> Amit
>
> "DISCLAIMER: This message is proprietary to Hughes Software Systems
Limited
> (HSS) and is intended solely for the use of the individual to whom it is
> addressed. It may contain  privileged or confidential information and
> should not be circulated or used for any purpose other than for what it
is
> intended. If you have received this message in error, please notify the
> originator immediately. If you are not the intended recipient, you are
> notified that you are strictly prohibited from using, copying, altering,
or
> disclosing the contents of this message. HSS accepts no responsibility
for
> loss or damage arising from the use of the information transmitted by
this
> email including damage from virus."
>
>





