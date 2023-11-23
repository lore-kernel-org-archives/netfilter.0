Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAD15BC
	for <netfilter@vger.kernel.org>; Thu, 23 Nov 2023 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="023bHfWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A16C433C7;
	Thu, 23 Nov 2023 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707600;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=023bHfWvr813etv2P1oDgKxiH8+EbeKeixHRotlrlLMhpsS+23r5oDy6xH1kTcNaR
	 5j15NfpbEiOjnozejq1P7i2nl6Zu4J8hwXchAqncKl1X/TftlJfFI0qKelpjQZNynx
	 JsLDrIzYnlfJQlzUxOzljTb8HJNpQR97Kg/K+1nk=
Date: Wed, 22 Nov 2023 21:46:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: netfilter@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-cheerful-masked-degu-ae0507@nitro>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K
