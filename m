From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fwd: Re: FreeS/WAN + static NAT + 2 machines
Date: Tue, 24 Sep 2002 16:48:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209241548.g8OFmmv26526@vulcan.rissington.net>
References: <OF97101FEC.E6B99807-ONC1256C3E.005480B2-C1256C3E.0054FC9A@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF97101FEC.E6B99807-ONC1256C3E.005480B2-C1256C3E.0054FC9A@GEHAG-DSK.DE>
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
To: netfilter@lists.netfilter.org

On Tuesday 24 September 2002 4:28 pm, Walther@gehag-dsk.de wrote:

> hey Antony,
>
> i got this setup work.

Good.   Well done :-)    I'm glad it turned out you weren't using transport 
mode after all.

> this works fine for me. i can browse the internal http, ping all
> workstations and server and check mails with Lotus Notes.
>
> but i cannot mount any Windows or SAMBA share. do you know something about
> this???

Windows / NetBeui is a non-routable protocol.   It relies on network 
broadcasts to do its network browsing, and you cannot do network broadcasts 
beyond the local network (ie through a router or VPN link).

However, you *should* be able to mount shared drives, or connect to shared 
printers etc so long as you know the IP address of the remote machine you 
want to connect to.

If you are using a recent version of Windows, try using the IP address of the 
machine which has the shares instead of the machine name - you should find 
you can connect in the normal way.

As an alternative, or if you're using an older version of Windows, you can 
put an entry into the c:\windows\lmhosts file giving the hostname and the IP 
address, and this should allow you to set up the share in the usual way.

You won't be able to browse network resources across the VPN link, however - 
you must know where they are on the other end.

Antony.

-- 

Most people have more than the average number of legs.

