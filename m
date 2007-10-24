From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Packet duplication
Date: Wed, 24 Oct 2007 17:43:07 +0200
Message-ID: <000b01c81654$93026210$fa92fea9@tanjian>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za> <001501c81620$a81ac3b0$0b0ffe0a@NS006819> <471F17BC.9060507@netsys.co.za> <001601c81629$cd4831f0$0b0ffe0a@NS006819> <471F21E7.2000901@netsys.co.za> <002e01c8163b$d1f931b0$0b0ffe0a@NS006819> <471F5E9C.5010802@netsys.co.za>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <471F5E9C.5010802@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>> To see what happens, I patched the kernel manually (copied files,
>> added stuff to Kconfig and Makefile), configured it for ROUTE (ipv4)
>> and it seems to compile. I can't test if it will work, however.
>>
>>
> i know this is much asked but any chance you could explain to me what
> you did ? (you can be brief) -

The patch is not hard to include manually. If you look in POM-ng's
patchlets directory, you see all available patches including the ROUTE
patch. There, you go to the source you need (I guess linux-2.6).
You'll see 2 directories: include and net. Copy these into the kernel
source using: cp -R * /path/to/kernel.
Next, you go to the /path/to/kernel/net/ipv4/netfilter directory. You'll
find these files:
- Kconfig
- Kconfig.ladd
- Makefile
- Makefile.ladd
Checkout the .ladd files (there's not much in there) and add it
somewhere to Kconfig or Makefile (I think if you look into these files
you'll probably know where). You can delete the .ladd files afterwards.
Do the same in /path/to/kernel/net/ipv6/netfilter.

Now you can configure the kernel for ROUTE and compile it. According to
Kconfig.ladd, the ipv6 ROUTE does not work as a module so don't do
configure it like that for ipv6; ipv4 seems fine as a module.

Again: I got it to compile but that's as much as I can do here. I do not
know if it works.


Grts,
Rob


