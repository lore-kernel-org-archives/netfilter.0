From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack sample code
Date: Fri, 29 Aug 2008 12:43:06 +0200
Message-ID: <48B7D2BA.2010300@netfilter.org>
References: <9DC12A28-8B45-444A-9CB7-D130B6BDB123@ncircle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9DC12A28-8B45-444A-9CB7-D130B6BDB123@ncircle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Boyle <jboyle@ncircle.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Joe Boyle wrote:
> 
> Greetings all,
> 
> I'm hoping someone can direct me to either some netfilter conntrack API
> documentation _OR_ a clean implementation of a simple conntrack
> application.  Are there any relatively simple tools out there that
> demonstrate how to use the conntack API?

You mean a sample code of the library use? Get lastest
libnetfilter_conntrack release and check the directory utils/. There are
several examples.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
