From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: upgrading iptables
Date: Mon, 25 Nov 2002 20:59:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125205959.309c81e3.arnt@c2i.net>
References: <31347F3CE518D6118ACB00A0246AD0560B24AA@mx.seaan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31347F3CE518D6118ACB00A0246AD0560B24AA@mx.seaan.net>
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
To: mailinglists@belfin.ch
Cc: netfilter@lists.netfilter.org

On Mon, 25 Nov 2002 12:49:55 +0100, 
mailinglists@belfin.ch wrote in message 
<31347F3CE518D6118ACB00A0246AD0560B24AA@mx.seaan.net>:

> Hi all
> 
> I've never before upraded iptables. Right now there's version 1.25
> from suse 8.0 package installed.
> How do I have to make the upgarde? Do I have to de-install the 1.25
> first and then compile 1.27? Or are there easier ways? e.g. rpms for
> suse distro?

..there is an "update distro" utility?  These usually try to mimic
Debians 'aptget', essentially by 'rpm -Fvh $package', adding more as
needed to satisfy dependencies.  You can run rpm -Fvh manually, if it 
whines about missing rpms, add them to the command line.

..you can also compile your own rpms from tarballs, usually 'rpmbuild 
(or rpm) -ta $tarball.tgz' or something like that, check 'info rpm'.

> btw: I checked FAQ for that question (just very quickly). It seems
> this question isn't covered. 

.. ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



