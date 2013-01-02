From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Clang static analysis of iptables-1.4.17
Date: Wed, 02 Jan 2013 11:45:46 +0100
Message-ID: <50E40FDA.9030209@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=HmCDd3NDgVZbLDmQ1Vnojr5dW/RhrkZM0hMsKTHyXmg=;
	b=zBQZ6xOA39HMugwb9VcXJ6gHFE5+Fto7E04iIx+OCRvKIS2iPxCt2LYSXHNJNxhcAcYj37Ujgvfr6VyoKqAr9kUrlQLg8Jus9W/AuPxZ3pCJW9eNuv7VBa68+XH4fsDG;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!
Happy New Year!
I created static analysis of iptables-1.4.17 [1]. I'm not programmer I
can't say how accurate it is. I hope it can be more useful for somebody
more familiar with C and iptables.
Regards,
Marcin

[1] - http://mejor.pl/clang-analysis/iptables-1.4.17/
