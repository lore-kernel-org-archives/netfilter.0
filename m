From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: Re: PPTP through masquerading gateway
Date: Wed, 10 Jul 2002 08:10:53 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001101c227d8$8e5094a0$0401000a@win2k>
References: <000201c22798$f2ffd540$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Rowan Reid <rreid@studio3arc.com>
Cc: netfilter@lists.samba.org

----- Original Message ----- 
From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through masquerading gateway


> First off thanks for taking the time.
> 
No problem. Now I know that we can upgrade to a newer kernel.
I didn't take the time to test it before this.

> ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html
> 
> I'm assuming you used the above patch with the
> 
I used another link, but yes : it's the same file.

> zcat patchfile.gz | patch -l -p1 
> 
> Patch this is the only way I got it to work.
> 
Also correct.

> My test situation is basically two networks 192.168.2.0/24
> And 192.168.1.0/24 with my Firewall playing router. I test
> From a single machine on 192.168.1.0/24. knowing that you got this
> To work I'll put some more time into trouble shooting it.
> 
Success !

Rob


