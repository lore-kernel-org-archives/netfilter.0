Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E591EBFF9
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738260425; cv=none; b=Dth+oCJXQ2G5RV2ik9nRjpJpfpd9XMBqR9kNmSG+Vnnh+pq9qH1WHuttusmy98SqrCK4M22mGqzcZ7OxaB917lYMr76qrVg30uYrI3cYVNufqHBwl0VYChTPe/EvPWLv8TIBiWvuqCo+PshghBHAIv8LvKkr9ycKVoYHA6wguHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738260425; c=relaxed/simple;
	bh=U7JFZefQkWtuG9JS0AwadSdYa1njzJLnY7m1qQRNk6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9QwAKuwz0DzIaXa+A2nLcexJ35ABIetHwBkB9ca2e9oBAKWJKu8Dmo2RJi2unUyT+/7nlr2jyHamXAl9Lga/yc4xI9qvDWFtFneGM7vdHyOpXfSaED5yNp+RK5xAvQkEmESpeQ4ZTZhE2YZvZ5emcQ/x6hujVh+58+E4NzvrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=aU2JGA7l; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=AQte13qC; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="aU2JGA7l";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="AQte13qC"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 0791260281; Thu, 30 Jan 2025 19:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738260422;
	bh=eJ60TYgxhUEeH+Ry0XVJFumKzLu1pA+dqPNHYzY8AIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aU2JGA7lq2PiyrXvCukZ3s/l0UdbErX0lCPkFoiRfa4R9eDcz44wtnotInvOsilN6
	 v68lwE3zq1RffMl2QPZ0Typhy/T/V58km47YB03TSUkt+vnKjTtAOip3MCFkRIJJDG
	 rrbVRvSq4orLOklOCyAKF/87UcIvBkUu4hnybnqcjcxNkJtBHa1JMb5QIwbS/E2EzC
	 zUme3KXQne9kfgG0uWk7/U8xFulari/SPyZ1sFjtss+5UDvnPJCvfTYRoeYZpARO4c
	 wbvDqhFWXkz3A9ZLyamN91WJXkkwJzvAwlFeGzSC6jLbV0clQNpBWLodbjY91urKGX
	 c3tMAGtcy/Nuw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 4551960281;
	Thu, 30 Jan 2025 19:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738260421;
	bh=eJ60TYgxhUEeH+Ry0XVJFumKzLu1pA+dqPNHYzY8AIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQte13qCoLYVo9X69jd9fL2CWBlmm7ZkhTyi1utROCjg6fZ6riF1yKQ5yCmS5BYh5
	 O5QWzLIcYv1izEzybksIcpdKlKpApxrMnDmsK90d7ZmCIZB9CFdTK5ZEK3GYJCTu1l
	 y4O8owEh8JOVtHUWdWiRHy1OZXIQ+vsZnPkO1bHWeomYaPXh45u2cB0a3rH6DOBLS6
	 mhTOfc9nCGarM2IsYqG0WrHXZtW9z91YFluE7FpDvSz20FLC1zB/XXXV90VFytpJ5a
	 f7ET6lAUfFP421tDCp7HoT+RmeNSUGPqan9IL/kTqcm76oWvRFCzl5GdXKjmynti/3
	 ltgiP4EBqf9zA==
Date: Thu, 30 Jan 2025 19:06:58 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Alexey Kashavkin <akashavkin@gmail.com>
Cc: netfilter@vger.kernel.org, ssuryaextr@gmail.com
Subject: Re: Clarification of the procedure for filtering IP option fields
Message-ID: <Z5u_wv3bfDkRKLXE@calendula>
References: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
 <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com>
 <Z5u7sji0GX4Hfjci@calendula>
 <Z5u8cNsrlEn5JH5g@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zu3s3DN6NYukA69a"
Content-Disposition: inline
In-Reply-To: <Z5u8cNsrlEn5JH5g@calendula>


--zu3s3DN6NYukA69a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 30, 2025 at 06:52:52PM +0100, Pablo Neira Ayuso wrote:
> On Thu, Jan 30, 2025 at 06:49:41PM +0100, Pablo Neira Ayuso wrote:
> > Hi,
> > 
> > On Thu, Jan 30, 2025 at 04:52:29PM +0300, Alexey Kashavkin wrote:
> > > Hello, 
> > > 
> > > I am still figuring out the syntax for adding rules to filter IP
> > > options. Please, if anyone has an understanding of how this works
> > > give at least a short reply.
> > 
> > This 'type' field is redundant.
> > 
> > > I understand how the exthdr expression works in the kernel code. But
> > > so far there is still a question about specifying the type field,
> > > what is the purpose of this field here? There is also a question
> > > about other fields, let's take for example the IP option LSRR, it
> > > has an addr field. I assume, knowing this option from RFC791 it
> > > specifies IP addresses, but in the case of nft it is not so, this
> > > field has datatype intereger.
> > 
> > Yes, this should be at least 32-bits.
> 
> Actually, this is 32-bits already:
> 
> # nft describe ip option lsrr addr
> exthdr expression, datatype integer (integer), 32 bits

This is what you mean:

# nft describe ip option lsrr addr
exthdr expression, datatype ipv4_addr (IPv4 address) (basetype integer), 32 bits

--zu3s3DN6NYukA69a
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="ip-option-use-ipv4-type.patch"

diff --git a/src/ipopt.c b/src/ipopt.c
index 37f779d468ab..ddb42f5712d4 100644
--- a/src/ipopt.c
+++ b/src/ipopt.c
@@ -24,7 +24,7 @@ static const struct exthdr_desc ipopt_lsrr = {
 		[IPOPT_FIELD_TYPE]		= PHT("type",    0,  8),
 		[IPOPT_FIELD_LENGTH]		= PHT("length",  8,  8),
 		[IPOPT_FIELD_PTR]		= PHT("ptr",    16,  8),
-		[IPOPT_FIELD_ADDR_0]		= PHT("addr",   24, 32),
+		[IPOPT_FIELD_ADDR_0]		= PROTO_HDR_TEMPLATE("addr", &ipaddr_type, BYTEORDER_BIG_ENDIAN, 24, 32),
 	},
 };
 
@@ -35,7 +35,7 @@ static const struct exthdr_desc ipopt_rr = {
 		[IPOPT_FIELD_TYPE]		= PHT("type",   0,   8),
 		[IPOPT_FIELD_LENGTH]		= PHT("length",  8,  8),
 		[IPOPT_FIELD_PTR]		= PHT("ptr",    16,  8),
-		[IPOPT_FIELD_ADDR_0]		= PHT("addr",   24, 32),
+		[IPOPT_FIELD_ADDR_0]		= PROTO_HDR_TEMPLATE("addr", &ipaddr_type, BYTEORDER_BIG_ENDIAN, 24, 32),
 	},
 };
 
@@ -46,7 +46,7 @@ static const struct exthdr_desc ipopt_ssrr = {
 		[IPOPT_FIELD_TYPE]		= PHT("type",   0,   8),
 		[IPOPT_FIELD_LENGTH]		= PHT("length",  8,  8),
 		[IPOPT_FIELD_PTR]		= PHT("ptr",    16,  8),
-		[IPOPT_FIELD_ADDR_0]		= PHT("addr",   24, 32),
+		[IPOPT_FIELD_ADDR_0]		= PROTO_HDR_TEMPLATE("addr", &ipaddr_type, BYTEORDER_BIG_ENDIAN, 24, 32),
 	},
 };
 
@@ -56,7 +56,7 @@ static const struct exthdr_desc ipopt_ra = {
 	.templates	= {
 		[IPOPT_FIELD_TYPE]		= PHT("type",   0,   8),
 		[IPOPT_FIELD_LENGTH]		= PHT("length", 8,   8),
-		[IPOPT_FIELD_VALUE]		= PHT("value",  16, 16),
+		[IPOPT_FIELD_ADDR_0]		= PROTO_HDR_TEMPLATE("addr", &ipaddr_type, BYTEORDER_BIG_ENDIAN, 24, 32),
 	},
 };
 

--zu3s3DN6NYukA69a--
