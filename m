From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Tue, 16 Sep 2008 09:56:27 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C172172606614@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <ff71fbf20809150506o20814abfid25565078f711b95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ff71fbf20809150506o20814abfid25565078f711b95@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vimal <j.vimal@gmail.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Vimal [mailto:j.vimal@gmail.com]
> Sent: Monday, September 15, 2008 8:06 PM
> To: Xu, Qiang (FXSGSC)
> Cc: Rob Sterenborg; netfilter@vger.kernel.org
> Subject: Re: iptables not prevent access
>
>
> As someone mentioned on this thread, use: netstat -nr and
> paste the output here.

Done.

> Hmmm... Could you paste the output of an ifconfig equivalent program?
> I am not sure what it is on Windows (ipconfig, maybe?). But,
> this will show all the network interfaces.

The output of the command "ipconfig"
------------------------------------
C:\Documents and Settings\Administrator>ipconfig /all

Windows IP Configuration

   Host Name . . . . . . . . . . . . : nutrinity
   Primary Dns Suffix  . . . . . . . : crmttrinity.lab
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : crmttrinity.lab

Ethernet adapter Local Area Connection 2:

   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : NVIDIA nForce Networking Controller
   Physical Address. . . . . . . . . : 00-50-8D-7E-51-29
   DHCP Enabled. . . . . . . . . . . : No
   IP Address. . . . . . . . . . . . : 13.121.8.119
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 13.121.8.1
   DNS Servers . . . . . . . . . . . : 127.0.0.1
                                       13.135.130.15
   Primary WINS Server . . . . . . . : 13.121.11.9
   Secondary WINS Server . . . . . . : 13.135.134.15
                                       13.151.134.15
------------------------------------
Seems only one ethernet interface.

> You did mention that you ran a network packet capturing
> program. Could you run it on _all_ interfaces?

Yes, with WireShark, I tried to capture all the packets with MacAddress (with the filter "ether host 00:50:8d:7e:51:29"), but there are still no packets to and from 13.121.8.106 (the server).

> (Just a wild guess) One other possibility is that your server
> == your client (13.121.8.119). In this case, all packets are
> routed via lo, and not via eth0. :) Can you type:
> http://127.0.0.1 in your browser to see if you can access the website?

The server is definitely not the client. The server is a printer (13.121.8.106). The client is a Windows 2003 Server (13.121.8.119).
:-(

>
> Could you try this:
>
> * Run the sniffing software on the client, capturing _all_
> packets (without any filter) and on _all_ interfaces.
> * From the client (119) access the server webpage.
> * See what you get on the client side.

Just as I said, open WebUI of 13.121.8.106 on 119 while capturing network packets with MacAddress, but that didn't help, either. :-(

> I hope I wasn't too confusing.
>
> --
> Vimal
>
