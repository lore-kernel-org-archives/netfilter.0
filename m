From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: [SECURITY] Local Netfilter / IPTables IP Queue PID Wrap Flaw
Date: Tue, 3 Dec 2002 20:21:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021203202116.58e6d00a.arnt@c2i.net>
References: <Mutt.LNX.4.44.0212032155570.27990-100000@blackbird.intercode.com.au>
	<Mutt.LNX.4.44.0212040025010.28607-100000@blackbird.intercode.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Mutt.LNX.4.44.0212040025010.28607-100000@blackbird.intercode.com.au>
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

On Wed, 4 Dec 2002 00:29:11 +1100 (EST), 
James Morris <jmorris@intercode.com.au> wrote in message 
<Mutt.LNX.4.44.0212040025010.28607-100000@blackbird.intercode.com.au>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Just an update on this, someone has pointed out that the recommended
> 2.4.20 kernel has a ext3 data corruption bug (which fortunately will
> not affect most users).
> 
> The changset comments for the ext3 bug are at:
> <http://linux.bkbits.net:8080/linux-2.4/cset@1.793?nav=index.html|Cha
> ngeSet@-1d>
> 
> Please be careful if updating to 2.4.20, or wait until 2.4.21.

..and meanwhile alias 'umount' to 'sync && umount', 
you may want to chuck in a 'sleep 45' to play safer.

..url to a fix patch, anyone?


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



