From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: simple nat question
Date: Tue, 2 Jul 2002 22:47:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070222473004.03048@Lms>
References: <Pine.LNX.4.30.0207021225140.7072-100000@gilgamesh.eos.SilentMedia.com> <02070222133202.03048@Lms> <20020702201814.NUXP16050.mta01-svc.ntlworld.com@there>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020702201814.NUXP16050.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Ben <bench@silentmedia.com>
Cc: NetFilter <netfilter@lists.samba.org>

On Tuesday 02 July 2002 22:18, Antony Stone wrote:
> On Tuesday 02 July 2002 9:13 pm, Jan Humme wrote:
> > Ain't this what masquerading is all about?
> >
> > # iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> Are you asking about the difference between MASQUERADE and SNAT ?

No, I just wanted to point out that masquerading provides an easy way to get 
the desired results.


> If so, the answer's not a lot, except:
>
> 1. MASQUERADE checks the address of the interface for each packet it
> translates, therefore it's better for interfaces with dynamic addresses.
>
> 2. MASQUERADE checks the address of the interface for each packet it
> translates, therefore it's slightly less efficient for interfaces with
> static addresses.

Hey! I didn't realize that, thank you.

On the other hand, taking into consideration the elegance of a one-line 
masquerading rule (one test) vs. your 4-line solution (more tests), would you 
still argue that a masquerading solution is less efficient?

Jan Humme.

