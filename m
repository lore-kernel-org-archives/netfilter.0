From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: WARNING: at include/net/dst.h:162
Date: Wed, 21 Sep 2011 10:37:31 +0200
Message-ID: <4E79A24B.5090004@mejor.pl>
References: <4E6DD6C2.60800@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:Message-ID; bh=gCAqC2/UM8ijebltXr4XA89ewEm7cseEoRhwRNSuj5Q=;
	b=nAOTbSsT5yOsonpfIRnb6V7YAKPhiIVos1kSa7j2K3HIDyTfdvfFH3JTc87+Oz+NlHG3mtLqk/cp0o8affmP1lvDHGmdjDPS8y2PhpO6DmWrps2dZBOl/POx0Bur6fqe;
In-Reply-To: <4E6DD6C2.60800@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
with xtables-adddons-1.38 and kernel 3.0.4-hardened-r2 problem doesn't 
appear.
Regards
