From: Martijn Klingens <mklingens@ism.nl>
Subject: Fwd: Re: NEW vs INVALID
Date: Tue, 1 Oct 2002 14:17:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210011417.56637.mklingens@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Since I messed up initially by replying personally (grmbl... some mailingli=
sts=20
set a reply-to header and some don't and I always mix them up) it's at leas=
t=20
fair to forward the reply here again...

Martijn

----------  Forwarded Message  ----------

Subject: Re: NEW vs INVALID
Date: 01 Oct 2002 14:05:39 +0200
From: "Jens Lechtenb=F6rger" <lechten@wi.uni-muenster.de>
To: Martijn Klingens <mklingens@ism.nl>

Martijn Klingens <mklingens@ism.nl> writes:
> >  "--state NEW --tcp-flags SYN,ACK,FIN,RST SYN"...
>
> This makes quite some sense, but it makes me wonder what the use is of the
> '--syn' option.

There is a followup by Anders Fugman stating that SYN+FIN is a
request for a connection that should immediately be closed...

> Also, does that mean I have to update my firewall script if I
> want to achieve tighter security? I guess so :(

Probably...

Jens

-------------------------------------------------------


