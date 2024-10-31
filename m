Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D471BD9E4
	for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730376927; cv=none; b=jt3ZAo8zIeEhH7jnPUxPsVrPfyrrgqQb+tYH6Vun3AQVj3CRQXyfGDjbAD9+cfNUJH2fVfZqSA++sRTkg6PRwwgdvqmXKT2++89ked2hcHFY29todFt5ollgK5gsk4DrAwhllpjQzqMwe3i0Yxfzo4D6GOAlFmyd+ytN0vlMCqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730376927; c=relaxed/simple;
	bh=3HvwRyLJlIkWYEwwnl7T87YBX6sJJRBMFm6UrRvxqB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JsAcbWyKs3Y0Hf9vPZ4JzKBb574rbFT6y/1PpBJ7uV6+f3CyL2knn2m1GuiPuQnLChLIndWAc6Q4CoOju9fZwj+P1SJ3g4Q3/PXxG3sqGNqEensM4pT9IreV6sRLzY4oAt66hwVB3HgJTTJlSF+dHNYeVnWpD4vScy/7I5yRGaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqf9ymGA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqf9ymGA"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fe76e802so1092062e87.1
        for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730376923; x=1730981723; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HvwRyLJlIkWYEwwnl7T87YBX6sJJRBMFm6UrRvxqB4=;
        b=Iqf9ymGAQo3v8TIVWY0bVeUHqpDCp0KnR6G61iQxGSFxdk3QDS0LavI/KwooyeDSqR
         b3v9tEbbir4Gc9UB2xmKy86uTFLLOe0W1RnEf/1HckVsgkpkH2onIT1R+MqdwYqnZJUw
         kxH4WXPERHh7kh/HFaFNEPsB2RjqR9I8lxXoOxN+D71c0Kv5X29231sKGrsC95im1uy+
         zNW0GqpVB9z47TfbUj9GJ1JFyU0dXdiIZmx0OX7AzZlqFRr/z2VNrxZS8N3g8juGCGNL
         JZ09PuJGDjMxobz5QENK7KpQeN/zLxdVpimiCIDAvq3r+XgpsUzOc6/Gge18lPloIILl
         SMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730376923; x=1730981723;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HvwRyLJlIkWYEwwnl7T87YBX6sJJRBMFm6UrRvxqB4=;
        b=XKamn94Sd2Y0NYf8R7vPUrdn9Wf0uO9CTI/m0BUOCZNFVZcGdJ9X8buRBgRMXGXht/
         dOKXYnn2uGw1piZg4+YUALb409wRRNpI2d2oCVNf36O5np7I4MSrh/ezPRcnznxV0d2x
         3tNaebNHZiUq1Byn2yaMMT4oqhry3G07EmT7rHvc8TGjZRIxxR4cbcE5FpjEPuwofEG1
         l7aS/Ap65TfFWn0oJXjUFRVvGhqDnaNiivUyTJ9Zqs8ae/6ky4T+BVCMJwBEm8tieAYm
         X5R9nulQPmUhVwXl3RibRf8HAa1Wv9ARNLJIpjjc1iPRS6Mjp/6cyM4y3ZQKdKhYuVx3
         YT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5yHrvxsCmuHYamQUlLLSx6LdAmCRtJHdpVUahDIlEF++kl59U7aiAqcEDEnMyqowLTv5pFkwTkZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuaxFtfoRmflG+1VGeg0C11ndxcEzrAvBhs2RQqY+/rYZ0KZg
	tA8P76aLNMlQXA5cU2SqcEuN2DWVAj6J8aRK8Xrjaw+c1DNqyh7A3vE7TFvDrzwwDrxjreAzzMr
	MKg5l0Gcj566fmjKSjXNH3Z0A8XIGdA==
X-Google-Smtp-Source: AGHT+IF6rUIHvS6QfsxK1CWy0ZcTXjX7uO6uu2K3U7+1KWuvpEh/MFG6UskX8EjgBNjF6vkeoxqoTNv9ox4hbyKJigM=
X-Received: by 2002:a05:6512:3d8e:b0:536:7a24:8e82 with SMTP id
 2adb3069b0e04-53b348ce9b7mr10095969e87.13.1730376922681; Thu, 31 Oct 2024
 05:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
 <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com> <CAMa3rT6WZXDaUhvfjmWL8+_Jun-2M4zGqr2U4OBig7Z7LrDpgQ@mail.gmail.com>
In-Reply-To: <CAMa3rT6WZXDaUhvfjmWL8+_Jun-2M4zGqr2U4OBig7Z7LrDpgQ@mail.gmail.com>
From: Francisco Agostinho <f.agostinho123@gmail.com>
Date: Thu, 31 Oct 2024 12:15:11 +0000
Message-ID: <CAMa3rT6QeCLyqBp3xWG1gHP2738QgDungCUzJ2C6Sp4OUaoHFQ@mail.gmail.com>
Subject: Re: IPtables rate limiting question
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>*raw
>:PREROUTING ACCEPT [0:0]
>:OUTPUT ACCEPT [0:0]
>:limitban - [0:0]
>-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
>-A limitban -m set --match-set banned src -j DROP
>-A limitban -m hashlimit --hashlimit-above 10/min --hashlimit-mode srcip -=
-hashlimit-name test10 -j SET --add-set banned src --timeout 900
>-A limitban -m hashlimit --hashlimit-above 80/min --hashlimit-mode srcip -=
-hashlimit-name test80 -j SET --add-set banned src
>-A limitban -m set --match-set banned src -j DROP
>COMMIT

>For this ruleset to be loadable, you'll first need to create the ipset tha=
t it references.

># ipset create banned hash:ip timeout 1800

Regarding not mentioning the tables, I was using *nat table for the
PREROUTING and before tried to use the DROP rules on the *filter
table, which was not dropping the traffic.

Ok so the ipset suggestion worked! The current setup that worked is
putting the DROP rules on the *raw table PREROUTING and the SET rules
on the *nat table PREROUTING. Also created 1 ipset for each use case.

Thank you very much for the help!
On Thu, Oct 31, 2024 at 11:54=E2=80=AFAM Francisco Agostinho
<f.agostinho123@gmail.com> wrote:
>
> >*raw
> >:PREROUTING ACCEPT [0:0]
> >:OUTPUT ACCEPT [0:0]
> >:limitban - [0:0]
> >-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
> >-A limitban -m set --match-set banned src -j DROP
> >-A limitban -m hashlimit --hashlimit-above 10/min --hashlimit-mode srcip=
 --hashlimit-name test10 -j SET --add-set banned src --timeout 900
> >-A limitban -m hashlimit --hashlimit-above 80/min --hashlimit-mode srcip=
 --hashlimit-name test80 -j SET --add-set banned src
> >-A limitban -m set --match-set banned src -j DROP
> >COMMIT
>
> >For this ruleset to be loadable, you'll first need to create the ipset t=
hat it references.
>
> ># ipset create banned hash:ip timeout 1800
>
> Regarding not mentioning the tables, I was using *nat table for the
> PREROUTING and before tried to use the DROP rules on the *filter
> table, which was not dropping the traffic.
>
> Ok so the ipset suggestion worked! The current setup that worked is
> putting the DROP rules on the *raw table PREROUTING and the SET rules
> on the *nat table PREROUTING. Also created 1 ipset for each use case.
>
> Thank you very much for the help!
>
> <http://www.avg.com/email-signature?utm_medium=3Demail&utm_source=3Dlink&=
utm_campaign=3Dsig-email&utm_content=3Dwebmail>
> Sem v=C3=ADrus.www.avg.com
> <http://www.avg.com/email-signature?utm_medium=3Demail&utm_source=3Dlink&=
utm_campaign=3Dsig-email&utm_content=3Dwebmail>
> <#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
>
> On Fri, Oct 25, 2024 at 7:14=E2=80=AFPM Kerin Millar <kfm@plushkava.net> =
wrote:
> >
> > On Fri, 25 Oct 2024, at 4:19 PM, Francisco Agostinho wrote:
> > > Hello, I'm trying to implement a rate limiting for my machine using
> > > iptables. The use case is to do 2 things:
> > >
> > > 1) block traffic from the same ip+port combination for 15 minutes if
> > > it gets more than 10 hits per minute.
> > >
> > > 2) block traffic from the same ip for 30 minutes if it gets more than
> > > 80 hits per minute.
> > >
> > > For this I'm currently using these rules:
> > >
> > > 1) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
> > > --hashlimit-above 10/minute --hashlimit-burst 10 --hashlimit-mode
> > > srcip,dstport --hashlimit-name test10 --hashlimit-htable-expire 90000=
0
> > > -j ACCEPT
> > >
> > > 2) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
> > > --hashlimit-above 80/minute --hashlimit-burst 80 --hashlimit-mode
> > > srcip --hashlimit-name test80 --hashlimit-htable-expire 1800000 -j
> > > ACCEPT
> >
> > Why is --hashlimit-above being combined with a verdict of ACCEPT?
> >
> > >
> > > But it's not quite working, as soon as it gets on the list, if you ge=
t
> > > another hit the timer gets reset to the default expire time and it
> > > gets blocked on the first try even if after the expire. So are there
> > > any suggestions on how to achieve the use case or what i'm doing
> > > wrong?
> >
> > I would suggest disentangling all three of the following concerns:
> >
> > - determining whether a rate limit has been exceeded
> > - adding to a set of banned addresses (with attached timeout values)
> > - consulting the set to determine whether a given address has been bann=
ed
> >
> > To that end, consider taking advantage of ipsets. Below is a sample rul=
eset in iptables-save format.
> >
> > *raw
> > :PREROUTING ACCEPT [0:0]
> > :OUTPUT ACCEPT [0:0]
> > :limitban - [0:0]
> > -A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
> > -A limitban -m set --match-set banned src -j DROP
> > -A limitban -m hashlimit --hashlimit-above 10/min --hashlimit-mode srci=
p --hashlimit-name test10 -j SET --add-set banned src --timeout 900
> > -A limitban -m hashlimit --hashlimit-above 80/min --hashlimit-mode srci=
p --hashlimit-name test80 -j SET --add-set banned src
> > -A limitban -m set --match-set banned src -j DROP
> > COMMIT
> >
> > For this ruleset to be loadable, you'll first need to create the ipset =
that it references.
> >
> > # ipset create banned hash:ip timeout 1800
> >
> > --
> > Kerin Millar
