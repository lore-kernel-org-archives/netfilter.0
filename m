Received: from sonic304-24.consmr.mail.ne1.yahoo.com (sonic304-24.consmr.mail.ne1.yahoo.com [66.163.191.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E62868AB
	for <netfilter@vger.kernel.org>; Wed, 13 May 2026 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677793; cv=none; b=uVOVqSCvZGgXQX12sRuN4Vu5etqbIaK901ALi1cVvCZkRmwm9WDaBOEt56xTacVnJJotNBqwHIYzeFQlLmeFkUgUFZGfXBPCDHyYH24JrHh0yGzIg0ihIiRhiNllZqNRWhBp34iJ89SmhT+ROJ4SM1TBomiEFHvZx3V41xePkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677793; c=relaxed/simple;
	bh=aBlxNC8fngA3i1kEgc7omHZKSAUFPIoYPvFonWs0K38=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type:
	 References; b=QqnT4DFJuMixwCWCWOD613L0bBqd+54+jSB7/Mf/1EYITjNzkNJm+OcgT0lytlFFwLFGYzLcLIYX7wb6uFHVVLsF+psyvvDz68zEWTLdU7/pZ6us88bi8PnBK7ODV7uNMqhwW/G7mRLR3MSid46M+GF1xOquZEvHMx6z2dRtcfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=UvKLH7/V; arc=none smtp.client-ip=66.163.191.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="UvKLH7/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1778677791; bh=I/9U/+b+JjzKU5oxwC95YL9nz3+mvBzYTODOKHFPjFs=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=UvKLH7/V6RUw8SP4GVwPXjLHeZ0l4BJxewClRA4/Dut6xmmxpNNAbx8t66M4UtbKDFRU7XGa3plfz5875HDdD/C+r2NtfZm4smDCoPFLPtZGfntRyN4979YVZ4Rp4xlbMsE2GQwcyCWkuacHelx+3MY33RjxeSuTCdFMn3VLbXFt6g1arY+3iyox4DWbBJJeO8lOKl5wHaUZ4VQ87/chGTTQvRPzDqk72gdjXxGJm5RhBhObGT+Fp0yDl7jgbYB3tZqfQn5t86Xf4e/f8J6rPALZ0KQmW05Ech66GAKd3jqeWAuXU2AfyrvxAyr4ZvcTWYAh3jp3KwR0ruvEnqkbMw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778677791; bh=M4LjNBP8jPg8sq/jZzfAgCudN+bENJjRQ90Srfe6t3c=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=avkrCyfhFPTPTvXAXQHGO9NDU7FBlZNswIibidxvkE1J53gAb0nP1uoLoEUSQ97b+N+IraAA0D4vTJZmeqUfEeMLKiEhE7VofAosUbI0wc/osxI67DKNUSgMkdTDV5t1NxRLwHPJGLHh5mMd/nVsSwft1BEvqIhRCCki3oVUY97ugb0e2kD5uCHNSgfl9+LPsG2TnebZLZXUPgubUrOY/W7IZeweOQZ5hjuokHw9MiYtdBmy/Yksf9qGg0W/vGjx5ssynW67EBsfjCLvrKl3vhtUn6Z+Ki5MzxLXSPEFK3wsK+GS5UHropnL36i7bj8GLJpFYFz7OjZDlENPAHnpPw==
X-YMail-OSG: sKAmLXAVM1ndnS7Adu5lHET_.4h453NKnj10BaB2Fs4T3RlUjFik8Z0rjN04pl3
 xJBM.Rmk.pSVzK66yliVN8EF07LgY2tTLiUw8whSBMf6EnfUcJVSMkFQfNu8KNC2TegW4eJkr5RO
 33sn5cJ2.VHyFtTL4YS9ouuGJK0DnG5Z0JKLYe7hVhj29maTKkdgmbdUwoPgWkBY8.YrE1onwpmX
 vlAzJKGFTyreLEKlk7TDlDzPRnZ7smprO5VBcwOaYQi5tBvhNiyf5AwYH25mXR0JYkvTpFMEeeIN
 cQL_OKPj4yg.0gdiQ86.U1IoCccGcSCdirShm5OWH_SFzf3ABTontXgUcPUofEC8mu7NYnATOmJr
 jT0T1lYiLMy7WBgGkz5ZA4_itqC47AV._9TJ5yWfruv2j6EXhrmyiIPuy0FfwIeS13CJNFAdX9YU
 jbEXvCggoamV.6n23w826OhgOv9xlBRT7DiDp8IxDxTZrxjOMZulbuIypM0DJIe0fDavqBXcRzDK
 9GP4tZuof68iWW1eu.5qqvw2CPi6UUhYgquOf1GpbwjkJlHemUfZd3T9NkRsxfGwW_MXifGUqBrE
 735lXmb4GjflGRE0ZoLJPO_mOJkaas0ALYWXGNNTZtWR2BSx8dVYEIP9dUV9cZFdYuIVyHvUOC0E
 yEhrZjJ3kAR2EunKdUPrHHfowD0EeTnyaAdxKHHcCVMM5n45TXwvVe5lgIu2A35kl6OfSwXVEUgd
 YpUuO3Eg1oYi354uBoKNUdc0vaDIpI.xVOzNA2.lC4iPQjNGqjZF_1Aa1shkgDehXwCOptjPfq7H
 0UTOzvtPGg7MwsecGAwlKua4s7WqVTFXBGfR6EU1qL77qG_Hq8xEFybUwpQsU2ZZnwB0aaKFo8yU
 2bvHOTe02KQKJcCQHo9WCxAAM9sRYp.MEpPgvKolIo5Td5tXiXbxQqPACvclctMcRiZBNNtxiTwp
 NhqYlLgacQMZ.iRPHY.GFGXjkREeZtSmrSFnnkW4VHTJ3A5l8BL08cKAyV54UN8p7.gI3ZXMoZQn
 jhtGzRFfyxjVurrsrI1_2ZMg78ceHTvljIHZUXLGkXJB5jJsvUOvv1aP3jBFYDddqBBHvGaqZsHf
 INFKJe9xKOXTGuieeNeK.pS.ZWxyXbjPXgRVcVGrTMHOimr5EOxpqF2wtz.qDGJmFiNW30Q4PxJo
 Txrg3BXwlYcWRtTFtKQ7hdJYrKawZotRXsrGFXEqVKfylkhyK7YJlDBMlRerklMMcyoPFUXtG0g6
 himSdLUdLRUXHahwXSOvmLHQzepZvIrEcD8Bys.N7ICS65bLk04c7GQFSYx8NDcwUOo.Pis9NGCa
 UdqXGzTcKRjOt3tXqk35V780z8ATe393Fag2FVUkZyJY2NnVAyULhxt7_BmUW07w20M2aNuVH1yk
 bnqpClVTk1E8wzt4MgJlVRfdwUMCTDO8a7El1bb3DWCAhHF0I7JLYJEiyySVOsGSD8HsOfE3kiA1
 .qlSqjaiGw..HZxgx8mWChns6X_T2HHl8RtDhSfH82ZpRPwU0P.zIrKfU3ozf8S7B1kkvNnwCpDP
 Nm9wrXYLS5zqmOO4.3jvSpBmgXjXrmkDlXUhIJJ8P4lmooisTkdf5ax9bQ1iQj062oH4NaI31JR.
 lpIziO7mq5abK4gpb2Mwn58Q7D2QiF8vPHZ1MMVrFDbQSm03EV5.JIILV3i8GLqE6oS5jIP26U1k
 dU5svhCzIEsA01DnpEcPae07IGM3Uz4hMJ_rD8yhAcJMyGvgo_emAaps42HqKrQh4f9ID7BduO2h
 viMAbFVzfvGJs1JDSG0FLN4zHWw9m.bpOqw0kMwc9OsJd0IL.RxTPfPKe1GrEhMUn.gqCG0igiDG
 CficPIsQ0MjQTDD8BzCHv4c98NptZU4V7OdCyNsoJnGmssybbbzjsZpGQK8nfiFn5ZxWw.kH1SIR
 MtaR1RGYSrG3mQl7NrObaYJIchAmDu9XG6ExzIjRch35dE3z.S4jaSwfozURdffhkQWroNPnpUfg
 Do41cDoFX1VI.2.vplf8JW_fwKmb5iWznL_wo1FLNl8L6YA_O.WU2tr7rSL2mEcAbRY6oD8l.GJO
 RMJ15roMVQjNorTQmBO5GZHJXMTYsYZhI80zL6Y8GyrtiFbKIPHcquM8Vj5wOO6po1wCY2KXn28n
 Rh1vqM.dmSTS6EmQvu9zcBICo1ioEqLiW3F_ZuhrDoNV61WjmNSClBYkC0Ai.YpFPcaa9YI0VOnB
 BzgnkYbDYI4IJmEjM0a5R0mRG1C7AeDI_ZxeSqVC63ahvmMRzRUGF3.f12BkibxmwmZ0E69AVSTn
 D
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: cd3b65e8-8a9a-4781-9c85-d02db5b70be4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 May 2026 13:09:51 +0000
Received: by hermes--production-ne1-57485d68c4-wdz9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2d5976c9b42dc9362ea8c8d8c5dc179d;
          Wed, 13 May 2026 12:59:30 +0000 (UTC)
Message-ID: <7b150c69-75e4-4771-8853-d12731648fa2@sbcglobal.net>
Date: Wed, 13 May 2026 07:59:28 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: S Egbert <s.egbert@sbcglobal.net>
Content-Language: en-US
To: netfilter@vger.kernel.org
Subject: Updated netfilter syntax to Vim 10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <7b150c69-75e4-4771-8853-d12731648fa2.ref@sbcglobal.net>
X-Mailer: WebService/1.1.25725 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Not related to netfilter itself, but display of its syntaxes.

I've updated the syntax highlighters for latest Vim 10.


It is arguably the largest Vim syntax file that I could find in various 
repositories (29K lines), next to my vim-syntax-bind-named.


https://github.com/egberts/vim-syntax-nftables
