Received: from mx0b-0019e102.pphosted.com (mx0a-0019e102.pphosted.com [67.231.149.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181A63C7
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721874574; cv=none; b=p0Lup2+eoVqDgcGlegruF4jjT9psLGyX1z6toHpNfi1rdYr/2GNU7g34fgvHUoG7UG7lmgkS2cFXfBRxlG8KQLwUQ2TNeaKOE2vCZ1R67iO41B5joKyJB3xJQNi2v3ZH60lqrc5ZBTr/R28hcWnB9S5q55FagpBz5Kp4rLTbbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721874574; c=relaxed/simple;
	bh=AKui3wk9kZoKziBQrepL6remeXj6fGqRmvQet8EY83E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THYOr0qab4+FI3+g/guMxQITfOp8dHh3Ufy5j4KYctPhKUUAg/yynHvx//VmpU12VylI85oR5Q24XraAeErj6IWR3wNzYFE1miYOT2jLolJY75mdQVntPjqnySLEhrcQZyWtzQlaqDDcsy7dUN5Lz0FMs9E9ZuP15DpVHMPbDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com; spf=pass smtp.mailfrom=motorolasolutions.com; dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b=bJoYFpZ1; arc=none smtp.client-ip=67.231.149.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b="bJoYFpZ1"
Received: from pps.filterd (m0074412.ppops.net [127.0.0.1])
	by mx0a-0019e102.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46P1VVaV027091
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 02:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorolasolutions.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=PPS--2020-03-17;
 bh=3CLsOpDKzZ4Wa3X/DD/coz6LdRt04YGHkClEcR3SHtc=;
 b=bJoYFpZ1zOvVoSwIFb7YUuFv3HCAo/tIKnSqQV1Oxz/8IUYdAcTpsD5C2C1kFE5z5OZF
 qs3YTnpYiYDKJJl8PhZv9dDqgV+riDVZ1y40vFQ+CXf9Yh28vW99N0bLdcnaK13inoVm
 0z94iP4v5aQd0vd64nzAo7xhb5ph2lVkTeo8ngYVB6AInLJnJ/u2B+RG0LIJSZH3LY5D
 t+ICLYpw1nRvM+HoFGUgk089ev8gA9Cucu/ictrWMHMD5+6IdQtUl3kB0Rt47NY8QnTY
 WU1qWCoutf8IzIDlE9AoeXemtcFu3uFJh3/twF86gVzEYu3yS1982d8/5J7eOedcQuNi Tg== 
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0019e102.pphosted.com (PPS) with ESMTPS id 40jd0gne91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <netfilter@vger.kernel.org>; Thu, 25 Jul 2024 02:29:32 +0000
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d93f4b2832so528885b6e.0
        for <netfilter@vger.kernel.org>; Wed, 24 Jul 2024 19:29:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxEVnTVq+36XuqtXmg+NygLmntCLH6fSs2A/sMAqpMFUfdJ+VV+
	SIDfUtbgMeI4ik8gk2DALyZqLrfHP4T9onMGjEQ/fNPKUg/mfY6aLooYmC2nmarOaX+IEpL0nL+
	uneMRI5Hchd28C8NcVOI1V0isUp4r+GUabdcesukXBeIK/UNyY4MCKHY5Uer6obZtVAM4mQ5xq4
	nUiKMuNi/GqPlyGq4pxOVrgDPwha1eHi66wDuKKIp+dy0=
X-Received: by 2002:a05:6808:9b8:b0:3d5:64be:890c with SMTP id 5614622812f47-3db140be366mr626146b6e.17.1721874570647;
        Wed, 24 Jul 2024 19:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIK84/zs2Fmo33vhx89tK/O1BuavOIP1zLIMv/TUhnJyAbhzFbEX+PJHsqeIohBYe36j4tlHs0xF/RtO8Mu78=
X-Received: by 2002:a05:6808:9b8:b0:3d5:64be:890c with SMTP id
 5614622812f47-3db140be366mr626140b6e.17.1721874570314; Wed, 24 Jul 2024
 19:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
 <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com> <20240725021904.GA13051@breakpoint.cc>
In-Reply-To: <20240725021904.GA13051@breakpoint.cc>
From: Tom Isaacson <thomas.isaacson@motorolasolutions.com>
Date: Thu, 25 Jul 2024 14:29:19 +1200
Message-ID: <CAMp_5HZL85o7frtb+JSw6sq+uLT8V3St0Asz+Z5zqW529UaCMg@mail.gmail.com>
Subject: Re: Unknown option "--to-ports"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LZzil2BT5oqWtJJPfrfwsHSxR3VU16xK
X-Proofpoint-GUID: LZzil2BT5oqWtJJPfrfwsHSxR3VU16xK
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250013

I don't have strace on the device, it's pretty minimal. But
libxt_owner.so is present here:
/usr/lib/xtables/libxt_owner.so
along with all the other files.

The installation is from Yocto:
https://layers.openembedded.org/layerindex/recipe/300425/

On Thu, 25 Jul 2024 at 14:19, Florian Westphal <fw@strlen.de> wrote:
>
> Tom Isaacson <thomas.isaacson@motorolasolutions.com> wrote:
> > >     Sharing Internet using method: nat
> > >     iptables v1.8.7 (legacy): unknown option "--to-ports"
> > >     Try `iptables -h' or 'iptables --help' for more information.
> > >     Doing cleanup.. done
>
> Broken iptables installation.
>
> > > The offending iptables commands are:
> > >             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> > > ${GATEWAY} \
> > >                 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DNS_=
PORT
> > >             iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
> > > ${GATEWAY} \
> > >                 -p udp -m udp --dport 53 -j REDIRECT --to-ports $DNS_=
PORT
> > >
> > > I searched around for a solution and found
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__community.unix=
.com_t_iptables-2Dv1-2D8-2D7-2Dnf-2Dtables-2Dunknown-2Doption-2Dto-2Dports_=
385377_3&d=3DDwIBAg&c=3Dq3cDpHe1hF8lXU5EFjNM_C93KOmcBXCBnhee2v6PYlc&r=3DMO7=
EWU3DamJNNM8h6vHmeK6CEry2ufcorA3OreLf9oSJJvfzyukEHrKjEuU65HDv&m=3D3pEifEeIB=
aWYzhy_9MSuLYFwj7s1hDnpv2ftIP8xg0VZA5QWqX6RKTC79F1ylozp&s=3DsBy-V0FVFtnFXyv=
zNpVWO6IaPMyAYTyauL9S5RRjQrk&e=3D
>
> This has all diagnostic commands that you'll need to figure out whats
> happening.
>
> > > but this command also fails:
> > >     # iptables -A OUTPUT -m owner --uid 0
> > >     iptables v1.8.7 (legacy): Couldn't load match `owner':No such fil=
e
> > > or directory
> > >
> > > iptables links to xtables-legacy-multi but it seems to have all of th=
e
> > > necessary files present.
>
> iptables says it can't load match 'owner' (libxt_owner.so).
>
> So its either missing or iptables is searching the wrong location.
>
> strace should tell which directory iptables is searching to fetch
> extensions.
>
> Some embedded distros split packages into subpackages to save space,
> so it might be missing package too.

--=20


*For more information on how and why we collect your personal=20
information, please visit our Privacy Policy=20
<https://www.motorolasolutions.com/en_us/about/privacy-policy.html?elqTrack=
Id=3D8980d888905940e39a2613a7a3dcb0a7&elqaid=3D2786&elqat=3D2#privacystatem=
ent>.*
