Received: from telegrapho.inexo.com.br (telegrapho.inexo.com.br [187.17.32.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2EF2571BE
	for <netfilter@vger.kernel.org>; Tue, 11 Nov 2025 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=187.17.32.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888554; cv=none; b=cEzVLMwld6q8c8lpW6cxJznLXAmirUkjVxL0aXROUAIZC9L6scWjUNcRcz2BwwV2/fKo33O5hK/73694rIZOIBPmQGuajpaGXzIt8tnENfNHP+mAfo/xTjhkDL3ZGLO1D+1gd2+AI61+1r82uKM2R4Cv9rL1WjTCzIu3Bys9dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888554; c=relaxed/simple;
	bh=RX1B3+7Y89TuifqiaZjKetirtPV/MEgIwFCWnWp4p64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=QIeeLQjzUbo4Rej9szvYpniapjy4NXudpDQkx6zFovXk6OMqSBHvyXXeZtzOnmgxMogmGRkkDRAou3zM/jM81/FowylWhAxQs6pQpETpJgePItReC3em7nCwrDEzdL9zrkTp14/nTvwAKN57nMwlAZ+0tuNQbiQRwblSyTDJOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inexo.com.br; spf=pass smtp.mailfrom=inexo.com.br; dkim=pass (2048-bit key) header.d=inexo.com.br header.i=@inexo.com.br header.b=ckpi9rDH; arc=none smtp.client-ip=187.17.32.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inexo.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inexo.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inexo.com.br header.i=@inexo.com.br header.b="ckpi9rDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
	s=mail; t=1762887915;
	bh=RX1B3+7Y89TuifqiaZjKetirtPV/MEgIwFCWnWp4p64=;
	h=Date:From:To:Subject:From;
	b=ckpi9rDHZo8i/iNPgons3B8NxlWp4VmsiaxvDTE1b8OxmsvsIWy4GIPQ9/aXSeKaC
	 gN1ThSpe6Vxadm0gIj6F2Nx+H2WdwOTadZY+WxQSsuOLoYZYicnzFyqc0/b9Obp67L
	 qPqdINgXENFrhgE1TMglikzl5ITMK1ysbFQfgH9SzxYnXlCgH3h1/Pt8Z0+ZS94jFL
	 IfMo3X7I2B25gks6+QMijgmhLOlYEtlmA9U/mBvo9UDnCqkeKa9Ra1jKC0wwEJNPtU
	 +p6PwbAGtCOqwQwTJu4alsv6eb/78dCfFjDKiV9L725F+FpKz0vOdULqYQRMeXHOQP
	 /wfoejNE3EB1w==
Received: from pulsar (pulsar.inexo.com.br [187.17.32.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by inexo.com.br (Postfix) with ESMTPSA id D8C6F3E803B4
	for <netfilter@vger.kernel.org>; Tue, 11 Nov 2025 16:05:15 -0300 (-03)
Date: Tue, 11 Nov 2025 16:07:08 -0300
From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: The correct forum
Message-ID: <20251111160708.5cc71e7e@pulsar>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi All

Is this the correct forum to post a problema I am facing in routing on a multi homed Linux router?

Regards

Ethy
