From: Walther@gehag-dsk.de
Subject: Re: Fwd: Re: FreeS/WAN + static NAT + 2 machines
Date: Wed, 25 Sep 2002 07:37:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFAB59EF5D.BF8C5345-ONC1256C3F.001E97AF-C1256C3F.001EDF63@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

hi Antony,

i hate w******. i found out, that you can mount network-drives if there is 
the option in the network-environment enabled for "sharing files and 
printers". without this option there is at everytim the "systemerror 51". 
if you enable this option everything works fine and very fast. I like 
FreeS/WAN and I like netfilter.

THX for all your help.

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04




Antony Stone <Antony@Soft-Solutions.co.uk>
24.09.2002 18:57

 
        To:     Walther@gehag-dsk.de
        cc: 
        Subject:        Re: Fwd: Re: FreeS/WAN + static NAT + 2 machines


On Tuesday 24 September 2002 5:40 pm, Walther@gehag-dsk.de wrote:

> that's the problem. I tried via the ip-adresses but there was at 
evertime
> this errorcode:
>
> <--snip-->
>
> c:\net use z: \\10.16.100.62\install
> systemerror 51
>
> the remotecomputer is not available
>
> <--snip-->

Okay, in that case try putting this into your c:\windows\lmhosts file:

<quote>
10.16.100.62             servername
</quote>

That's just a single line (if the file already exists, simply add it at 
the 
end) containing the IP address, a tab (I think spaces are okay too) and 
the 
name you want to call your server - doesn't have to match the hostname if 
you 
don't want it to.

You should then be able to say:

c:\net use z: \\servername\install
The command was completed successfully.

It works for me using Windows 95/98 clients and Samba servers across a 
FreeS/WAN IPsec VPN link.


Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.




