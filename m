From: "Cornu Nicolas" <n.cornu@ifrance.com>
Subject: Re: MSN Voice chat with Iptables
Date: Tue, 3 Jun 2003 13:29:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c329c3$62f41230$0100a8c0@windows>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9C@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: George Vieira <georgev@citadelcomputer.com.au>, hare ram <hareram@sol.net.in>, netfilter@lists.samba.org

MSN support proxy , don't that help ?
I prefer to install a proxy than recompile the kernel

NC

----- Original Message -----=20
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "hare ram" <hareram@sol.net.in>; "Cornu Nicolas" <n.cornu@ifrance.com>;
<netfilter@lists.samba.org>
Sent: Tuesday, June 03, 2003 8:39 AM
Subject: RE: MSN Voice chat with Iptables


I think they can make outgoing calls but it's the incomming that's the
problem.. i'm mena think about it.. the poor firewall gets a incomming call,
it doesn't know who to put it through the poort damn blonde receiptionist...
;)

If someone wrote some sort of H323 version of the old ICQ module for
ipchains that would be great because it could track MSN user logins and know
where they are, possibly some sort of connection tracking RELATED
connections and redirect to te right user.... yeah admin heaven I'm in at
the mo'... ;P he he

it's too complicated for incoming calls...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: hare ram [mailto:hareram@sol.net.in]
Sent: Tuesday, June 03, 2003 4:37 PM
To: George Vieira; Cornu Nicolas; netfilter@lists.samba.org
Subject: Re: MSN Voice chat with Iptables


Hi

If only one client can only use Voice chat in whole network
then there is no use, if only one customer uses, like every one want to
voice chat

how are this setup going to achive,
one public IP with lot of private Clients
all want MSN Voice chat

hare
----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Cornu Nicolas" <n.cornu@ifrance.com>; <netfilter@lists.samba.org>
Sent: Tuesday, June 03, 2003 8:34 AM
Subject: RE: MSN Voice chat with Iptables


Not really.. the only few things I can suggest it to grab all
sources(kernel,iptables,etc) and to backup your original source if any found
in /usr/src/linux. Then copy the .config found in that directory and copy to
the new kernel source and use 'make oldconfig' which will help heaps.

if .config doesn't exist then you'll have to configure your kernel yourself
and it'll probably take a few goes before you get it working. he he

Also in /boot/ directory, don't replace any entries but make new ones..

here's my one as an example below (/etc/lilo.conf). So if the kernel fails,
you can go back to an earlier one.. ;)

boot=3D/dev/md0
map=3D/boot/map
install=3D/boot/boot.b
prompt
timeout=3D50
message=3D/boot/message
linear
default=3DSG1-2.4.19
#default=3DSG2-2.4.18-new

image=3D/boot/vmlinuz-2.4.19
        label=3DSG1-2.4.19
        read-only
        root=3D/dev/md5

image=3D/boot/vmlinuz-2.4.19-at
        label=3DSG2-2.4.19-at
        read-only
        root=3D/dev/md5

image=3D/boot/vmlinuz-2.4.18-3
        label=3DSG2-2.4.18-new
        read-only
        root=3D/dev/md5

image=3D/boot/vmlinuz-2.4.18-2
        label=3DSG3-2.4.18
        read-only
        root=3D/dev/md5

image=3D/boot/vmlinuz-2.4.2-2
        label=3DSG4-2.4.2
        initrd=3D/boot/initrd-2.4.2-2.img
        read-only
        root=3D/dev/md5

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698


-----Original Message-----
From: Cornu Nicolas [mailto:n.cornu@ifrance.com]
Sent: Tuesday, June 03, 2003 12:48 PM
To: netfilter@lists.samba.org
Subject: Re: MSN Voice chat with Iptables


That mean i need to compile patch o matic and recompile the kernel with
patch ?
Do u have some tips, i am new to linux and like Hare Ram i want to use MSN
voice chat

NC

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "hare ram" <hareram@sol.net.in>; <netfilter@lists.samba.org>
Sent: Tuesday, June 03, 2003 12:37 AM
Subject: RE: MSN Voice chat with Iptables


If I'm not wrong, I think MSN uses Net Meeting for chatting and if this is
correct, you need the patch-o-matic patch for H323 to allow incoming H323
calls.
The bad side to this is that it only supports 1 machine behind the firewall
because you have to DNAT to a specified machine to receive any outside
calls.. AFAIK, this is what I had to do for Net Meeting..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au



-----Original Message-----
From: hare ram [mailto:hareram@sol.net.in]
Sent: Tuesday, June 03, 2003 12:49 AM
To: netfilter@lists.samba.org
Subject: MSN Voice chat with Iptables


Hi all

Does any one have Good URL to work
MSN Voice chat with IPTABLES+NAT

thanks
hare



_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France

_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France





_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France

_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France


