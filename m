From: Fabio Marcone <fabio.marcone@duet.it>
Subject: info on IMQ and routing
Date: Thu, 23 Jul 2009 12:51:16 +0200
Message-ID: <4A6840A4.5080206@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
I need to understand how are routed packets outgoing from a imq 
interface, because I have a router with some eth interfaces and I need 
to undestand:
- if I have to set up a imq for each eth, or
- if I can set up just one eth and then use tc to create some classes 
and related filters.

What are pros and cons of these choices?

I'm googled around but without success.

thanks in advance,
Fabio



