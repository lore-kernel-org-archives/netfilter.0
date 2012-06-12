From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Conntrack & Unreplied exhausts hashsize
Date: Tue, 12 Jun 2012 07:22:10 -0400
Message-ID: <be60760695706721924e9a5008138b3f@njm.linuxwall.info>
References: <1c26dc9ebe0d0e22d5309b6bc0a73e41@njm.linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:subject:in-reply-to:references:message-id; s=lnw-dkim; bh=mZBzO
	xtFzR7jNPaZsTSt7O9OQUNFpUIo0zU9jOulKSg=; b=l43GtEj+TdaxjQXKi3nhx
	YUFtP3sqEFzxl5mGBvA3ZYzd0zEkoKjSNhJa9ows+Y91wI4bzvAbu4Ef1yhdF5vF
	r1sG61NkPz+cFPSIxQDKB12kx07XMfEZ8tO2zES28szNmS8JGiyQO6+J+V228LE4
	UomyVQGLcrQ3us0kMca6Rk=
In-Reply-To: <1c26dc9ebe0d0e22d5309b6bc0a73e41@njm.linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

On 2012-06-09 16:15, Julien Vehent wrote:
> Very interesting find ! So, what that means is that the 5 days timeout 
> will
> not
> hurt other connections, because unreplied connections will get removed
> automatically if new connections need the spot ?
>
> That would definitely explain why the total of unreplied connection went 
> down
> a
> little bit on June 8th at 4am: http://4u.1nw.eu/conntrack_stat3.png
>
> We did fix other parameters earlier, like enabling tcp_tw_reuse and 
> directing
> localhost traffic to NOTRACK. It would explain why we didn't get more of
> those
> `table full, dropping packet`.
>
> - Julien
>
> On 2012-06-09 14:14, Marco Padovan wrote:
>
>> Looks like it's an intendend behaviour:
>>
>> http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.17 
>> [1]
>>

So, I've been monitoring conntrack for a few days now, and I can definitely 
see the UNREPLIED connections get removed when the space is needed for new 
connections. Which is the intended behavior.

http://4u.1nw.eu/conntrack_stat6.png

However, I still get `nf_conntrack: table full, dropping packet` in my logs 
from time to time. Should I be worried about those ? Are they related to 
conntrack removing UNREPLIED connections ?

# grep conntrack /var/log/kern.log
Jun 10 13:23:42 web-forms1 kernel: [8485564.759240] nf_conntrack: table 
full, dropping packet.
Jun 10 14:01:42 web-forms1 kernel: [8487844.952658] nf_conntrack: table 
full, dropping packet.
Jun 11 07:35:49 web-forms1 kernel: [8551092.298203] nf_conntrack: table 
full, dropping packet.
Jun 11 08:10:56 web-forms1 kernel: [8553199.262974] nf_conntrack: table 
full, dropping packet.
Jun 11 08:10:59 web-forms1 kernel: [8553202.270012] nf_conntrack: table 
full, dropping packet.
Jun 11 08:11:05 web-forms1 kernel: [8553208.270012] nf_conntrack: table 
full, dropping packet.
Jun 11 09:36:23 web-forms1 kernel: [8558325.832413] nf_conntrack: table 
full, dropping packet.
Jun 11 10:09:40 web-forms1 kernel: [8560322.716116] nf_conntrack: table 
full, dropping packet.
Jun 11 10:52:30 web-forms1 kernel: [8562892.668218] nf_conntrack: table 
full, dropping packet.
Jun 11 12:14:34 web-forms1 kernel: [8567817.116556] nf_conntrack: table 
full, dropping packet.
Jun 11 12:29:56 web-forms1 kernel: [8568739.067132] nf_conntrack: table 
full, dropping packet.
Jun 11 15:20:50 web-forms1 kernel: [8578993.309849] nf_conntrack: table 
full, dropping packet.
Jun 11 15:29:18 web-forms1 kernel: [8579500.895662] nf_conntrack: table 
full, dropping packet.
Jun 11 15:29:21 web-forms1 kernel: [8579503.901261] nf_conntrack: table 
full, dropping packet.
Jun 11 15:29:21 web-forms1 kernel: [8579504.043856] nf_conntrack: table 
full, dropping packet.
Jun 11 15:54:59 web-forms1 kernel: [8581042.188246] nf_conntrack: table 
full, dropping packet.
Jun 11 15:55:00 web-forms1 kernel: [8581042.695267] nf_conntrack: table 
full, dropping packet.
Jun 11 21:46:37 web-forms1 kernel: [8602139.638368] nf_conntrack: table 
full, dropping packet.

- Julien

