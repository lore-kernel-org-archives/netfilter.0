Received: from sonic309-25.consmr.mail.ne1.yahoo.com (sonic309-25.consmr.mail.ne1.yahoo.com [66.163.184.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845E1853
	for <netfilter@vger.kernel.org>; Sun, 17 Aug 2025 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755398369; cv=none; b=QF/lxCq1yYJJuqNFD2i9HxPvF3zOP+Qw5ccMwDfnpG6JKjgrrvMrdtL9sMugaAWzCV77Z6oK9zqp0cooQgBkGeSSONoTaPRwLQ38kDIYJRofnGTbE5bt57STkvAEqru/lGxzY+h/S+jTZ0n3eXZEu7CMori4YDczf1ngJZKtoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755398369; c=relaxed/simple;
	bh=CcYpb2nlfNoYtuls/SeTgpfTrpTLDo4ojPNBx2MKI/s=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type:
	 References; b=Yn672X/lpMwYiBS8aUmvXe2mTVfdFHeBRXaNA2qvljSbLiLrI2+x8Mg0PcbA+wHvLcD9z9mMgr9CepH5JLMQoF82OeslkknmGp5h0cYLagBCeQTfoiM09KMjyChUKm6Hyd0vykA7MInLlr5+jFRN4cqL8xj/iclreAiWVIpmeoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=Tg6wO3rO; arc=none smtp.client-ip=66.163.184.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="Tg6wO3rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1755398366; bh=rS+EZCaPFSy4rQ1BhotmfJZVYsqlUwSMX29QgjjKFl0=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=Tg6wO3rO83XOmqA6qbdUGaaSXrGWcBIOm4UuKr3fOjN94Dc1OWqf+RBb/6sibTc+86QbToHyY3Y3aOcB7hWdSruf9PMmMUh19D+wLmil/x5rnz7d4GtU9Wqq7+uYald/6KmUEYv/hSVe6iDCnnsVQYaoTRcYz4tkatACve678aULajjIGipK94VXeH3CxjoDdK81uGbBwRe1fAVtC/D9yriLqZdcfONE420Piv+4IxZ8H7oyQ+XxR/f2FnJrUy6eFliPUuznx0Sx/9O/d8bHFIik0UqyHgTgLZrH5Agl8dPcls4yJvnlZHXl6y/OO0iQYCxpWmBoV8u6Z4Anl/wPdg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1755398366; bh=dApMfv2ILpJwwhW+s0S+cMFFj3TY+jPuDZ8+T2+jNNx=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=qd9BYgVWR1UsM40K3ozIkgYYlOvAMg2aMxHNXFXphJFMcM0RqrzDPnh6IKVqilElmKyv+FNgslAwtHRq5a20c505VV4fm2V/1CiSxkp0pH1J3miUw6EDJniXqMahQ/x3BaHePMLoqbd+MgqVvzFj29cGGU3P56DwvthhbujNMqP96TT8j2EGGyXyonyzGR13X/2onQC5QeWYz8V02Bs/Ak93+1ItBs3wSA8USSpSPl/dOHAc4pvvZ9OvTm/nBDJC/Alic9up0gqWums6kYfwo691HHQPZrwPY9EopRUbtdKOsY/YR1zFssfjmU0KULk5IIsHy9X6f6YFzNgmTH8EYg==
X-YMail-OSG: WDwfXwUVM1n4oFRtqsPM0ODUYspHqDcbBKU7xZ4u4WwY7Ghk1zT35EwmGlMdza7
 CBq7bqOoxkve0QQ4PXlbQGCc6sob_p7jc2sZltW0J31JuTQhPsZnPXjwZt4XEszwUPQasLBt8NSj
 Iyp2Ox84OaXhg_IfR2fMrp8t0UTrb.XYB07lddPqMvzDpFNu1w67pYSyXp1wxBR7U3scy7oHhV5_
 .ZAH4WHwgWzHuX8CrS9xCryhIAX1eci1mklY_2oe0L50YCYbRNkGX8BKAE0_rb2nbvAOwD3YzqEu
 k_jf.gfeAICLnme29GOxRldVf7bv2xp_x2JO9_.wJDgwUXTIFNOdsUkbMZQeITbcLU3Qlj.psSyA
 vT3eMobK2EhSMlAbA8NjBkLcICl6.oDtKEajs6C_jC.8E7gEkBdPomLk31EA8lFPJgcAKTgJ82W.
 ixlcHiSgst_259iqa48nMWv_yh3OhNL.BXblrfsEE2Cj5ljh_rYJwCn5xRLdTzWAEMIjFbXXuX22
 09XiwZ4qyMsJ_vdslv2YAwxoCNJW.j_ZUVe9xNv0xhYILxwi4AcOC34R2wWTPQGfg6GR8cqcA64T
 Wa38xLHHtOuJghufiBE9jPbvRUkOE3.UgwsBm687BM745tdPNLvL9qBQnXRFJa2xDeqkC_it6VXZ
 SxoOOkulK1esUsJhL4YPSNC5E8YGIE5n3CyYn47_8rrjMRpWaf1v0JdI_iWWNyFWvsqs4wYICw2f
 ONR8UPhfsoPIE6JbfodGmVs3bcGL8RL2xgQpNCo5jpeEo4sOdTvaqZ.8jeftUPTfO6ZFp0Q_T_4w
 Jqfoq7xLwQTP8WD4xeb2xRGmeo0ecgrmoqvfgvK8xhZtLgYWE8NaEubxXT6lJIpMghidIboMfqHc
 42N2GjwQW8Z6mtmSlMbHMDKGZPFvhfwsvPC6.U2aRTYdUuPD2VtoSkjBNvi5Awk.JeTG9xzghHXK
 CF8aH4uLI5Us3OF49jEKAAIrKgKcOpQFE5O1LUTkbgiC2pw1ZJw.ILWcxiK0dCwo5iwLQWblWmbu
 9nsAASgqHYU2whjKZrNeaHH8iy.up8_3K_U2zAyBszgCR_Euv6lfVM3HX4QjkN2e88icdyHOveRy
 _5TF43QlzW34t..jzdDxU5LlssWFy.OJe1b4TSgd7vyAN36IfvMQZhPFQxgCCBJ4HeYWbzI4AeAx
 qkFAGN08pgJLEyOs3hBjls.WhfJHCKqy34fViGeCs3MhyV1i96CwIZIgXJ0AX9gIW6YyrUHccyEA
 XahgIp2Tvu2AP1UZVl.XUG4I7nETBIwskrFfCrDx_AH.zq_.YKdRBa8l0EOzXP7JASiar09fLU..
 fkupnFtfmbRUbfC4781.ra0s8CHwLXikaLx3dRqGy2uaNwK46gYhSSI2jX9M3JHR28914uQFEAqi
 36yHhDnL5vOjCG4ycPSHxVNfpPYBXDml9UbjJfQFfc1zcc.emSEd6VZUvZmdToCPMw_8NdwoDWlx
 CjhWdGRmUeUYixvEu85mQcGJdnNB5IRT0QatHCeYYYsU51pNEvBLCjvpNH1LN8L6.82AgLxu3ghn
 BuyyS9DHCem3iWDnCfDDur6l.Ey33oT1b4f.58e9MCZPS8aYWZSqtmTqMTH222QRfV7rwUdsDeaA
 rNo91IueZrPJMS56b0SGoNlkraAKeg6ngCqdSkKyJol4f5rMKsuRLO_B0Oyk2ZBKTgjdE651fNjK
 4IKFjQrr6I46JXx4k5Wk1Ywq0m9Vb1LkFwkHNq72FM26.4vWfmA59RY45cO9gUq9EEM_PqZxuJUd
 2I1T8yEuVkFhicl_j5aBbil481Z8Rw29VZD8ENmLgz9nByqOAAJ.uZ_rPE1GPgIt5OGmBqrIbX5W
 _dERzbQXpPamXJB2JkjeuKwTH4ChsMjncn_CQB.VgTTcv7NJUhSYJzJu4uRdTW.A9CKjQgQg2U.W
 rSiBGsIw5jqE4kNPL.3IlvVV1Ihk3Bi0exxGmfLdhnHpUVyVi5WUgpdq707WAlLzM2rjsoIpwsnC
 4CYalzQ8jhHKt1UmYN_7wO6Xl1xWGq8hYmBFAXR63AYNzDfyMdnXEIKWUgyc85.mXnUIVtho_0ze
 b2wADZaJF_ibG_v1zeWAtkziyWKP7XN3WVa22v9uP1PjOSBj0VXMi.vSTe3OcDhdg_LkkNAvku0t
 EYCrm5sFp9DEISZY0uxO03_3K.ye_LDWTxOl9M3NHUYqijlOvWx9.LyzL2lxXspux0WPytFbH7CY
 8tI4HSx42yF_fM0bryWR4eXbjGAb7vts63yPqTb2kgelOMCm8H7ymVqTtZ56TsxapeDihjwGUGiu
 WtJWE58v3yZ73
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: f055aef1-2e69-47f5-910f-596aa5d96234
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sun, 17 Aug 2025 02:39:26 +0000
Received: by hermes--production-ne1-9495dc4d7-vqjq6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7939236a1a207a0bc3393d7d369e1e30;
          Sun, 17 Aug 2025 02:09:03 +0000 (UTC)
Message-ID: <03c6f343-d5c5-45e9-bf8e-b04f703eb111@sbcglobal.net>
Date: Sat, 16 Aug 2025 21:09:02 -0500
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
Subject: 'nft' crashes.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <03c6f343-d5c5-45e9-bf8e-b04f703eb111.ref@sbcglobal.net>
X-Mailer: WebService/1.1.24338 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Mmmmmmm,  a crash in nft CLI.

First noticed in nft 1.1.3, now at nft 1.1.4.  Will try latest HEAD over 
at git.netfilter.org/[libnftnl|nftables].git

Created my own test corpus on 'nft' syntax highlighting.  Was trying 
something wild here (seemingly a valid syntax, according to 
parser_bison.y, but not scanner.c).

Content of add-chain.tp.nft file is:


     define MY_POLICY = deny
     table T { chain C { policy $MY_POLICY; };};


GDB-captured crash dump:

# gdb /opt/nftables/sbin/nft
GNU gdb (Debian 16.3-1) 16.3
(gdb) set args -c -f add-chain.tp.nft
(gdb) b main
Breakpoint 1 at 0x194b0: file src/main.c, line 361.
(gdb) r
Starting program: /opt/nftables/sbin/nft -c -f add-chain.tp.nft

This GDB supports auto-downloading debuginfo from the following URLs:
   <https://debuginfod.debian.net>
Enable debuginfod for this session? (y or [n]) y
Debuginfod has been enabled.
To make this setting permanent, add 'set debuginfod enabled on' to .gdbinit.
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Breakpoint 1, main (argc=4, argv=0x7fffffffc938) at src/main.c:361
361             const struct option *options = get_options();
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
Download failed: Invalid argument.  Continuing without source file 
./build/mpz/../../mpz/export.c.
0x00007ffff7edb6d2 in __gmpz_export (data=0x7fffffffc4f8, 
countp=0x7fffffffc430, order=-1, size=4, endian=0,
     nail=0, z=0x5555556b3440) at ../../mpz/export.c:75
warning: 75     ../../mpz/export.c: No such file or directory
(gdb) bt
#0  0x00007ffff7edb6d2 in __gmpz_export (data=0x7fffffffc4f8, 
countp=0x7fffffffc430, order=-1, size=4,
     endian=0, nail=0, z=0x5555556b3440) at ../../mpz/export.c:75
#1  0x00005555555f25cc in __mpz_export_data (data=0x7fffffffc4f8, 
op=0x5555556b3440,
     byteorder=BYTEORDER_HOST_ENDIAN, len=4) at src/gmputil.c:109
#2  0x0000555555573f62 in mnl_nft_chain_add (ctx=0x7fffffffc5e0, 
cmd=0x55555570aac0, flags=0)
     at src/mnl.c:882
#3  0x000055555559e1bc in do_command_add (ctx=0x7fffffffc5e0, 
cmd=0x55555570aac0, excl=false)
     at src/rule.c:1525
#4  0x00005555555a1814 in do_command (ctx=0x7fffffffc5e0, 
cmd=0x55555570aac0) at src/rule.c:2625
#5  0x000055555556e263 in nft_netlink (nft=0x5555556812a0, 
cmds=0x7fffffffc6e0, msgs=0x7fffffffc6f0)
     at src/libnftables.c:43
#6  0x000055555556fc43 in __nft_run_cmd_from_filename (nft=0x5555556812a0,
     filename=0x7fffffffcce4 "add-chain.tp.nft") at src/libnftables.c:753
#7  0x0000555555570023 in nft_run_cmd_from_filename (nft=0x5555556812a0,
     filename=0x7fffffffcce4 "add-chain.tp.nft") at src/libnftables.c:847
#8  0x000055555556da31 in main (argc=4, argv=0x7fffffffc938) at 
src/main.c:535
(gdb)

