From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: capture packets before netfilter
Date: Sat, 29 Jun 2002 21:22:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020629202219.MNCI16050.mta01-svc.ntlworld.com@there>
References: <3D1E163C.6040106@snafu.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D1E163C.6040106@snafu.de>
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
To: netfilter mailing list <netfilter@samba.org>

On Saturday 29 June 2002 9:19 pm, Axel Christiansen wrote:

> hi,
>
> how can one capture packets before
> netfilter throws them away.

What do you mean by 'capture' ?

If you mean send them to a user application, have you tried the ULOG target ?

 

Antony.

