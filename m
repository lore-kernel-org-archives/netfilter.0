From: Borislav Petkov <bp@alien8.de>
Subject: v3.8-rc3: uninitialized warnings in net/netfilter/xt_CT.c
Date: Thu, 10 Jan 2013 12:18:21 +0100
Message-ID: <20130110111821.GA23008@liondog.tnic>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1357816703; bh=yJhlrEx2vMDfbd7kGrABhp8yd1j03lVzDmv27+nN//E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=f3swQZj8iVPY9IEF86OROOp0RFRCvfxZINNL4
	XqPpIoMjAx80ffKZ2tlkIJ7Sc8fJYta1CH+E2tlFa7oKR2su8Jr2thUBOZcQxi1I+1k
	qrKoUXXUfj8t5b4sVFKXTSH5eGnMEg3a5N/iLRNIwYeErqhc+VryWd9LuPRLHKzazdM
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1357816702; bh=yJhlrEx2vMDfbd7kGrABhp8yd1j03lVzDmv27+nN//E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=pOTYRPInjo+Edy1Z+jV0uHdz9tL1E+s0ekikC
	pKA2HPGtBjG/FnYnYFVow5MNLASG04uJFdU37hoqa6jDO+Sk+q8Jk8J4eMtQznxU63M
	o9wjh6Wsegt4cEIPTbB4YtBtXgYA91v7rZ46AzCjBJHfqTHn3RrXNMSnCFkanbD4DD0
	=
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org
Cc: lkml <linux-kernel@vger.kernel.org>

Hi,

I get

net/netfilter/xt_CT.c: In function =E2=80=98xt_ct_tg_check_v1=E2=80=99:
net/netfilter/xt_CT.c:250:6: warning: =E2=80=98ret=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
net/netfilter/xt_CT.c: In function =E2=80=98xt_ct_tg_check_v0=E2=80=99:
net/netfilter/xt_CT.c:112:6: warning: =E2=80=98ret=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]

when building 3.8-rc3 here.

And this time, the warnings are real:

static int xt_ct_tg_check_v0(const struct xt_tgchk_param *par)
{
	struct xt_ct_target_info *info =3D par->targinfo;
	struct nf_conntrack_tuple t;
	struct nf_conn *ct;
	int ret;

	if (info->flags & ~XT_CT_NOTRACK)
		return -EINVAL;

	if (info->flags & XT_CT_NOTRACK) {
		ct =3D nf_ct_untracked_get();
		atomic_inc(&ct->ct_general.use);
		goto out;
	}

#ifndef CONFIG_NF_CONNTRACK_ZONES
	if (info->zone)
		goto err1;
#endif
=2E..

ret doesn't get initialized and if the first two if-blocks are false an=
d
CONFIG_NF_CONNTRACK_ZONES is not defined (as is in my case) we do "goto
err1":

err1:
        return ret;

which returns an uninitialized 'ret'.

Now, I don't know the code to know whether if (info->zone) is ever true
but someone better check this before subtle bugs start happening.

Ditto for the xt_ct_tg_check_v1() function.

Thanks.

--=20
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
