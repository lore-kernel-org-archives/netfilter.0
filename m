From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Packet duplication
Date: Wed, 24 Oct 2007 14:45:55 +0200
Message-ID: <002e01c8163b$d1f931b0$0b0ffe0a@NS006819>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za> <001501c81620$a81ac3b0$0b0ffe0a@NS006819> <471F17BC.9060507@netsys.co.za> <001601c81629$cd4831f0$0b0ffe0a@NS006819> <471F21E7.2000901@netsys.co.za>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <471F21E7.2000901@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> looks promising thanks. it said it download ROUTE extra so patched
> (never asked me to apply ROUTE patch though) and am now
> compiling kernel again so will let you know in a days time
> thanks for your philantropy

I tried to patch 2.6.23.1 using POM-ng but it didn't ask to patch for
ROUTE as you found out. Maybe it's not supported on this kernel so it'll
won't work on this kernel.

To see what happens, I patched the kernel manually (copied files, added
stuff to Kconfig and Makefile), configured it for ROUTE (ipv4) and it
seems to compile. I can't test if it will work, however.


Grts,
Rob


