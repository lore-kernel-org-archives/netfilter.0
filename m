Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A363F18A6AE
	for <netfilter@vger.kernel.org>; Tue,  8 Jul 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751996273; cv=none; b=FW6EyeaTT4vp57LZSXzfslmZnNhCTLwzAx0xi6Fe8Y42pq2SNxUPSVmnLsI6gqAEI1o4lk/2zyxzaSEBdvUcFV5n+B3L3vPW94ljuuaJtKuVciSQICUIxKp5ouPA0T4rAgYEK2zT2ZDL9BMoOC4mjxxqRY+UQ9c9Gkvd3B3illQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751996273; c=relaxed/simple;
	bh=iyqyaLO8cUCO3cUpARryxJbL3hH4OwSS+w8QwTSPOqM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OcRad1YDu7dn4agcrTBEWNXNJR9BUW3fIjC+IMzfzI+2N0gE3d4dIbcjDoOXt+AhB4bi4gd8mE0wTv9Szb38Kh26Vje3kFJwQSDFOOPOpbEDxHTlVU8tm4+MkXmLZnc+dzpeCI22pVh+jakYg5YicEg3qpnmWQ9lNYvTAtO1fKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEQQERV/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEQQERV/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so8564097a12.2
        for <netfilter@vger.kernel.org>; Tue, 08 Jul 2025 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751996270; x=1752601070; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iyqyaLO8cUCO3cUpARryxJbL3hH4OwSS+w8QwTSPOqM=;
        b=bEQQERV/chGKYPNv5+EU7YhvFOaNTyfeLJcVylJvU+mLjYzfB45CAFIVi5pk0JW85l
         koq35dOIneXJ9qA+ReSp55sFswzhvfrKyM9a/aNyNsmrt3FqvQpyt1SgHjhA3CP0FgXV
         81pOn1dnWKoosdklGbOod2uiZzEnOjvvDoHLd9dR78X3p71teJCW973jppAxMVuzOFJP
         /Xy5HRUNfrA9UDNuU1+ELzHlx6bjcLRsf+1/eGTUS8waEgo5XuRxDza4Qtf+t5QAVCU1
         vD1PAuz0D6oODsTpw2898nzQHn2F+GgY/W6y/n6vROME6Favl76cM5TkHX3hrKFqiXS/
         RXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751996270; x=1752601070;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyqyaLO8cUCO3cUpARryxJbL3hH4OwSS+w8QwTSPOqM=;
        b=r8XvRvQs+yBqVXxSq3XQjevqyBds1m5Blx7Q0gqa7ytQaYy9xE5W9rRBU1bWb3sHQ9
         EXInH0JPaRQ/8n8DfUq9ms5ibNxhfBqfbrqmoUpwBec9np7y2OQRGSgUC2XT/n+lmeT1
         aepRRo1QS1wXjL2tFk2nDJqnIIIS3/WiJsh+5eouHSf3VEV8u8O8eCQqsdUKdGN2ZYHj
         0SPiH7JgnPs4/hOW9H8hnxmSnzQIhXo8Ri8/VHywdoPkfePivQkyx7XMLGhkuQ2jk2rE
         nPQ9Z8p5ijPhL5MBVOgLr+RLdxdTInI07kmbQMhPNZUE46rruWlO1zwwbwrKyKZmZdZB
         uB4g==
X-Gm-Message-State: AOJu0Yz+ZHdw0nwZvMhoG+ceVyMtVHqpng/9YWSCU6R6lTaiPofIokg7
	aHRSmLsqUx4rBCajOPOH9isu3DFOtKn1yaUIg6mJi8UTa506cphYpKTpHXqdiVaVvmZqhb1qDWB
	5J46Xvu0z9OBgFRaiiCdCzswGGJN8z6lMNllRJQ==
X-Gm-Gg: ASbGncsr8sAxd18GWlzXI923cLylMK6gIZC9iWH/4oQX4XcZTYQVPaw4Otu5OvBDHVK
	60WgKYRDGjFZe2wqTw9d+k9rsqoyN6n1mWnrFncCbxa935ftLWAMBFYGOE0XsceNc0OrpV5587M
	z1IIXBZ21npF4j3bv76LA3TQU4G3ewPx9ud9VcKF6wFx0=
X-Google-Smtp-Source: AGHT+IFBYne0i9uAChSKHBH5GR/X6K7xnXkBv/b+fw9+4bn5ZLevo5fiGdmkMFTlvA+XIqMcZYlhXIa3uXnXIfHD7Q0=
X-Received: by 2002:a05:6402:26ce:b0:607:f61f:cc1d with SMTP id
 4fb4d7f45d1cf-60fd2fc3f52mr17286909a12.11.1751996269536; Tue, 08 Jul 2025
 10:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0J/QsNCy0LXQuyDQn9GA0LjQsdGL0LvQvtCy?= <pavelpribylov01@gmail.com>
Date: Tue, 8 Jul 2025 20:37:37 +0300
X-Gm-Features: Ac12FXyl9HReF0d7YxmzYNXVYWARJnE3WT_Tvjv2lIIxX3CMoTxG4tarlE9jrn0
Message-ID: <CANnZF1bKkHctvnpG6JnhtMpUzj6FC5crn1bDqt+eq-G_+mR_Eg@mail.gmail.com>
Subject: Question about how Sets work in nftables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello! I'm new to working with nftables. While mastering this tool, I
had a few questions. Can you help me figure them out? 1) How does the
gc-interval parameter work in Sets? And how is it related to timeout?
2) What is the dynamic flag for? The Add, Update, and Delete actions
in the rules work without it. 3) What are performance and memory
policies? Thank you so much for your answers!
