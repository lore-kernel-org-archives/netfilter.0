From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: port based filtering and IPsec 2.6
Date: Mon, 19 Jan 2004 08:43:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040119074341.GB29236@torres.ka0.zugschlus.de>
References: <20040114162623.GR4106@openoffice.nl> <200401171829.56492.Antony@Soft-Solutions.co.uk> <E1Ai91E-0007XZ-Is@vishnu.netfilter.org> <200401180934.21656.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401180934.21656.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Jan 18, 2004 at 09:34:21AM +0000, Antony Stone wrote:
> On Sunday 18 January 2004 9:14 am, Marc Haber wrote:
> > I hope that I made my point clear.
> 
> Indeed, thanks.   I understand now why you dislike it.
> 
> I guess I've just been lucky that I prefer compiling my own kernels
> anyway, I don't mind a strange patching mechanism so long as it
> works, and I've not joined the mailing list because I've found the
> info I need in the documentation or in the list archives.

I compile my own kernels as well, but I package them for easier
distribution to the productive machines. And I like to have .diff
files that can easily be reproduced by my colleagues.

> I agree with the point made earlier however that it's a very poor
> situation if the 2.6 kernel IPsec won't allow filtering unencrypted
> packets.

Yes. It that's really impossible, it's a killer for kernel 2.6 ipsec
in my environment.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

