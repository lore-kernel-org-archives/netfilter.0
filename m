From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Wed, 09 Jul 2008 09:22:03 -0700
Message-ID: <4874E5AB.4070700@tigertech.com>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com> <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu> <4873A605.1010209@tigertech.com> <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> Is the RST segment valid? Could you create a dump file using the '-S' flag 
> of tcpdump so that not relative but absolute sequence numbers are printed?

Sure thing; here's another one with -S:

  http://tigertech.net/20080709.tcpdump.server.txt

-- 
Robert L Mathews, Tiger Technologies
