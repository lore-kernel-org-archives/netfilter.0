From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules for blocking Email from libero.it domain
Date: Tue, 29 Oct 2002 13:04:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291304.g9TD4ve10070@vulcan.rissington.net>
References: <200210281507.g9SF70e08704@vulcan.rissington.net> <20021029085004.FRPW1554.mta07-svc.ntlworld.com@there> <0a9501c27f37$a0cf6370$eb00010a@andromeda>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0a9501c27f37$a0cf6370$eb00010a@andromeda>
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

On Tuesday 29 October 2002 10:40 am, Adam D. Barratt wrote:

> Antony Stone wrote Tuesday, October 29, 2002 8:50 AM
>
> > The latter is correct.   Before an email is transmitted, the sender tells
> > the receiver what size it is so that the receiver can decide whether it
> > has space to accept it.
>
> In most cases, no such decision takes place. Specifically, there are very
> few servers (IME) that actually implement the SIZE extension, as defined in
> RFC1870.
>
> Note that RFC2821 discourages decisions based on message size.

Hmmm.   I suppose everyone assumes that mail servers have infinite hard disk 
capacity these days...

Antony.

-- 

Which part of 'apt-get dist-upgrade' do you not understand ???

