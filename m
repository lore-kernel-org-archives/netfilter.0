From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 18:01:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061701.g56H1bA32071@vulcan.rissington.net>
References: <Pine.LNX.4.44.0206060953560.15592-100000@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206060953560.15592-100000@wookie.shorewall.net>
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Thursday 06 June 2002 5:56 pm, Tom Eastep wrote:

> Some FTP sites use auth which can cause connection timeouts with that
> ruleset. For safety, I recommend adding
>
> iptables -A INPUT -p tcp --dport 113 -j REJECT

Yes, good point.

I'm thinking of a way to get IDENT requests classified as RELATED, so you can 
either do this without leaving port 113 visible by the RSTs it sends, or even 
get the IDENTs sent through to the original client for it to deal with....


Antony.

