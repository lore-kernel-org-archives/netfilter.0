From: gapsf@yandex.ru
Subject: iptables-restore - does  it breaks existing connections?
Date: Wed, 25 May 2011 10:29:49 +0700
Message-ID: <1748026766.20110525102949@yandex.ru>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1306294190; bh=sYLlCtS96chDrzXYL91DbZ+bDRYN7Dz/GTWgnw1L2EA=;
	h=Date:From:Reply-To:Message-ID:To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=AAmMaVTcks/Hs+tcrAsUEAEzObaCt/LV+yYNRQDhk/HyniWf811xzGU81XTDv7TCi
	 LJnAaWu/544dnCnqYMUNi2AU3IHgkDyaOpGDviQgRk1cR2btxsFaiJw08oPMGPM0dZ
	 O0Zv5/1cCKksWw+0p86sAqGy5GX1yeXh0V1X8lpc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

For example, when (re)loading the same set of rules?

