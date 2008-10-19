From: Simon <tanstaafl@libertytrek.org>
Subject: Re: Log flooded with these...
Date: Sun, 19 Oct 2008 14:27:47 -0400
Message-ID: <48FB7C23.6000407@libertytrek.org>
References: <48FB4FD8.7090307@libertytrek.org> <48FB64CD.6070205@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FB64CD.6070205@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Ok... whew... found the problem...

I was way too focused on the fact of when these started (right after the
cron job), and was assuming it was a problem on the linux box...

Turned out to be 3 problem entries on the (windows) dhcp server (don't
ask - its not my call)...

Deleted/recreated these, and the flood has stopped...

I would still like to review my rules though, and make a few
modifications so that the windows stuff gets silently dropped...
