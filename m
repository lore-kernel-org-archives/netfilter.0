Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3470E95A99
	for <netfilter@archiver.kernel.org>; Mon,  9 Oct 2023 04:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345053AbjJIEbK (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 9 Oct 2023 00:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345030AbjJIEbJ (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 9 Oct 2023 00:31:09 -0400
X-Greylist: delayed 384 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Oct 2023 21:31:02 PDT
Received: from cat-porwal-prod-mail1.catalyst.net.nz (cat-porwal-prod-mail1.catalyst.net.nz [IPv6:2404:130:4080::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87002A4
        for <netfilter@vger.kernel.org>; Sun,  8 Oct 2023 21:31:02 -0700 (PDT)
Received: from alasdairmuckart-lp.catalyst.net.nz (unknown [IPv6:2406:e001:a:ce00:c1a8:144:7b4f:d93])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: alasdairmuckart@catalyst.net.nz)
        by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id DD7A281A0B
        for <netfilter@vger.kernel.org>; Mon,  9 Oct 2023 17:24:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
        s=default; t=1696825472; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=MWVRC9m+kHlIZ0NQrAa2+hhdHgZvmwPy5XUaEYsuYbM=;
        b=SPnPMJoDuBKKDEWb8H/FsjSP5zJkMko+tgy6z5R5K/JRP7alEYhPvkhgd+vWbGb2/lt4iZ
        LEmkE9Y3cjpBFzy9fnUK2Y5GBEozJMuH0u6AICOE1ecxN2cBiNurMI85qf+TfoJb7ZO7Q1
        AjRKPLyp+gxnJTRs09g+ZMbmlqSc02i2vMSDF7/CtrOTB/eaBjDcbxF1uqQac7C+pD+50h
        4n/80k6feIsJo7zaNGw2821by2EwOWpXfEnGCV6PZbS/gTbsg1Nwm76VAwcanE7NAI0nfE
        sCtrBIv1xDJQgrGnAPAABXD9BapuEw7XljAq/aYBJufIcI8SsB3DGonAzozbSg==
User-agent: mu4e 1.8.7; emacs 28.1
From:   Alasdair Muckart <alasdairmuckart@catalyst.net.nz>
To:     netfilter@vger.kernel.org
Subject: Typo on 'Sets' wiki page
Date:   Mon, 09 Oct 2023 17:23:03 +1300
Reply-To: alasdairmuckart@catalyst.net.nz
Message-ID: <87edi4s9s6.fsf@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=alasdairmuckart@catalyst.net.nz smtp.mailfrom=alasdairmuckart@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00];
        MIME_GOOD(-0.10)[text/plain];
        ARC_NA(0.00)[];
        MIME_TRACE(0.00)[0:+];
        ASN(0.00)[asn:23655, ipnet:2406:e000::/29, country:NZ];
        DCC_FAIL(0.00)[failed to scan and retransmits exceed];
        DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
        MID_RHS_MATCH_FROM(0.00)[]
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

The wiki page at https://wiki.nftables.org/wiki-nftables/index.php/Sets see=
ms
to have an error.

Under the 'nftables.conf syntax' heading it says
"When working with nftables.conf, you can define sets in a number of ways. =
You
can then reference those sets later on using $VARIABLE_NAME notation."

Shouldn't that be an @, not a $?

Thanks.
=2D --=20
Alasdair Muckart (he/him)
Network Infrastructure Architect
Catalyst.Net Limited - Expert Open Source Solutions

Catalyst.Net Ltd - a Catalyst IT group company
DDI: +64 4 897 7794 | Mobile: +64 22 638 5141 | Tel: +64 4 499 2267 | www.c=
atalyst.net.nz

CONFIDENTIALITY NOTICE: This email is intended for the named
recipients only. It may contain privileged, confidential or copyright
information. If you are not the named recipient, any use, reliance
upon, disclosure or copying of this email or its attachments is
unauthorised. If you have received this email in error, please reply
via email or call +64 4 499 2267.
=2D----BEGIN PGP SIGNATURE-----

iQJUBAEBCgA+FiEEu4g3jwJ68cPCdgH9iBAgH4ERwwMFAmUjgHkgHGFsYXNkYWly
bXVja2FydEBjYXRhbHlzdC5uZXQubnoACgkQiBAgH4ERwwNTyxAAhJIEFRIUeU7b
Gz9Lq9Z9Wbf0aDnwM3PNpzkFtV1Jwy1eM/hnqjF6bcxTYadLsN8f+og8C+tYb8so
DdV0ocFRy+/vKwh7rIyx2e9zGbAj2s5PdUwu1okPOfcYQG6g4eiUtj4+yGc0P2Qt
eG2cyOhMZnLsC21n4kjFMIjy969vAcGQMGhD5jE/r58ELNKWI8MXfXQ32Pk0PlYF
50JD4NN0+4mU4BKkGb2tOx4hslODjuzoBm9VTRPAS3hmgGsgDXfFkQJVSakG89S7
qeYTlTPO/BF6ccGouaSSeggPvs2xPV0CPaGIOjF5qrUI1leZo7+pbIRdvZ/5E1a7
wrK3/lIVSTYfrbw3X7H+Bvi8croyqxOhnTnzvl9bWoWju8M2Omst0ydOxhgaoIkf
syLT7SMLLCy4/rDraZi4+FDDyotu5pt+qRKv2jMBRXdr/Z4/pzNNtRgomszhNDh0
Su+Kih58SiLD/6PW/Lk7cOzCcVDz7o/s6aocbRu/gmLY9yTEYXXj724nkl4//Kv5
LYfU18TqcnvMaiRWFU6mobvaceVePWGHTZ6qu6SK1K/iDauCrEWZUgW5IcpueaCF
+oAOu6mJxduCRMYvmUMJaJKD5dRT//q5F21r59D0y4fxvETtGcDYwTHJveHf9Mgj
+ATR28FWlN1mTY4Sur6nWe3dhZTEQZI=3D
=3Dy6eb
=2D----END PGP SIGNATURE-----
