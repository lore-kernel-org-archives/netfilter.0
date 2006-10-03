From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: how to unblock connections coming from a NAT boxB
Date: Tue, 03 Oct 2006 09:43:17 +0800
Message-ID: <359840032.09438@mail.nankai.edu.cn>
References: <359556648.06377@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <4521C035.40309@mail.nankai.edu.cn>
In-Reply-To: <359556648.06377@mail.nankai.edu.cn>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Vidya Ravipati :
> I have a question regarding how to unblock the incoming connections
>  from the source NAT box. If I have source machine behind the NAT ,
> how should I configure my iptable rules to unblock the connections
> coming from that particular host only. 1) How should I specify my
> rule to unblock only particular host behing the source NAt only
> 2)How to unblock the particular host behind the particular NAT box
> (can allow the connections from other host behind the same NAt
> also)
>
> Thanks
>
> Vidya Sagar Ravipati
I am sorry , but I can't fully understand what is your problem .
So I just guess the situation :
You hava a machine which is connected to the Internet and a LAN .
You want to block some machines in your LAN from accessing the Internet
and meanwhile allow some of them .

Am I right ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFIcA17tZp58UCwyMRAq++AKCT61JlBuMokhFjqrvfgdb5APY7iwCcCn3Z
hTaMkctgXx9CcabkSlmtTsQ=
=BKQE
-----END PGP SIGNATURE-----


