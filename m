From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Can be "xt_gateway match" added to xtables-addons?
Date: Fri, 17 Jan 2014 16:35:10 +0100
Message-ID: <52D94DAE.4010705@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=8hrLcZBa+ASFKN1U+Wnb7mW28H2FOWNNuh8TO+pwAKI=;
	b=ediojNIv++6BdevMR2GwkRgxXxFMMdwA4sZOrg/CnukFtL/rF/cWLuuPWWMv9pJElblt0s0hUH4Th8ku02vE2hM+d8uq3WDkLQyi7ML46NOS3aYEp0eQmkvuPXICQK2I;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!
I was looking for a way to count traffic routed to diffrent gateways
through the same interface. I've found module xt_gateway[1] wrote by
Amin Azez and Jan Engelhardt. As I can see it wasn't merged to kernel
and iptables.
Can it be added to xtables-addons?

Marcin

[1] - http://lkml.org/lkml/2007/6/2/85
