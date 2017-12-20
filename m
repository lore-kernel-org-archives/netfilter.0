From: JereBear <jerebear@protonmail.com>
Subject: Service names
Date: Wed, 20 Dec 2017 12:53:35 -0500
Message-ID: <s2f_U5oU1R3-NhHkAf-OjCvVn9mFKEMiLC4uFI-JCbJoYkmBX76vkmX2V8QAfHB3zZpotSIXp_jHqiVINeQ3KctRFaRKxaa5Q_S53QQytNs=@protonmail.com>
Reply-To: JereBear <jerebear@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1513792427;
        bh=mv3+XHOQLHwqkyNJq/JYTD8JOhZR0IiCtG3fsz69mKk=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=vXjAsKyfkWnHSXtuGTQ1WGMjhWia8G7Ns13Rp7SXoMlhPHfJIOV2XVPwxwV/Snr4G
         oVu3vjraL57VVqZS0HhJ9OaLNq4W5qDj5VGQc6Af+kyN+FBK/DW+431qlHMhlshs9L
         dLdCNEJsoPdFzRTnumS/N6aNNYfGSdAcdFzyAFUw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,=0A=0AThe nftables 0.8 release notes [1] state:=0A=0A> * Replace getaddr=
info() by inet_service internal lookup table, we don't=0A>   rely on /etc/s=
ervices anymore, so we have a predictable input from the=0A>   parser side.=
=0A=0AQuestions:=0A=0A* Is there some way to view the name-to-port mappings=
 exposed by inet_service, aside from digging around in source code?=0A* Is =
there some way to provide insert custom name-to-port mappings into the inet=
_service lookup table? Or is this a terrible, horrible, no-good idea?=0A=0A=
Thanks,=0A=0A-Jeremy Audet=0A=0A[1] http://www.spinics.net/lists/netfilter/=
msg57664.html
