From: Goetz Bock <netfilter@blacknet.de>
Subject: Re: Streaming and online radio
Date: Tue, 18 Nov 2003 01:05:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031118000524.GU14878@shell.blacknet.de>
References: <00ba01c3ad62$9cfa1060$4a14000a@euroi.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00ba01c3ad62$9cfa1060$4a14000a@euroi.intranet>
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


On Mon, Nov 17 '03 at 21:29, Helder C Souza wrote:
> There is someway to block acess to online radio ( like Itunes ) and
> online streaming ( WindowsMedia , Real, etc ).  All this programs can
> go by 80 port and i can=B4t figure out how iptables can solve this .
Not at all, using netfilter that is.

You need a Level4 filter (there is at last one for 2.4 on sf.net and
this on (or a different one, can't remember) is part of 2.6

or you could deny all destinations that over online radio/streaming.
--=20
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

