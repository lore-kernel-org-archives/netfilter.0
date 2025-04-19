Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6C517E
	for <netfilter@vger.kernel.org>; Sat, 19 Apr 2025 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745021591; cv=none; b=KKh/XlWXj7UstJWLMrQcjtSPogHbXFJeu3DaslzVGWHZow1HCiQiWqmihtt9o/5vzAITXzFGuWEupUCQag+ia7qdUP87Gf3DYc+TrXAxFDTubseaxe7IYcjTty1Z0CtLylM/uDd0HkNq1yS3IzuDsydZ98KH0Qs0GizvbdDGTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745021591; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=RRkEAtOjUCwmek5ewJf+L1ORENrpL8XLa0t/aMWS0zx3hPaFZ/IP1DRP6TvUa8zUFyFNfgryCSPFG7Sl4/gHBzs5KCWMhcrmRxrzEXi5tI6+OeXi9S8CIa2wZ1B19bZYW3373xo08GdgWVJ4WumzlQPEhaqR1QCWrWM1r4tuNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3XWa7RK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3XWa7RK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2260c91576aso21536725ad.3
        for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745021587; x=1745626387; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:reply-to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=I3XWa7RKeluKkVGZfYIEe1OuHnLmgN1JZLrgk87dPyeW9lEzAkRh4L8pqeJCMfhn7e
         fRMv3KZQGumq1rDmVn7lBpkrCeEpzTU2TrRmILtF8Zef4yOx4sGjxlNWcH6LIvK7315B
         6wVaAahih1snPLGEY8kltjZTQt8c35cQ41REuwpq02ykn0FszJnjzirnrVWIOSpoN7+E
         ZRubJbcuUd8y5y0y+BQcMgZX/iqefat0wL8QdXTcvouduYJ3yyXi2KFB/qzyRbR/uYLK
         HUhveCDFHpFTy4chCUNOp5MKvEG5wBkj9Lq1gAzWLExfbODC/t+ff+Neh8BS8ReirKBF
         uyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745021587; x=1745626387;
        h=mime-version:user-agent:content-transfer-encoding:date:to:reply-to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=L/xtw7wCVPaIEnSTQBJepS8KPFt5K+sMozvXKwninngDCiRTeUPkynbIT/jpBJzv39
         a3TDq/aZzUUw+160lK+kH233m6x+u9rIPnemMs96j2sHMmpjdT2cM5h0uO8qw8t/kHBj
         gdIRTwyT4xAn8nK1KtYn3HUWCp5jcKeJjb3SHfECksJqcbZfMy/m4xvXgjqOcBfL/jYI
         QPyNzaRJhn8qahWBaULkV6SqH0UL25E3Vi/xEYGTufQ7BCt+PZqI+Ad+qsHn4KDJNGck
         wUvP2SPhZMZd8NqN4ehr3xA96Q2SbxpgRT6DXDc6zXxBz+jKw92pi8jEHcUiNE1WXGio
         H02A==
X-Gm-Message-State: AOJu0Yx01l4iprfi1JLESP49Qu9hP0jS9EZNaj2LFciiiYmfXJV2Pnxl
	YR3pOJ6EIpfiJ2H5YqMPQQRIYF72QJuh7M0vlMkvPFs+2AetOCe1AcewTp+Ta+U=
X-Gm-Gg: ASbGncv9MJw/mFOytU8Y4UZvXeeJn6kDlpJLL1dQsEbVCFBqDv7RsJsOHsD17GImqQx
	4neisUGc9xS6M0jE1N8cDSmMSpVhXmA1h7/fIE/5UPJ9vGX/4qemTV2oj7MgxIc6yha4Ur6RreE
	WN458MFRZbZuQtj3ABwL9g6Mpi1pDLdrgJ23LYDMn8OuZlvbr6mNXW7ZwTuAGocuSJllSTSu7Lj
	qEVVzPxmtK+3yhMEYTDgmWsAEyyEcHZBmBfkqA6z6UKjK4mixS7MJ5yqbSxBoyIZMhjSf9tKKtL
	cCnBhnSXC+PE3kX9FapT3hnVj3yE9/2G6t5S+9uoRXkgYIpfXSFp8VznteMBLAtoJYvtmmp7nXw
	OXGp1yDbhDmwROuhqg1w+Mcrnl2ougw7j8qNFZEl3uQ==
X-Google-Smtp-Source: AGHT+IGVp//AOVSeP1EHYLQXYk4A65MehYtD/WhW/4TS9Ea9mnL6ARqDyvqKlwaH2I5QAxdjqhy5cg==
X-Received: by 2002:a17:902:d48f:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22c535bf828mr57128165ad.23.1745021587554;
        Fri, 18 Apr 2025 17:13:07 -0700 (PDT)
Received: from syn-2603-8001-3b00-2dc7-1aa6-4edf-7268-f785.res6.spectrum.com ([2603:8001:3b00:2dc7:1aa6:4edf:7268:f785])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf398fsm22848245ad.66.2025.04.18.17.13.06
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 17:13:07 -0700 (PDT)
Message-ID: <4f63447dd11d157feadb3e608bd51d8cbe536a3c.camel@gmail.com>
Subject: subscribe
From: bootloader <bootloaderlost@gmail.com>
Reply-To: bootloaderlost@gmail.com
To: netfilter@vger.kernel.org
Date: Fri, 18 Apr 2025 17:13:05 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


