From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Hot to design syn-flood protection based on ip ?
Date: Tue, 1 Sep 2009 08:58:01 +0200
Message-ID: <20090901085801.428359f0@catlap>
References: <4A967DE2.2060601@infoservices.in>
	<4A9CBF27.1070600@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9CBF27.1070600@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hello,

>Any clue ?

You're on the right track. Just use "hashlimit" module instead of
"limit".Use option "--hashlimit-mode srcip". All necessary info is in
iptables manpage.

Best regards,
Marek
