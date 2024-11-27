Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A51DFFB
	for <netfilter@vger.kernel.org>; Wed, 27 Nov 2024 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712553; cv=none; b=oRJZAs4lfsbxacfreqO6TFg7O4UfmCOquuQSEzTIecMG+ZgpSoRtHLacFNSQtX2VNyYNMLur3IZ+68iGxOxm4qeuXLXqroX/S9XaTbcV0zUgXt4MEOAhsHwn4uYBIvEJIbx+uljO0VriiWClrHSb/7Xm8j/7e//hQKxEBbyASnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712553; c=relaxed/simple;
	bh=CHHsMu5FWQqwIE3G0w5UK9RgDaJqH5CazhEJEy0GFX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLmgPYObt+jcxOC7BwCGnjVDeKaz+7vGN5+Lqclyv+b8b4W8Oj1ih2m55YkwtRPKWnfErZ84hTk1+5yq0W0uZ8yMdmXqNOD9jPtp/yaoXw7syq3nYS1ws2ewNibXHgoL+PovsaSAinnCKvtHGgezMbeIyzN3GnrD/qRR+W9ZrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLQB992Y; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLQB992Y"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0062e9c80so8529526a12.2
        for <netfilter@vger.kernel.org>; Wed, 27 Nov 2024 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732712549; x=1733317349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKzSD8XpVfnBPvA3mljVOpuQ+u54op/uXPzqKFFQyEc=;
        b=jLQB992YJ+gVaDzmRaLEPp2ljMtTBtkJaun+38VMQam57iAjwsABcnFoBLpLp7m5px
         QhAKU75MhWTDpS1Ypo8Ju4ffVwqxWVBAYBr2wK3szgcpagvOSZngn5Qpo0WtCjQd6qgL
         lK4MRTfZfPD0lOzgtTGeo2Dsm/VxK4GY3TwDZnZ9GmpM3esyOIlJO6Z/R1AHQ94BAcdQ
         TzeQnMyxiOo3KSB6vm231DfBeJO3teXAN00+LvGv8POx5BNEi7WwxFrE30lBcEwQdZ0V
         FiiKoCRLz59aXPP1Q6GdKoq9Ockfj/1jVYgz+JxZQ+912lo7sZ4Q4HQfXNYccKk6E5+y
         GEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712549; x=1733317349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKzSD8XpVfnBPvA3mljVOpuQ+u54op/uXPzqKFFQyEc=;
        b=RNVMueNty2ExueowmIFLuXYhlSccvZ6jOuUKLUqNuinpSlNjcWytXutkGhZfUgAY7t
         in3QBLZ6cp9k2GJyG1Z7YdycnS2eXSbR+3q53xmMQeAI1zq2nL0IhPJBK4mF0akkgiT/
         N7tgzYebZMkl5FKOqE4pkrGFQI5X0eCVZqPNjmXajXlEx6PLHnvvnZ7+el+0Gw0XP38M
         hKQFfMgQU+KEUSTJwgspwfQBaDHkNnxorfJX/pkbOXFNYOSp/21KwyEUjkj3kR4fnDa6
         rardZgqhKHNuPPFrUYqYre+//nlYvmboErxdjr9Ny/F8FPZqPUy1ZNpkA4Eu8bMrl0LD
         aliQ==
X-Gm-Message-State: AOJu0YwiL+UAegr66ByV7IBj2xn0BEmonTBu3snCagqrdgMmfrkkZuyk
	qNOGPDuCiApF/Gb8VsHH0SdRe/2giIHxPXIGcEGqnNEf1rbZf0TTu+1cYYtJQccxbiTvVOu7Sr9
	O1KbiAo6NqtmLKMhfp0iOQWIxpZw=
X-Gm-Gg: ASbGncsDyqdn1Z3HBndspf7Z7RrehfAZ4qIP6oTKVjgWUasOMdhIsniqDiIdE7npUCP
	lq4Ny2Paa5nqrvEwKW7+nHScLYvpFqkVqog==
X-Google-Smtp-Source: AGHT+IFS3QKeccyB2aMt3vXs6ybNqFG+3lX7mvr3EYaOpAfbQB07qRUidA74cEaomYAbVZNcHCUJ47noYdOoQOyYEdA=
X-Received: by 2002:a05:6402:2692:b0:5d0:81f3:18bc with SMTP id
 4fb4d7f45d1cf-5d081f3194cmr1723168a12.1.1732712548896; Wed, 27 Nov 2024
 05:02:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+ue7ODTfHtt2q6adeg_QUtGz+Ucieh9d5yFSiDDdXnsXzFhkw@mail.gmail.com>
 <CABMULtJAEe+jv6O5qpzqiP1q9o4gDmkCti2D-Ldp10MEh1O2nA@mail.gmail.com>
In-Reply-To: <CABMULtJAEe+jv6O5qpzqiP1q9o4gDmkCti2D-Ldp10MEh1O2nA@mail.gmail.com>
From: Mokhtar BEN MESSAOUD <mbmessaoud@gmail.com>
Date: Wed, 27 Nov 2024 14:02:17 +0100
Message-ID: <CA+ue7OATT6NUtJaB318ZqyzCwD9NeS7D5E4DM53DRNXyuNsnkQ@mail.gmail.com>
Subject: Re: [DNAT] Port forwarding with Port range
To: Alex K <rightkicktech@gmail.com>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried and it does not work
iptables -t nat -A PREROUTING -p tcp --dport 1000:2000 -j DNAT
--to-destination 192.168.1.100:3000   =3D=3D> Ok all traffic received with
destination port in  1000:2000  is redirected to 192.168.1.100:3000

but iptables -t nat -A PREROUTING -p tcp --dport 1000:2000 -j DNAT
--to-destination 192.168.1.100:3000-4000  =3D=3D> does not work : no
traffic is redirected

it seem a known issue : https://bugzilla.netfilter.org/show_bug.cgi?id=3D15=
01
issue with DNAT port range

Le mar. 26 nov. 2024 =C3=A0 18:36, Alex K <rightkicktech@gmail.com> a =C3=
=A9crit :
>
> Yes, that should be possible.
>
> On Tue, 26 Nov 2024 at 4:46=E2=80=AFPM, Mokhtar BEN MESSAOUD <mbmessaoud@=
gmail.com> wrote:
>>
>> is it possible to use iptables to define a rule to make a port
>> forwarding of a range of ports
>> For example :
>> iptables -t nat -A PREROUTING -p tcp --dport 1000:2000 -j DNAT
>> --to-destination 192.168.1.100:3000-4000
>>
>> so traffic for port 1000 will be redirected to port 3000
>> and traffic for port 1000+n =3D=3D> 3000+N
>>
