From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: ftp
Date: Fri, 28 May 2004 08:50:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11f101c444aa$05bb5a30$49caa8c0@caris.priv>
References: <20040527193451.05B99DBD@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

I guess my question was is it advisable to only allow active ftp .... ?  Or
is that just not a reasonable idea ?  Or does the Related option make
passive "safe" (ie, don't have to open a load of ports).

I already had to open just about everything outgoing from my proxy server
anyway, so I guess it is not a big deal ... *unless you have a better
suggestion for that as well.

Thank you for all of your help.

Peter


----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, May 27, 2004 4:34 PM
Subject: RE: ftp


> > > .... Thank you for the info.  My question now is, will your rule
> > > take care of both passive and active ftp ?  I would prefer to just
> > > use active .. But

> > ip_conntrack_ftp does handle both passive and active ftp.

> Any thoughts on my last question ?

As far as I see, Antony answered your last question : both passive and
active ftp are handled.
Or am I missing something ?


Gr,
Rob



