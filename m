From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias
Date: Mon, 3 Jun 2002 21:37:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032037.g53KbHA20127@Networker.rockstone.co.uk>
References: <20020603195921.84898.qmail@web9908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603195921.84898.qmail@web9908.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Monday 03 June 2002 8:59 pm, "J=F6rgen" Danielsson wrote:

> Is it inpossible to use a alias in a rule. With that I
> mean refer to a interface called eth1:0.

Correct.

Why do you want to refer to the name ?   If you want to specify the interfa=
ce=20
a packet is coming in on, use the plain name (eg eth1).   If you want to=20
specify the address a packet was going to, use -d aa.bb.cc.dd

I can't think of another reason you should need the interface name.


Antony.

