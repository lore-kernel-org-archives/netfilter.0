From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: Redirecting ports on localhost
Date: Wed, 31 Mar 2004 02:40:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080693630.2471.158.camel@localhost>
References: <20040330133505.22298.90925.Mailman@vishnu.netfilter.org>
	 <200403302013.40298.lists@edeca.net> <1080684198.2471.106.camel@localhost>
	 <200403302331.04982.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302331.04982.lists@edeca.net>
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

ons, 31.03.2004 kl. 00.31 skrev David Cannings:
> avid,
> > Dunno if you're the one responsible for the general Netfilter HOWTO.
> > But if so, could you please change "iplimit" to "connlimit"? I've used
> > vi to great effect after txt2html for my own copy, but I frigged around
> > with iplimit for a while with the non-existent iplimit first. I was
> > *not* pleased.
> 
> Definitely not, the only way I contribute to netfilter is helping out on 
> the users mailing list.  I am unsure whether the source to the HOWTO 
> documents is available, perhaps you could submit diff's for what you 
> believe needs changing.

:g/iplimit/s//connlimit/g

--Tonni

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


