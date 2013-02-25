From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd questions
Date: Mon, 25 Feb 2013 16:45:32 +0100
Message-ID: <20130225154532.GD20561@localhost>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
 <20130219195237.GA3208@localhost>
 <CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
 <20130221183711.GA6061@localhost>
 <CAHPDOiEvpU1hEKkNJMpUrxJP6Lb=9pKDsEbMjqbr7DWKyZt_Ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHPDOiEvpU1hEKkNJMpUrxJP6Lb=9pKDsEbMjqbr7DWKyZt_Ew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <listaddr@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Feb 22, 2013 at 11:12:55AM +0100, Marco wrote:
[...]
> > In your previous config, assuming you use a 3.x kernel, I saw you did
> > not enabled TCPWindowTracking On. That allows the new primary to
> > recover TCP window tracking from the middle.
> 
> Unfortunately, the system where this will run has a 2.6.32 kernel, so
> this is not an option for the moment.

I really recommend you to upgrade to some stable branch of 3.x. Many
relevant updates and fixes went into the ctnetlink code since that
version you're using.

[...]
> Well, the docs mention window tracking here and there, but (at least
> to me) it's not clear what that does, and that it's (or could be) the
> solution to this problem I'm seeing.
> Furthermore, I found no documentation or explanation of
> nf_conntrack_tcp_be_liberal on google, neither it is in the sysctl.txt
> file that documents the /proc/sys/net entries, nor anywhere else.

http://git.kernel.org/?p=linux/kernel/git/davem/net-next.git;a=blob;f=Documentation/networking/nf_conntrack-sysctl.txt;h=70da5086153dbd24a9c9258e73cc16440d247519;hb=HEAD

Regards.
