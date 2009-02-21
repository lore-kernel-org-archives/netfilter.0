From: Sebastian Roemer <tengaman@wolke7.net>
Subject: [SOLVED] But how then does a transparent proxy works?
Date: Sat, 21 Feb 2009 18:48:00 +0100
Message-ID: <20090221174800.GA3260@localhost>
References: <20090221002718.GA3922@localhost> <bf0e93a30902202011t7391fe73v31017baf89f83bdf@mail.gmail.com> <20090221115959.GA2531@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090221115959.GA2531@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I've found some hints

http://tldp.org/HOWTO/TransparentProxy-4.html:
>The reason is that the mechanism by which the process determines the
>original destination address has changed from linux 2.2, and only
>squid-2.4 has this new code in it. (For those of you who are interested,
>previously the getsockname() call was hacked to provide the original
>destination address, but now the call is getsockopt() with a level of
>SOL_IP and an option of SO_ORIGINAL_DST). 

http://wiki.squid-cache.org/SquidFaq/InterceptionProxy:
>You can usually manually configure browsers to connect to the IP address
>and port which you have specified as intercepted. The only drawback is
>that there will be a very slight (and probably unnoticeable) performance
>hit as a syscall done to see if the connection is intercepted. If no
>interception state is found it is processed just like a normal
>connection.

Thanks for your patience
Sebastian R.
