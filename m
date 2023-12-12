Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dyu/63Nx"
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD771A8
	for <netfilter@vger.kernel.org>; Tue, 12 Dec 2023 08:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702398910; x=1702658110;
	bh=v0ujrGwgmfCp+G1xmUXQO5whSuQy2eJjRmtglfjuRAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dyu/63NxRHy7pq1J6Lzi8/EatzGWke/GvzW+OBOuXEhJ9qV8Yn6BIcYprskTJbqCW
	 AOn5ytY4PtwLZdzj68Rq+aA59JQbraEFpmTYw7L71W3UtV7TzFpzqSkXQMDOpSfXEI
	 FVEb1Ex50VayW9vPtQBTfzGdqAc84gzi/THLOLjDk+t0VIksKZbFU3m/r2W65xlSzE
	 Npu3EgjLUxpzY6SFumUumPsiiMYbEm5Rqsd+PLtdsXax2BztnnnLUIsCGbCpziEdIo
	 O642A5ozeiFSycBymchUE9bj4/iA6xW27vMhGtzPPuJs2dJnKxdavstlF2/rmVnkc8
	 dBnqURomu2SyQ==
Date: Tue, 12 Dec 2023 16:35:05 +0000
To: ye4 yu3 <ye4yu3@outlook.com>
From: Eric <evil.function@proton.me>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: nftables problem consultation
Message-ID: <zg20uRQPjgqpXOGX2T-AaXxj14SLjreS1CgEezKdQ8MOE_u_H3zY09OM4qYxEjKF_LJW6yrotM0eChbOChTIYLH_PnO7YmemsBXMvdz1b0U=@proton.me>
In-Reply-To: <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB5044183AE828E0A504D4014ACB8EA@PUZPR01MB5044.apcprd01.prod.exchangelabs.com>
Feedback-ID: 48716100:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 12th, 2023 at 05:25, ye4 yu3 <ye4yu3@outlook.com> wrot=
e:
> I have a question regarding the egress hook of nftables, I want to make m=
odify ip packet source or destination port on egress hook, I use this rule =
in egress chain (tcp dport 80 tcp dport set 8080) it successfully loaded,bu=
t it didn't have any effect. if i only
>=20
> modify ip packet source or destination address will have effect (ip daddr=
 10.0.0.1 ip daddr set 10.0.0.2),i use set port rule on any other hook and =
it works include ingress,I don't know why the egress hook is ineffective,pe=
rhaps there is some way to solve this problem?

Hello Ye Yu,

First, do you have kernel 5.16+?  That is needed to get the egress hook fun=
ctionality (I assume "yes", since you are not getting an error when you add=
 your rule).

Next, how are you verifying that it doesn't work?  Are you running tcpdump =
(or equivalent) and watching the packets come out of the specified interfac=
e without the port translation?

Finally, I have not seen the egress hook used to do port translations, typi=
cally that is done in the inet/ip tables using the prerouting/postrouting h=
ooks with NAT rules.  Are you trying to do something that specifically requ=
ires the use of the egress hook? =20

https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Hooks_by_=
family_and_chain_type

Eric
