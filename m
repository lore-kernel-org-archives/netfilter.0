From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TCP delay, SMTP errors
Date: Mon, 10 Jun 2002 18:18:54 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610221854.GA22998@cannon.eng.us.uu.net>
References: <001601c210bf$d1a5fef0$2901a8c0@amos>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <001601c210bf$d1a5fef0$2901a8c0@amos>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Cassano <nathan@cjhunter.com>
Cc: netfilter@lists.samba.org

Hi Nathan,

First you have to find out what the reason of this delay is. Eg, is this
because of the load on the server or the client or is it because of the
poor layer 2 medium (lots of collisions...) or any other reason.

Are you here implying that the delay is because of the NAT'ed architecture?
What does a simple ping show delay-wise? What is the routing to and from
that external host? Is it assymetric? What happens if you connect to this
external host from the external interface of the firewall itself? Are you
still experiencing delays? Is this only happening with TCP or all types of
packets would have the same delay?

You see, it's not very easy to diagnose your delay problem without answering
to these and (apparently) many other questions.

Ramin

On Mon, Jun 10, 2002 at 01:45:50PM -0700, Nathan Cassano wrote:

> 
> Hi folks,
> 	Our website (on an internal NAT'ed network) connects our email
> server (on an external network). The website uses a SMTP PHP class to
> send mail using socket connections. The problem is a delay in connecting
> to the mail server that causes the class to quit prematurely. I fixed
> the problem by adding a function call to sleep(1) after fsockopen() but
> this is a hack. Is there a better way to fix this TCP delay? I tried
> setting the TOS value to Minimize-Delay but I didn't see any difference.
> Any suggestions are welcome. 
> 
> Nathan
> 
> PHP script 
> <?php
> 
> $this->connection = fsockopen("mail.server.tld", 25, $errno, $errstr,
> 30);
> 
> socket_set_timeout($this->connection, 10, 0);
> 
> $smtp_greeting = fgets($this->connection, 512);
> 
> ?>
> 
> $IPTABLES -A OUTPUT -t mangle -p tcp --dport 25 -j TOS --set-tos
> Minimize-Delay
> 

