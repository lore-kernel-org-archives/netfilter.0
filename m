From: netfilterdomo.20.miller_2555@spamgourmet.com
Subject: Re: Simple question about ip range
Date: Mon, 29 Jun 2009 17:05:22 -0400
Message-ID: <1dd941090906291405h3b40f821m3b01b2d420ffb990@mail.gmail.com>
References: <2464.89.180.68.200.1246306458.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=RNb+o77uqbCqVYgcaoFkWgYf96pXTs9MGDmlDdyBsEE=;
        b=vasneb6h8stLqNcBDnhJG7xmT3cKB3ZG0o7GP9zZfB9TDRM/TvusekgjvjGhX109UH
         5AhyywwaWO5DqB5jWk9s4E7rDJTxIO6xzrB1zFpVefTkLqhoeC09nG9G8aJ+McvoAnVF
         pdLiH3ds91bAmyyOKaWy/J4d19Mwif47aeeN4=
In-Reply-To: <2464.89.180.68.200.1246306458.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, Jun 29, 2009 at 4:14 PM, Jorge Bastos<mysql.jorge@decimal.pt> wrote:
> Hi people,
> Sorry about this super basic question, how do i specify a ip range? For
> example for a rule like this:
>
> iptables -A INPUT -p tcp --dport 80 -s 192.168.1.211-219 -d 192.168.1.206
> -j ACCEPT
>
> I just want to allow the ip's 192.168.1.211 till .219.
> What would be the correct syntax?
>
> Jorge,

Specify a bitmask (i.e. 192.168.1.211/28) Note: this does not strictly
limit hosts to the .211 to .219 range (the rule will allow .208
through .223...masks require a base-2 host set, so 16 hosts best fit
the number required 8 < 9 < 16). I'd recommend setting subranges to
base-2 hosts as it avoids leaving holes in the IP address space
(unless this is intentional). Otherwise, I think you're locked into
individual specifications, but I'm not as smart as others on this
list...

