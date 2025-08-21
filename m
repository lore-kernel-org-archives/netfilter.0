Received: from sonic317-35.consmr.mail.ne1.yahoo.com (sonic317-35.consmr.mail.ne1.yahoo.com [66.163.184.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7142A8C
	for <netfilter@vger.kernel.org>; Thu, 21 Aug 2025 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803267; cv=none; b=eTR7eMFMnS9W8B+uA7PBt/tCLYLwxXVob+C6BmxmvMVDDepU5Js4enXdtBe0i6t1QJq3R6PdP7WktoQtWSRLyOOjtPeBjLCYC4BOfcEWnUnM1AS6A3mIuf+sO66NleWaBo1/hazSfLVD8E/Kggm3/dlEJnhe1JSpVmj20NeUOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803267; c=relaxed/simple;
	bh=9V2trpZHoMVnskanLK7wUFf5RUsS+s5nAqbxPAFgG64=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type:
	 References; b=XSBRGSvhH3Ptk7ggvh76L2h3nLIhV/lFGtc8Xrhh30Ui+WXraTxSjBhyUjka49X2vB14bnHoH/J5bEx0DkI5kaXcM7HnbvLrk3zu1oj6jrH1jKTO3B27AVJS2DgI6DdYuPVApTZb3EwB8AtsrhPyn0LVtaxMMQ3TypJpgx8/s0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=UGteKbel; arc=none smtp.client-ip=66.163.184.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="UGteKbel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1755803264; bh=/nzoFr+YvL2Tu8XmB3G+NlE/TU6DDMvvI4WM6FcZqAc=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=UGteKbel4TMYanF2csy6l4Flq3M0bE7jSJfDk9QEbf8TDKaKHDQfCkGjAXrl7obG2t2b1Il0BqPcx7fpFwdeguFGo78PR/eCUq4jsAGLu3QFcKgvUgsxPKRdAJ3I6V0VJ9XlOWv156x7usC6+9eWZ+bYLbxtwF42XYdEPS7R097gDNt9K2KK5jCpTfP46DLiGle/mwUBuRqIXXxvkxQdCLWbBq6I0VqbCvSdVhzdLdNdnX3upkIbaA1ps1nqx6Xv9kQ7GW0GOLcZMNZpjJbXuT1gpuV0zPKxfxuphRS8NWAvxV7J7r8d6jO4EwBn68oNwaUrxwO56KLuEq2ocXxh9Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1755803264; bh=heBx5BT1nP/xS9XzwVxHCCSoLuuaCz0P9tznyqgl+dx=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=P6JlaQel5nIgXs9zA+59b/BcxpKFasjrEQGnLvzufBriHwXRdqt1mD06qsqLvJEGyp8ZFml8A17AkDQqdpxHcggdCE4b3DkfFkf2QR4OhUILknFtgMxRI4/S2s2Ilv/TtrQmsWqCdxcXamqgAOHvxlQJ/9xEqOk0dYUgExH7aBtYQUA5ShKqRr7lG0RG7016/AJa8iLHvQI7i5PqcdaY+oEXKI10mWdXKXSKtmUWFDgDRI6irjR5qqfZu6eTzUEKOBuFvHz/KGausg8KrWCP9pUpHRbZ4n4c9UjJxY977XEw2P9wQRyN9DwnG61IC8SD/NcGeBdq5BgPJJoOCp42vQ==
X-YMail-OSG: 1vCt1OoVM1miTB4drB1p0YI2ugbt3ZxwkKGeC_O639UO6kzFSyqt0u2H6_vad.3
 N0YneKBKwvKrsi0YmsrhMrNm6c3Kl0Bq82k2QxU6ENYVvnFWX5i.qZB6IBu7br5Y3ceyp6jPy07n
 xqA4TFglhe3GqZWBKRPkLlkS2Cfl3_p9i8W2amj7HFO..RHA3H9M4323JCOuFhyVJ3l78tW4.Nbh
 PsWI27ESayCqDy0Cj7oD6G1rO_loYWCpqWuRnht5bKRjab4_urgWhPlE7EBxTa_lJ0AzsNqQn.jE
 FofvXGi0W.efM0GjWDd5VFNCmquBooNwt7A7ajC5Xd8506XRMXF2oD4IZAue6p6XVFKlNPg3NS_S
 NYdVvaSsQlMVQB3KHaEFNAEq_nTP9Ik7uTgoM54oAS3CTX2aoClgKsEzyqzcZlp_nPKYZYYrhOEc
 CXpkqNXKQBgNopgbrv7nj3ql6MZN24uNAfo014tFMAZzHHGAH0dT0SXT3Fj8qfIxOKkoq7mbFjkU
 iYDDvF7ArIK7bBpzFbv9X3ioHwzVEblKVaBAkkVrg3cfMqdvjZd1.efi.uBVHOt3jTRDHrTYzyiD
 NWo5Ir2qKHsIWOPAHMxPom4rXP.vZpa7QEBu3D3wYP4i4v4LCcFKsUwzr4z6xQi99Ot1pC13.KVZ
 YKQ9_TipmB6Ubd.hZa9k13ECqB73734KQtdvfVt9HeA7SvVnpLWlxJZyhBpeO1Z.NSdPeBR8Q9Mu
 1hSlMLdmz284PQbQmew5hLJjXJAadfYT0eurpnYr3HxmISmisRc8SQB0NHkCHO5pbjAYIjekIsSU
 DXQPvxkfEgA1ZdW8HqmcnM9RRwzxRRtGrW50Fj.DeLuSwT_QjLvpwFtG3h.J35fUODj78GPmoF8c
 WLqlwRsv55W4J.iUi7j2qeekfjEbiduxFqxrMPsvBn2H29.DGE0Qu.6zvEKEaBwSf6Zr53osvTnH
 MpwPw0jkcTl4tYWxu07TLnnf6sK0UVvCi9.if83vmoEtLng7x1sF5rJYSNyj3iGNt5Bhyjb4SCwJ
 uMe1hmMO_OxLz8x9QIc8zC6a1.PLDQu5Sb31ZnJwEk_CWqKa53eSNh.7FCSi.SsdKxDUuehDXde9
 ZqDw76bQDxiFUlieOaaVsFHndUqmHS0clsn1BUdX_1EnRjkwb3INRThDawLrHNrAlrPVTl3qBLEz
 PSEI6DQZiqghZN62ZzL5K9jAD9e3lNrBpaXDwVQ5Oshx9GabmntgpPDUMxr9KEsnxhAD0Mh4K.5w
 fa1cWNTRueD72B0QHM.JaakjAdNEQyVBGEr.eJaXrRpLR.ZkkzYojeV7QdI7zPgqJptiLqmoml9A
 a4lXZhaj_SL1YFknF3RAPiSAojTLH5hZ4SQXkgJSup5UC64at_1jh5OBZWWE9O1ShXDnAmTWFXOJ
 3NXus4N7zT8CTXCAhGBoKy1TI1F.eEIf5yqE0dH7q0tj2ilwxduYfdk0rpjBw0WFTt9e9XSTCO2T
 kVxKowNPUJvFOF44qSkjwTTJc.nikUB3zsuGsN00GtBmNJe81EyJvzIQPra7sM7yVhCO.MtrTOGe
 s0XoQKo6eKZI6iw_g0aYMQJ_HMEo1K3T5tsz0CFSbNvTTU2M3N5n5HZ_HA1vBf4nTFZKoFbNGF4G
 Fsz9PuqJbDtQjj5U2lsNJdCFMU6a0_jphl3Dw.5TqJG_xT.TWe8dy..4eO.ZmDszgVmeqfhGJAoz
 YY90k_4_UGs1nJX.1GO80y.y2tsVe2.VuaAaDaBoKoPBnXxlKgm7N8r8o2IG6.Fdx_ae0lEw52hr
 kP1_gIF8PYZtRd9LjZJmaEFUeJ2n6nFhq.GQmYaU.LW66qFsYhojOBIpDSEsFjAdycQBvXwKYIDw
 owhVvhTcv.XhKyRP9iF0DxzL4evfuJMUMgXbV17DsYc8noappqjFr3IBE_ABaeTxc3BGG5lavJmc
 hCnVhbHr.d8eJkMvHeDrdEiIW3PO6xiGhy2x0dupTWxFB4rR3QjKvN6pfD6haqfsylpPZJ5wyOb4
 JHhMT172IdAU8WZixEiMP7NecBnmd3hjX411dfZlEbdVJuQN82fQhr17BpmUwfk5tX9JaMVvlqXJ
 vyCmk1LDsod9jp1SVd.d32xLC3Oe.2lSabhek81lnRDUqo70HE52vYjF2R9zxM7I1CXyTpXLPA9B
 7pmuetufs0PS8Dz1GjQ7jg1PaHl1QBM1XO2US4vj8sPxbaKms2JGRLXlB5Y5rGZuyxq8FLxmzPOv
 Oe9vmdEB7ty4SgE6rle1KZnbIVGTPTqGQVczOrj994CXVdoM6sf8WDU9e1pB9giGxCIyW2lhXb6N
 I
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: e2b79cdd-3a6f-451c-b4bb-6e50eb79a6b6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Thu, 21 Aug 2025 19:07:44 +0000
Received: by hermes--production-ne1-9495dc4d7-27szc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6c4baa0885a9ebc6e70c3087d0ca1c31;
          Thu, 21 Aug 2025 18:57:35 +0000 (UTC)
Message-ID: <14bff92f-ba0f-441b-ad0c-241cb4716c33@sbcglobal.net>
Date: Thu, 21 Aug 2025 13:57:34 -0500
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
Subject: repeated 'add chain'/'delete chain' 5x and ...
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <14bff92f-ba0f-441b-ad0c-241cb4716c33.ref@sbcglobal.net>
X-Mailer: WebService/1.1.24338 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

During my vim syntax highlight unit testing... I noticed a behavior of 
'nft' with regard to repeated adding/deleting same two sets of chains 5x.

Running latest nft v1.1.4, Debian 13, Linux 6.12.41+deb13-amd64,

     add table netdev T

     add    chain netdev T A { type filter hook ingress priority -500; 
policy accept; };
     delete chain netdev T A { type filter hook ingress priority -500; 
policy accept; };

     add    chain netdev T A { type filter hook ingress device eno2 
priority -500; policy accept; };
     delete chain netdev T A { type filter hook ingress device eno2 
priority -500; policy accept; };

     add    chain netdev T A { type filter hook ingress priority -500; 
policy accept; };
     delete chain netdev T A { type filter hook ingress priority -500; 
policy accept; };

     add    chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };
     delete chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };

     add    chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };  # ERROR IS HERE
     delete chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };


gets me the following nftables v1.1.4 output:

     $ make check chain-type-netdev.tp.nft
     Checking file: chain-type-netdev.tp.nft
     /opt/nftables/sbin/nft -c -f chain-type-netdev.tp.nft
     chain-type-netdev.tp.nft:17:1-94: Error: Could not process rule: No 
such file or directory
     delete chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };
  
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     make: *** [Makefile:19: check] Error 1


nftables v1.1.3 output is identical:

     $ sudo /usr/sbin/nft -c -f chain-type-netdev.tp.nft
     chain-type-netdev.tp.nft:17:1-94: Error: Could not process rule: No 
such file or directory
     delete chain netdev T A { type filter hook egress device eno2 
priority -500; policy accept; };
  
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is also true of my other Linux platform.
