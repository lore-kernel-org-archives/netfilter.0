From: mortar <slacklist@op.pl>
Subject: Re[2]: make error with iptables 1.2.11
Date: Wed, 30 Jun 2004 03:08:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <145030924.20040630030826@op.pl>
References: <200406291645.13172.pgunarat@csee.usf.edu>
 <200406292200.23738.Antony@Soft-Solutions.co.uk>
 <6.0.3.0.0.20040629172540.020522a8@babbage.csee.usf.edu>
 <200406292309.38461.Antony@Soft-Solutions.co.uk>
Reply-To: mortar <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406292309.38461.Antony@Soft-Solutions.co.uk>
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

Witam

Wednesday, June 30, 2004, 12:09:38 AM, you wrote:

AS> Okay - that narrows it down.   Anyone else here have experience with kernel
AS> 2.4.26 and iptables 1.2.11?   I can't offer any advice on this one...

I have 2.4.26 and iptables 1.2.11. I patched kernel and iptables
sources with latest pom-ng and then succesfully  builded both. I'm using
Slackware Linux with gcc 3.3.4. Here is step by step how I make this
things works ;)

1. Get kernel 2.4.26 sources, and decompress it to
/usr/src/linux-2.4.26

2. Make a symbolic link
#ln -s /usr/src/linux-2.4.26 linux

3. Get iptables sources
#wget http://www.iptables.org/files/iptables-1.2.11.tar.bz2
and decompress it to /usr/src/iptables-1.2.11

4. Make a symbolic link
#ln -s /usr/src/iptables-1.2.11 iptables

5. Get lates p-o-m-ng
#wget http://www.netfilter.org/files/patch-o-matic-ng-20040621.tar.bz2
and decompress it to /usr/src/patch-o-matic-ng-20040621

6. cd /usr/src/patch-o-matic-ng-20040621

7. Now patch your sources with any extensions you want (i suggest you
to choose only what your realy need). For example:
#KERNEL_DIR=/usr/src/linux ./runme string
#KERNEL_DIR=/usr/src/linux ./runme CONNMARK
...

8. And now the most important step ;)
#cd /usr/src/iptables
#make BINDIR=/sbin LIBDIR=/usr/lib
#make BINDIR=/sbin LIBDIR=/usr/lib install

9. If everything is fine, you can build your kernel.
10. If not ... maybe try older (or newer) version of gcc.

I hope this will help you.

(Sorry for my poooooore english :)

-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


