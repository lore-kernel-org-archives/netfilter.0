From: David Gubler <dg@doodle.com>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Mon, 11 Feb 2013 13:44:07 +0100
Message-ID: <5118E797.40506@doodle.com>
References: <51014395.1000101@doodle.com> <510E4F4C.50202@plouf.fr.eu.org> <510F9B9B.8070907@doodle.com> <51116365.4070801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51116365.4070801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

Sorry for the delay, I only just got around to test it again.

Indeed my testing methodology was flawed. Whenever I test over loopback 
the weird behaviour shows, but when I test over the network it does 
exactly what it's supposed to, just as you said.

So works as designed, probably, and that's exactly what we need. Thanks 
a lot!

Best regards,

David
