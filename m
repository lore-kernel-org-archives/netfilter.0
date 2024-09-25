Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C643AA4
	for <netfilter@vger.kernel.org>; Wed, 25 Sep 2024 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269510; cv=none; b=bKGHBvAfyNUSFzU0t9lRXyCjxNfWn1kZZrkqfhkrGOk3HcI6SyQDQLeBKFi6tvQ/fItApr5HRcuW0KmI6Ut1rT8qgNE4d2jxCekF/TXkL5wPfzoHAah7l+mJjjli72yc+FR94YP8syidalZ2zZd447aEPtEqBShLFQpQk5ZJvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269510; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=sszVDSD3UezjryoFhvLREwe7oFf9SmGMno5LgOzBAsFC+XnKWSCzek7tqTFNAhBaREE3vb7Dk3vh1IK8wUDEubT9Y+6c7NXF+wzgKVYCfdfUFu4W6TdXvFnBM4u6/BVohhgZY/ECXxoMGmcfQJCmPnGdYCv7X1ateE6Jl3hzk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=calivia.com; spf=none smtp.mailfrom=calivia.com; dkim=pass (2048-bit key) header.d=calivia-com.20230601.gappssmtp.com header.i=@calivia-com.20230601.gappssmtp.com header.b=Vnfw5BCe; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=calivia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=calivia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calivia-com.20230601.gappssmtp.com header.i=@calivia-com.20230601.gappssmtp.com header.b="Vnfw5BCe"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso5380391a12.0
        for <netfilter@vger.kernel.org>; Wed, 25 Sep 2024 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=calivia-com.20230601.gappssmtp.com; s=20230601; t=1727269508; x=1727874308; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Vnfw5BCeSeQrVI1cNL4JgbP0h4LHBeDDh70yLQnayHHMywW8YyEanZLTlXnuKr3TMO
         LuqT1VbsOMmCUXYY8Z2nqjChSRq7ntgRUfUQva00Kns4HHrW6Ai0C8rclGyNWb07rkcz
         9J0XRUcW0z1XrilHKoNWHqZXjM8TmKnyEkXaWZ9AykhjcVSK3iUARn2Zs61jjm9sENDh
         K/1nsWKkM2XUxSBu7+tt/Z9H3I2yj7eP6NkZkZwxrOhNqdyLPsEey54AN2c27SjxnP8m
         6f9aUjUNe8ar+CSmIalpW/m2Bq1woiCE7C7JvW1wf6ET4OheoTdk1YHACYE+K9WuMhUY
         Ir+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269508; x=1727874308;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=I4/nayA+dNenOb0HZlUzt9xJI1zaeWVhQnYyO2MihrvvHspl7nZmJqzgx7qeexghu2
         1Ojjar9jwnHdqJ1Ry2kI+xviINx8wQpokB6rf+XyFbVRXWR6PGLlacEztbWvC1gAvlgc
         hLaTJjxvbOumnRzhxoOXqzH90nEqJ7BrnH8kEWuF97Ct6rouNnyeWeRI+sPqGcPKsDQu
         u6pv7gnbGBseOdCNiWZ3t0Sgzrvl5wbjEPsnZ3YJlTtIMEAt2Iic8SoXHQe5WHO/GQ2g
         CBe9LxI4qiyIIsqyaPh93claVgqDjoB/lsez9V/PqSPgKAoWCa5+FfP+mgfXt2UVz21O
         ROYA==
X-Gm-Message-State: AOJu0YyHSsa287WmVI5O/mJhUmlf+WASFNXSl7rv7Fjpy+2P9zPbZ1Z7
	xKIcQJx0Mql+1TG3E4tjk2tK/HDhgJyVWi52LHr0ev7/ojwgvbCdo9bKooDsFTvBtZre/mCzZec
	r
X-Google-Smtp-Source: AGHT+IEaWewe9aODITeJEDFjuMrNb/TrSs7UPqE4Un7CeT2Cbi4gLe5OTSLq1s6h5jcZjctK+6NT1Q==
X-Received: by 2002:a17:90b:48c5:b0:2dd:6969:208e with SMTP id 98e67ed59e1d1-2e06ae25d43mr3291379a91.3.1727269507650;
        Wed, 25 Sep 2024 06:05:07 -0700 (PDT)
Received: from smtpclient.apple (85-195-230-253.fiber7.init7.net. [85.195.230.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e23a135sm1459504a91.39.2024.09.25.06.05.04
        for <netfilter@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2024 06:05:05 -0700 (PDT)
From: michael.steinmann@calivia.com
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: unsubscribe
Message-Id: <9780ACB5-F67C-4CF4-879C-A95D40F5E209@calivia.com>
Date: Wed, 25 Sep 2024 15:04:54 +0200
To: netfilter <netfilter@vger.kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)

