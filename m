From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: iptables - edition with browser
Date: Tue, 2 Jul 2002 07:55:29 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1C0@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?=27Z=E9_Lu=EDs=27?= <zeluis@objetivo-americana.com.br>, netfilter@lists.samba.org

Could it be possible you didn't use -p tcp or -p udp.. you can't use =
--dport
without specifying the protocol..

can we see a rule your using or the actual errors reported.. little =
confused
on your doors/archives thingy...

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Z=E9 Lu=EDs [mailto:zeluis@objetivo-americana.com.br]
Sent: Monday, 01 July 2002 9:10 PM
To: netfilter@lists.samba.org
Subject: iptables - edition with browser


hi everybody,

I have a problem with iptables. I use one script that it automatically=20
catches the doors of an archive text and opens or it closes the doors=20
that are in this archive. It functions well.
I have an interface web made in jsp that it edits this archive text.=20
When I edit this archive with browser, iptables I report errors similar =

to ("invalid dest port"). I use a textarea to edit the archive. Browser =

can be sending characters that iptables does not recognize?

Thanks a lot.


