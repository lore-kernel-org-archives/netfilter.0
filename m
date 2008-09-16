From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Tue, 16 Sep 2008 09:36:19 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C17217260657C@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <48CE466F.3030008@tech.nologi.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48CE466F.3030008@tech.nologi.es>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Gray <iptables@tech.nologi.es>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Simon Gray [mailto:iptables@tech.nologi.es]
> Sent: Monday, September 15, 2008 7:27 PM
> To: Xu, Qiang (FXSGSC)
> Cc: netfilter@vger.kernel.org
> Subject: Re: iptables not prevent access
>
> netstat -nr
>
> ^^ Works on both windows and linux

The following is the output of the command. Anything wrong here?

-------------------------------------
C:\Documents and Settings\Administrator>netstat -nr

IPv4 Route Table
===========================================================================
Interface List
0x1 ........................... MS TCP Loopback interface
0x10003 ...00 50 8d 7e 51 29 ...... NVIDIA nForce Networking Controller - Virtual
l Machine Network Services Driver
===========================================================================
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0       13.121.8.1     13.121.8.119     20
       13.121.8.0    255.255.255.0     13.121.8.119     13.121.8.119     20
     13.121.8.119  255.255.255.255        127.0.0.1        127.0.0.1     20
   13.255.255.255  255.255.255.255     13.121.8.119     13.121.8.119     20
        127.0.0.0        255.0.0.0        127.0.0.1        127.0.0.1      1
        224.0.0.0        240.0.0.0     13.121.8.119     13.121.8.119     20
  255.255.255.255  255.255.255.255     13.121.8.119     13.121.8.119      1
Default Gateway:        13.121.8.1
===========================================================================
Persistent Routes:
  None
-------------------------------------

Thanks,
Xu Qiang
