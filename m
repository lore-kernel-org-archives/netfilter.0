From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Round Robin or Random Source NATing
Date: Fri, 25 Feb 2011 00:03:01 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102250002310.22199@obet.zrqbmnf.qr>
References: <4D642A6B.4050806@gmail.com> <4D644BDC.1020107@kickstone.com> <4D65556A.4040709@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D65556A.4040709@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirk Hoganson <kirkhoganson@gmail.com>
Cc: John Lister <john.lister@kickstone.com>, netfilter@vger.kernel.org

On Wednesday 2011-02-23 19:43, Kirk Hoganson wrote:

> Excellent advice.  I was thinking the module used a global counter.

That would only work if counters had a names by which they could 
be referenced.
