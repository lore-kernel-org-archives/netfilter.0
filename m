From: "Steven Schmidt" <sschmidt@compass.net.nz>
Subject: Re: General : delaying IP packets
Date: Fri, 7 Jun 2002 12:13:51 +1200
Sender: netfilter-admin@lists.samba.org
Message-ID: <011801c20db8$343ad690$0e000064@compass.net.nz>
References: <5.1.0.14.2.20020606155519.00ab0a78@jittlov.qualcomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org, Arnaud Meylan <ameylan@qualcomm.com>

Hi Arnaud,

Checkout iptables/netfilter and tc.
It's quite heavy going to start with, but once you get into it, you can what
your after plus more.  :-)

http://lartc.org/#download
http://snafu.freedom.org/linux2.2/iproute-notes.html#syntcqdisc

_______________________________________
Steven Schmidt
Compass Communications Ltd
Ph (09) 3598900
Fx  (09) 3598919


----- Original Message -----
From: "Arnaud Meylan" <ameylan@qualcomm.com>
To: <netfilter@lists.samba.org>
Sent: Friday, June 07, 2002 10:59 AM
Subject: General : delaying IP packets


> First I thought of using divert-sockets. Then I realised I have a kernel
> 2.4.18 so why not netfilter?
>
> My goal is to delay IP packets routed in a linux box. This task should be
> pretty simple isn't it ? My first contact with netfilter lets me think it
> might take a while to get familiar with the thing and get results.
>
> (Yes I am a basic linux user...)
>
> I would really appreciate some suggestion / comments
>
> Arnaud
>
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.


