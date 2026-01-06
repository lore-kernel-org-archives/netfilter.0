Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593B312807
	for <netfilter@vger.kernel.org>; Tue,  6 Jan 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715364; cv=none; b=d/420VxZyjIjG9l29FtAAtCW7fQPEPY4lGUjza9t4JdE+ryS4AgP1QAGexXsFJP+n0AmscNyd9eY5euOrH4Ma6lRM2WgD7gS5/oUaXrg674LfTgUcEr6YiOYfB3CvVGJDcXvj1S742cQvrvxVhRNqKTB1DrKihI5BQckqMZ6UbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715364; c=relaxed/simple;
	bh=5xJgT7TGXHas2iq4P7TGXj7StkTKrjHbZ9ltkYoFTC4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=m22hdKYlCZgWWiG3ySeAo8rlHQ6erPSIe9SPJVD98IAEcmAtS96DH2f8wHVBaqWwtOzMpedRkU4o9W0GCEKIwDKNDvNzg8ulTr1ncREItnoFj0wUSmOGbdmEcsBmhl2Nx5ki3deZIgbwmfSSnukNOqx3OV3Z4Gb9EZ7hEYls1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=GkA5d0fw; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=lLn8mQKz; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="GkA5d0fw";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="lLn8mQKz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=uHkBUSmrO6WDeqGWC64eIRcLOEHnTuu24uZb2hpmo84=;
	t=1767715359; x=1768924959; b=GkA5d0fwNzhu7PXqsyj5X7sGTdRyqA1h4D8esYaMkM5VGcU
	/RFfCNFQb1DeaYj3myg1JMSu6Pm1NzIik8B2Dqm3OhRP/z9rNPpVHbD8wW86agmYxmwwjGuGbHZwd
	/xslFjtf1LWOtAjX0aN+BoVfV6w0yb0FAJSdwVwoM58jjQM=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=uHkBUSmrO6WDeqGWC64eIRcLOEHnTuu24uZb2hpmo84=; t=1767715359; x=1768924959; 
	b=lLn8mQKzxXnVVaJ6obg+oo7NzWXDxz3msKyyxQLD/QDU4IFFyBBzWwOenSLbDpNOOfBQ3rd0ZH1
	koJ1zFp78Cw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1vd9Mb-004mdE-33;
	Tue, 06 Jan 2026 16:52:54 +0100
Date: Tue, 06 Jan 2026 15:52:49 +0000
From: Slavko <linux@slavino.sk>
To: Dmitry Konishchev <konishchev@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Dangerous examples in nftables documentation
In-Reply-To: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com>
References: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com>
Message-ID: <E1B33049-8304-4686-8806-56D7F5AF54F8@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 6=2E janu=C3=A1ra 2026 14:47:01 UTC pou=C5=BE=C3=ADvate=C4=BE Dmit=
ry Konishchev <konishchev@gmail=2Ecom> nap=C3=ADsal:

>Hi! Recently I've faced a problem: I have a rule that drops all new
>TCP connections which start not with SYN packets:
>ct state new tcp flags !=3D syn counter goto bad_tcp_new_packet

You are right, the SYN packets are commonly used with some
other TCP flags, but did you realized that examples are just, ehm,
examples?

>So `tcp flags & (syn|ack|rst|fin) !=3D syn` should be used instead of
>`tcp flags !=3D syn`=2E

You are right, the `tcp flags !=3D syn` is harmful in most cases, but it i=
s
not as simple, as one can think, it can depend on what rules are
applied before=2E In my case i do early drop of packets in invalid
state, thus SYN+FIN nor SYN+RST will not appear latter=2E How useful
is then to check these combinations? (more typing =3D=3D more typos)=2E

Note that match:

    tcp flags syn

Is the same as:

    tcp flags & syn =3D=3D syn

Thus it doesn't takes other flags into account and matches (or not) just
on existence of SYN flag, which can be what one want, but not in all
cases=2E

>The problem I see is that the official documentation suggest unsafe
>matching in its examples without any warning:

The official documentation is as it is, but it is not TCP tutorial nor
firewall building tutorial=2E In most cases it is just demonstration
of nftables syntax=2E The valid TCP flags combinations are docemented
in kernel sources, it will be redundant to repeat it in nftables (except
point to right source file, as it is hard to find)=2E

When one goes into more depth (than filter on src/dst address/port),
then must understand how it works, what is in RFCs, how real SW
implements it (often two different things) and what is wanted=2E And
when one will understand what he/she want to do, and how to do that,
then he/she will not trap itself in Ctrl+C/Ctrl+V problem ;-)

BTW i have own notes about TCP flags syntax in both, the iptables
and nftables=2E I rewrote these nftables notes multiple times, in hope
that it can be both, complete and not overcomplicated -- without
success :-D

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
